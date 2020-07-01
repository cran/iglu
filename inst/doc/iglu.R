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

## -----------------------------------------------------------------------------
above_percent(example_data_1_subject)

## -----------------------------------------------------------------------------
above_percent(example_data_1_subject$gl)

## -----------------------------------------------------------------------------
above_percent(example_data_1_subject, targets = c(100, 200, 300))

## -----------------------------------------------------------------------------
mage(example_data_5_subject)

## -----------------------------------------------------------------------------
str(CGMS2DayByDay(example_data_1_subject))

## -----------------------------------------------------------------------------
str(CGMS2DayByDay(example_data_1_subject, dt0 = 10))

## ---- eval = F----------------------------------------------------------------
#  CGMS2DayByDay(example_data_1_subject, tz = 'EST')

## ---- cache = T---------------------------------------------------------------
conga(example_data_1_subject, tz = 'EST')

## ---- cache = T---------------------------------------------------------------
sd_measures(example_data_5_subject)

## -----------------------------------------------------------------------------
plot_glu(example_data_1_subject, plottype = 'tsplot', tz = "EST")
plot_glu(example_data_5_subject, plottype = 'tsplot', tz = "EST")

## -----------------------------------------------------------------------------
plot_glu(example_data_5_subject, plottype = 'tsplot', subjects = 'Subject 3', tz = "EST")

## -----------------------------------------------------------------------------
plot_glu(example_data_5_subject, plottype = 'tsplot', subjects = 'Subject 3', LLTR = 80, ULTR = 150, tz = "EST")

## ---- cache = T---------------------------------------------------------------
plot_glu(example_data_5_subject, plottype = 'lasagna', tz = 'EST')

## ---- cache = T---------------------------------------------------------------
plot_glu(example_data_5_subject, plottype = 'lasagna', datatype = 'average', tz = 'EST')

## ---- cache = T---------------------------------------------------------------
plot_glu(example_data_5_subject, plottype = 'lasagna', datatype = 'average', lasagnatype = 'timesorted', tz = 'EST')

## ---- cache = T---------------------------------------------------------------
plot_glu(example_data_1_subject, plottype = 'lasagna', datatype = 'single', lasagnatype = 'unsorted', tz = 'EST')

## ---- cache = T---------------------------------------------------------------
plot_glu(example_data_1_subject, plottype = 'lasagna', datatype = 'single', lasagnatype = 'timesorted', tz = 'EST')


## ---- cache = T---------------------------------------------------------------
plot_lasagna(example_data_5_subject, datatype = 'average', lasagnatype = 'subjectsorted', tz = 'EST')

## ---- cache = T---------------------------------------------------------------
plot_lasagna(example_data_5_subject, datatype = 'average', lasagnatype = 'subjectsorted', LLTR = 100, ULTR = 180, midpoint = 150, limits = c(80, 500), tz = 'EST')

## ---- cache = T---------------------------------------------------------------
plot_lasagna_1subject(example_data_1_subject, lasagnatype = 'unsorted', tz = 'EST')

## ---- cache = T---------------------------------------------------------------
plot_lasagna_1subject(example_data_1_subject, lasagnatype = 'timesorted', tz = 'EST')

## ---- cache = T---------------------------------------------------------------
plot_lasagna_1subject(example_data_1_subject, lasagnatype = 'daysorted', tz = 'EST')

## ---- cache = T---------------------------------------------------------------
plot_lasagna_1subject(example_data_1_subject, lasagnatype = 'daysorted', midpoint = 150, limits = c(80,500), tz = 'EST')

