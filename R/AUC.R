#' Calculate Area Under Curve AUC
#'
#' @description
#' The function auc produces hourly average AUC for each subject.
#'
#' @usage
#' auc(data, tz="")
#'
#' @param data DataFrame object with column names "id", "time", and "gl", or numeric vector of glucose values.
#' @param tz String value of time zone.
#'
#' @return
#' If a data.frame object is passed, then a tibble object with
#' two columns: subject id and corresponding hourly average AUC value is returned.
#'
#' AUC is calculated for every hour using the trapezoidal rule,
#' then hourly average AUC is calculated for each 24 hour period,
#' then the mean of hourly average AUC across all 24 hour periods
#' is returned as overall hourly average AUC.
#'
#' @export
#'
#' @details
#' A tibble object with 1 row for each subject, a column for subject id and
#' a column for hourly average AUC values is returned. NA glucose values are
#' omitted from the calculation of the AUC.
#'
#' AUC is calculated using the formula: (dt0/60) * ((gl[2:length(gl)] + gl[1:(length(gl)-1)])/2),
#' where dt0/60 is the frequency of the cgm measurements in hours and gl are the glucose values.
#'
#' This formula is based off the Trapezoidal Rule: (time[2]-time[1] * ((glucose[1]+glucose[2])/2)).
#'
#' @references
#' Danne et al. (2017) International Consensus on Use of Continuous Glucose Monitoring,
#' \emph{Diabetes Care} \strong{40} .1631-1640,
#' \doi{10.2337/dc17-1600}.
#'
#' @examples
#' data(example_data_1_subject)
#' auc(example_data_1_subject)
#'


auc <- function (data, tz = "") {

  # this is a helper function that runs on a single person's data
  auc_single <- function(data) {

    gl = id = each_area = daily_area = hours = day = NULL
    rm(list = c("gl", "id", "each_area", "daily_area", "hours", "day"))

    data_ip = CGMS2DayByDay(data, tz = tz)
    # dt0 is the frequency of the cgm measurements, typically 5 min but could be different
    dt0 = data_ip[[3]]
    # this whole part gets our desired output from the data
    out = data %>%
      # this part tidies up the data into 2 columns: day and gl
      dplyr::reframe(
        day = rep(data_ip[[2]], 1440/dt0),
        # the interpolated glucose is input as a vector
        gl = as.vector(t(data_ip[[1]]))
      ) %>%
      # this part finds AUC
      # first we group by day
      dplyr::group_by(day) %>%
      dplyr::reframe(
        # this returns the AUC measurements for each trapezoid
        each_area = (dt0/60) * ((gl[2:length(gl)] +
                                   gl[1:(length(gl)-1)])/2)
      ) %>%
      # here we summarize to daily area, then hourly average
      dplyr::summarise(daily_area = sum(each_area, na.rm = TRUE),
                       # we need the actual hours collected because some data has NA gaps
                       hours = dt0/60 * length(na.omit(each_area)),
                       # then we find the hourly average for each day
                       hourly_avg = daily_area/hours, .groups = "drop")
    return(out)
  }

  gl = id = NULL
  rm(list = c("gl", "id"))

  # here we split the data by id then apply the helper function
  out = data %>%
    dplyr::group_by(id) %>%
    # the overall average for each subject is the mean of their daily hourly average
    dplyr::summarise(hourly_auc = mean(
      auc_single(data.frame(id, gl, time))$hourly_avg))
  # in the end, we return an overall hourly average for each subject
  return(out)
}


