% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{CGMS2DayByDay}
\alias{CGMS2DayByDay}
\title{Interpolate glucose value on an equally spaced grid from day to day}
\usage{
CGMS2DayByDay(data, dt0 = NULL, inter_gap = 45, tz = "")
}
\arguments{
\item{data}{DataFrame object with column names "id", "time", and "gl". Should only be data for 1 subject. In case multiple subject ids are detected, a warning is produced and only 1st subject is used.}

\item{dt0}{The time frequency for interpolation in minutes, the default will match the CGM meter's frequency (e.g. 5 min for Dexcom).}

\item{inter_gap}{The maximum allowable gap (in minutes) for interpolation. The values will not be interpolated between the glucose measurements that are more than inter_gap minutes apart. The default value is 45 min.}

\item{tz}{A character string specifying the time zone to be used. System-specific (see \code{\link{as.POSIXct}}), but " " is the current time zone, and "GMT" is UTC (Universal Time, Coordinated). Invalid values are most commonly treated as UTC, on some platforms with a warning.}
}
\value{
A list with
\item{gd2d}{A matrix of glucose values with each row corresponding to a new day, and each column corresponding to time}
\item{actual_dates}{A vector of dates corresponding to the rows of \code{gd2d}}
\item{dt0}{Time frequency of the resulting grid, in minutes}
}
\description{
Interpolate glucose value on an equally spaced grid from day to day
}
\examples{

CGMS2DayByDay(example_data_1_subject)

}
