% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/optimized_iglu_functions.R
\name{optimized_iglu_functions}
\alias{optimized_iglu_functions}
\title{Optimized Calculations of Time Dependent iglu Metrics}
\usage{
optimized_iglu_functions(data, dt0 = NULL, inter_gap = 45, tz = "", timelag = 15, lag = 1)
}
\arguments{
\item{data}{DataFrame object with column names "id", "time", and "gl".}

\item{dt0}{The time frequency for interpolation in minutes, the default will match the CGM meter's frequency (e.g. 5 min for Dexcom).}

\item{inter_gap}{The maximum allowable gap (in minutes) for interpolation. The values will not be interpolated between the glucose measurements that are more than inter_gap minutes apart. The default value is 45 min.}

\item{tz}{A character string specifying the time zone to be used. System-specific (see \code{\link{as.POSIXct}}), but " " is the current time zone, and "GMT" is UTC (Universal Time, Coordinated). Invalid values are most commonly treated as UTC, on some platforms with a warning.}

\item{timelag}{Integer indicating the time period (# minutes) over which rate
of change is calculated. Default is 15, e.g. rate of change is the change in
glucose over the past 15 minutes divided by 15.}

\item{lag}{Integer indicating which lag (# days) to use. Default is 1.}
}
\value{
If a data.frame object is passed, then a tibble object with 1 row for each subject
and one column for each metric is returned.
}
\description{
The function optimized_iglu_functions optimizes the calculation of all time dependent iglu
metrics by extracting the CGMS2DayByDay calculation and passing the result into each function.
}
\details{
Returns a tibble object with 1 row for each subject and a column for each metric. This
function includes time dependent iglu metrics only. For metric specific information,
please see the corresponding function documentation.
}
\examples{
data(example_data_1_subject)
optimized_iglu_functions(example_data_1_subject)

# Pass some arguments to possibly change the defaults
optimized_iglu_functions(example_data_1_subject, dt0 = 5, inter_gap = 30)

data(example_data_5_subject)
optimized_iglu_functions(example_data_5_subject)

}
