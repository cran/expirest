% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{exp3}
\alias{exp3}
\title{Stability moisture data of three batches}
\format{
A data frame with 33 observations and 3 variables:
\describe{
  \item{Batch}{Factor with levels \code{b1}, \code{b2} and \code{b3}}
  \item{Month}{Numeric representing the time points of testing from the
               start (0 months) to the end (24 months) of the study.}
  \item{Moisture}{Numeric of the measured moisture levels \%(w/w)}
}
}
\source{
See reference: Example data sets shown in Table XIII.
}
\usage{
data(exp3)
}
\description{
A data set containing the moisture stability data (\% (w/w)) of three
batches of a drug product obtained over a 24 months period. A total of
\eqn{n = 33} independent measurements are available (corresponding to data
shown in Table XIII in LeBlond et al. (2011)).
}
\examples{
str(exp3)
}
\references{
LeBlond, D., Griffith, D. and Aubuchon, K. Linear Regression 102: Stability
Shelf Life Estimation Using Analysis of Covariance. \emph{J Valid Technol}
(2011) \strong{17}(3): 47-68.
}
\keyword{datasets}
