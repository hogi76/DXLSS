% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pre_step.R
\name{prestep2}
\alias{prestep2}
\title{prestep2 - Run preprocessing}
\usage{
prestep2(x, y)
}
\arguments{
\item{x}{dataset}

\item{y}{y_values of dataset}
}
\value{
Returns x dataset excluding missing and outlier values of y
}
\description{
prestep2 - Run preprocessing
}
\examples{
prestep2(pss1,pss1$Firing_range)
}
