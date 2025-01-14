## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

library(iglu)
# date: "`r Sys.Date()`"

## -----------------------------------------------------------------------------
data("example_data_1_subject")

## -----------------------------------------------------------------------------
dim(example_data_1_subject)
str(example_data_1_subject)
head(example_data_1_subject)

## -----------------------------------------------------------------------------
data("example_data_5_subject")

## -----------------------------------------------------------------------------
dim(example_data_5_subject)
str(example_data_5_subject)

## ----eval=FALSE---------------------------------------------------------------
# read_raw_data("mydexcomdata.csv", sensor = "dexcom", id = "read")

## ----eval = FALSE-------------------------------------------------------------
# process_data(example_data_5_subject, id = "id", timestamp = "time", glu = "gl")

## ----eval = FALSE-------------------------------------------------------------
# process_data(data, id = "id", timestamp = "time", glu = "gl", time_parser = function(time_string) {strptime(time_string, format = "%d/%m/%Y %H:%M")})

## -----------------------------------------------------------------------------
above_percent(example_data_1_subject)

## -----------------------------------------------------------------------------
above_percent(example_data_1_subject$gl)

## -----------------------------------------------------------------------------
above_percent(example_data_1_subject, targets = c(100, 200, 300))

## -----------------------------------------------------------------------------
hyper_index(example_data_5_subject)

## -----------------------------------------------------------------------------
str(CGMS2DayByDay(example_data_1_subject))

## -----------------------------------------------------------------------------
str(CGMS2DayByDay(example_data_1_subject, dt0 = 10))

## ----eval = F-----------------------------------------------------------------
# CGMS2DayByDay(example_data_1_subject, tz = 'EST')

## ----cache = T----------------------------------------------------------------
conga(example_data_1_subject, tz = 'EST')

## ----cache = T----------------------------------------------------------------
sd_measures(example_data_5_subject)

## -----------------------------------------------------------------------------
calculate_sleep_wake(example_data_1_subject, sd_glu, calculate = "sleep")

## -----------------------------------------------------------------------------
calculate_sleep_wake(example_data_5_subject, sd_measures, sleep_start = 2, sleep_end = 8, calculate = "sleep")

## -----------------------------------------------------------------------------
calculate_sleep_wake(example_data_5_subject, grade, sleep_start = 23, sleep_end = 7, calculate = "wake")

## -----------------------------------------------------------------------------
calculate_sleep_wake(example_data_5_subject, gmi, calculate = "both")

## -----------------------------------------------------------------------------
calculate_sleep_wake(example_data_5_subject, cogi, calculate = "sleep", targets = c(80, 150), weights = c(.3,.2,.5))

## -----------------------------------------------------------------------------
calculate_sleep_wake(example_data_5_subject, grade_eugly, sleep_start = 1, sleep_end = 9, calculate = "both", lower = 80, upper = 150)

## ----fig.width = 7------------------------------------------------------------
plot_glu(example_data_1_subject, plottype = 'tsplot', tz = "EST")
plot_glu(example_data_5_subject, plottype = 'tsplot', tz = "EST")

## ----fig.width = 7------------------------------------------------------------
plot_glu(example_data_5_subject, plottype = 'tsplot', subjects = 'Subject 3', tz = "EST")

## ----fig.width = 7------------------------------------------------------------
plot_glu(example_data_5_subject, plottype = 'tsplot', subjects = 'Subject 3', LLTR = 80, ULTR = 150, tz = "EST")

## ----cache = T, fig.width = 7-------------------------------------------------
plot_roc(example_data_5_subject, subjects = c("Subject 1", "Subject 5"))

## ----cache = T, fig.width = 7-------------------------------------------------
hist_roc(example_data_5_subject, subjects = c("Subject 1", "Subject 5"))

