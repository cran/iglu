% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_glu.R
\name{plot_glu}
\alias{plot_glu}
\title{Plot time series and lasagna plots of glucose measurements}
\usage{
plot_glu(
  data,
  plottype = c("tsplot", "lasagna"),
  datatype = c("all", "average", "single"),
  lasagnatype = c("unsorted", "timesorted"),
  LLTR = 70,
  ULTR = 180,
  subjects = NULL,
  inter_gap = 45,
  tz = "",
  color_scheme = c("blue-red", "red-orange"),
  log = F,
  static_or_gui = c("ggplot", "plotly")
)
}
\arguments{
\item{data}{DataFrame with column names ("id", "time", and "gl").}

\item{plottype}{\strong{Default: "tsplot".} One of ('tsplot', 'lasagna'). String corresponding to the desired plot type. Options are
'tsplot' for a time series plot and 'lasagna' for a lasagna plot. See the `lasagnatype` parameter for further options corresponding to the 'lasagna' `plottype`.}

\item{datatype}{String corresponding to data aggregation used for plotting, currently supported options are 'all' which plots all glucose measurements within the first \code{maxd} days for each subject, and 'average' which plots average 24 hour glucose values across days for each subject}

\item{lasagnatype}{String corresponding to plot type when using \code{datatype = "average"}, currently supported options are 'unsorted' for an unsorted lasagna plot, 'timesorted' for a lasagna plot with glucose values sorted within each time point across subjects, and '`subjectsorted`' for a lasagna plot with glucose values sorted within each subject across time points.}

\item{LLTR}{\strong{Default: 70.} Lower Limit of Target Range in mg/dL.}

\item{ULTR}{\strong{Default: 180.} Upper Limit of Target Range in mg/dL.}

\item{subjects}{String or list of strings corresponding to subject names in 'id' column of data. Default is all subjects.}

\item{inter_gap}{\strong{Default: 45}. The maximum allowable gap (in minutes). Gaps larger than this will not be connected in the time series plot.}

\item{tz}{A character string specifying the time zone to be used. System-specific (see \code{\link{as.POSIXct}}), but " " is the current time zone, and "GMT" is UTC (Universal Time, Coordinated). Invalid values are most commonly treated as UTC, on some platforms with a warning.}

\item{color_scheme}{\strong{Default: "blue-red".} String corresponding to the chosen color scheme when the `plottype` is 'lasagna'. By default, 'blue-red' scheme is used, with the values below `LLTR` colored in shades of blue, and values above `ULTR` colored in shades of red. The alternative 'red-orange' scheme mimics AGP output from \code{\link{agp}} with low values colored in red, in-range values colored in green, and high values colored in yellow and orange.}

\item{log}{\strong{Default: FALSE.} Boolean indicating whether `log10` of glucose values should be taken.
When `log = TRUE`, the glucose values, LLTR, and ULTR will all be log transformed, and time series plots will
be on a semilogarithmic scale.}

\item{static_or_gui}{\strong{Default: "ggplot".} One of ("ggplot", "plotly"). Returns either a ggplot (static image) or Plotly chart (interactive GUI).}
}
\value{
Any output from the plot object
}
\description{
The function `plot_glu` supports several plotting methods for both single and multiple
subject data.
}
\details{
For the default option `plottype = tsplot`, a time series graph for each subject is
produced with hypo- and hyperglycemia cutoffs shown as horizontal red lines.
The time series plots for all subjects chosen (all by default) are displayed
on a grid.

The 'lasagna' plot type works best when the datatype argument is set to average.
}
\examples{

data(example_data_1_subject)
plot_glu(example_data_1_subject)

data(example_data_5_subject)
plot_glu(example_data_5_subject, subjects = 'Subject 2')
plot_glu(example_data_5_subject, plottype = 'tsplot', tz = 'EST', LLTR = 70, ULTR = 150)
plot_glu(example_data_5_subject, plottype = 'lasagna', lasagnatype = 'timesorted')

}
