## -----------------------------------------------------------------------------
library(iglu)

## ---- cache = T, fig.width = 7------------------------------------------------
plot_glu(example_data_1_subject, plottype = 'lasagna', datatype = "single", tz = 'EST')
plot_glu(example_data_1_subject, plottype = 'lasagna', datatype = "single", color_scheme = "red-orange", tz = 'EST')

## ---- cache = T, fig.width = 7------------------------------------------------
plot_glu(example_data_1_subject, datatype = 'single', plottype = 'lasagna', tz = 'EST')

## ---- cache = T, fig.width = 7------------------------------------------------
plot_glu(example_data_1_subject, plottype = 'lasagna', datatype = 'single', lasagnatype = 'timesorted', tz = 'EST')

## ---- cache = T, fig.width = 7------------------------------------------------
plot_glu(example_data_1_subject, plottype = 'lasagna', datatype = 'average', tz = 'EST')

## ---- cache = T, fig.width = 7------------------------------------------------
plot_glu(example_data_5_subject, plottype = 'lasagna', tz = 'EST')

## ---- cache = T, fig.width = 7------------------------------------------------
plot_glu(example_data_5_subject, plottype = 'lasagna', color_scheme = "red-orange", tz = 'EST')

## ---- cache = T, fig.width = 7------------------------------------------------
plot_glu(example_data_5_subject, plottype = 'lasagna', lasagnatype = 'timesorted', tz = 'EST')

## ---- cache = T, fig.width = 7------------------------------------------------
plot_glu(example_data_5_subject, plottype = 'lasagna', datatype = 'average', tz = 'EST')

## ---- cache = T, fig.width = 7------------------------------------------------
plot_glu(example_data_1_subject, plottype ="lasagna", datatype = "single", inter_gap = 150)

## ---- cache = T, fig.width = 7------------------------------------------------
plot_glu(example_data_1_subject, plottype ="lasagna", datatype = "single", inter_gap = 45)

## ---- cache = T, fig.width = 7------------------------------------------------
plot_glu(example_data_1_subject, plottype ="lasagna", datatype = "single", inter_gap = 15)

## ---- cache = T, fig.width = 7------------------------------------------------
plot_lasagna(example_data_5_subject, datatype = "average", midpoint = 140, limits = c(60,400), tz = 'EST')

## ---- cache = T, fig.width = 7------------------------------------------------
plot_lasagna(example_data_5_subject, datatype = 'average', lasagnatype = 'subjectsorted', tz = 'EST')

## ---- cache = T, fig.width = 7------------------------------------------------
plot_lasagna(example_data_5_subject, datatype = 'average', lasagnatype = 'subjectsorted', LLTR = 100, ULTR = 180, midpoint = 150, limits = c(80, 500), tz = 'EST')

## ---- cache = T, fig.width = 7------------------------------------------------
plot_lasagna_1subject(example_data_1_subject, lasagnatype = 'unsorted', tz = 'EST')

## ---- cache = T, fig.width = 7------------------------------------------------
plot_lasagna_1subject(example_data_1_subject, lasagnatype = 'timesorted', tz = 'EST')

## ---- cache = T, fig.width = 7------------------------------------------------
plot_lasagna_1subject(example_data_1_subject, lasagnatype = 'daysorted', tz = 'EST')

## ---- cache = T, fig.width = 7------------------------------------------------
plot_lasagna_1subject(example_data_1_subject, lasagnatype = 'daysorted', midpoint = 150, limits = c(80,500), tz = 'EST')

