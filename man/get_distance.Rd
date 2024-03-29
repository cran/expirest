% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utility.R
\name{get_distance}
\alias{get_distance}
\title{Determine distance of lines}
\usage{
get_distance(
  x_new,
  model,
  sl,
  mode = "minimal",
  alpha = 0.05,
  ivl = "confidence",
  ivl_type = "one.sided",
  ivl_side = "lower"
)
}
\arguments{
\item{x_new}{A numeric value of \eqn{x} for which the distance between two
lines is sought, e.g. the distance of upper or lower confidence/prediction
interval limits from the upper or lower specification or expiry limits,
respectively.}

\item{model}{A linear model object of type \sQuote{\code{lm}}.}

\item{sl}{A numeric variable that specifies the \dQuote{specification limit}
(SL) or, for determinations according to ARGPM guidance \dQuote{Stability
testing for prescription medicines}, the \dQuote{expiry limit} (EL). The
EL is defined as the intercept \eqn{\pm} the difference between the
specification limit and the release limit (RL). If it is the upper limit
which is the relevant limit, it is added (\code{+}) to the intercept,
otherwise it is subtracted (\code{-}) from the intercept.}

\item{mode}{A character string of either \code{"minimal"} or \code{"all"},
that specifies if only the minimal distance of a factor regression model
is returned or if the distances of all lines belonging to the different
factor levels is returned. The default is \code{"minimal"}.}

\item{alpha}{A numeric value between 0 and 1 that specifies the significance
level for the calculation of confidence or prediction intervals. The
default is \code{0.05}.}

\item{ivl}{A character string of either \code{"confidence"} or
\code{"prediction"} that specifies the type of interval of interest.
The default is \code{"confidence"}.}

\item{ivl_type}{A character string that specifies if a \dQuote{one sided}
or a \dQuote{two sided} interval should be calculated, i.e. either
\code{"one.sided"} or \code{"two.sided"}, respectively. The default is
\code{"one.sided"}.}

\item{ivl_side}{A character string that specifies if the specification
limit, given that the limit has only one side, is an \dQuote{upper} or a
\dQuote{lower} bound, i.e. it is specified as either \code{"upper"} or
\code{"lower"}, respectively. The default is \code{"lower"}. If the
specification has two boundaries, then this parameter specifies the
preferred side. If no side is preferred over the other, \code{"both"} can
be used.}
}
\value{
A numeric value representing the distance of the respective lines
is returned.
}
\description{
The function \code{get_distance()} calculates the distance between two
lines at a given value of \eqn{x}.
}
\details{
The function \code{find_get_distance()} estimates the distance
between the upper or lower confidence or prediction interval and the upper
or lower acceptance criterion (i.e. the specification or the expiry limit)
at a certain value of \code{x_new}. The confidence or prediction interval
is calculated for the linear regression model provided by \code{model}.
Recommendations on how to estimate shelf life or expiry can be found in the
corresponding section below.
}
\section{How to estimate shelf life or expiry}{

ICH Q1E recommends that \dQuote{\emph{For an attribute known to decrease with
time, the lower one-sided 95 percent confidence limit should be compared
to the acceptance criterion. For an attribute known to increase with time,
the upper one-sided 95 percent confidence limit should be compared to the
acceptance criterion. For an attribute that can either increase or decrease,
or whose direction of change is not known, two-sided 95 percent confidence
limits should be calculated and compared to the upper and lower acceptance
criteria.}} Since attributes often either decrease or increase, the default
for \code{ivl_type} is \code{one.sided}.

According to the ARGPM guidance \dQuote{Stability testing for prescription
medicines}, the shelf life or expiry limit is estimated as the point where
the upper or lower limit of the 95\% confidence interval of the linear model
fitted to the data intersects the worst case scenario limit. The worst case
scenario limit is obtained by adding/subtracting the absolute difference of
specification limit and release limit to/from the common intercept of the
test batches or the intercept of the worst performing batch.
}

\references{
Therapeutic Goods Administration (TGA) of the Department of Health of the
Australian Government, Australian Regulatory Guidelines for Prescription
Medicines (ARGPM), Stability testing for prescription medicines,
Version 1.1, March 2017

International Council for Harmonisation of Technical Requirements for
Registration of Pharmaceuticals for Human (ICH), Harmonised Tripartite
Guideline, Evaluation of Stability Data Q1E, step 4, February 2003
(CPMP/ICH/420/02).
}
\seealso{
\code{\link{get_intvl_limit}}, \code{\link{find_poi}},
\code{\link{expirest_osle}}, \code{\link{expirest_wisle}},
\code{\link[stats]{lm}}.
}
\keyword{internal}
