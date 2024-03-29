% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utility.R
\name{set_limits}
\alias{set_limits}
\title{Adjustment of limits}
\usage{
set_limits(
  rl,
  rl_sf,
  sl,
  sl_sf,
  sf_option = "tight",
  xform = c("no", "no"),
  shift = c(0, 0),
  ivl_side = "lower"
)
}
\arguments{
\item{sl}{A numeric value or a numeric vector of length \code{2} that
specifies the specification limit or limits. If a vector is provided it
must be of the form \code{c(lower limit, upper limit)}.}

\item{sl_sf}{A positive integer or a vector of positive integers that
specifies the number of \dQuote{significant figures} (sf) of \code{sl}.
It must have the same length as \code{sl}.}

\item{sf_option}{A character string that specifies if the limits (\code{rl}
or \code{sl}) should be regarded as \dQuote{tight} or \dQuote{loose}, i.e.
either \code{"tight"} or \code{"loose"}, respectively. The default is
\code{"tight"}. The option \code{"tight"} means that the limits are
rounded to the number of significant digits specified by the parameters
\code{rl_sf} and \code{sl_sf}. If \code{sf_option = "loose"}, four on
the order of the last significant digit + 1 is added if
\code{ivl_side = "upper"} or five on the order of the last significant
digit + 1 is subtracted if \code{ivl_side = "upper"}.}

\item{xform}{A vector of two character strings that specifies the
transformation of the response and the time variable. The default is
\dQuote{no} transformation, i.e. \code{c("no", "no")}, where the first
element specifies the transformation of the \eqn{x} variable and the
second element the transformation of the \eqn{y} variable. Valid
alternatives for \eqn{x} and/or \eqn{y} variable transformation are
\code{"log"} (natural logarithm), \code{"sqrt"} (square root) and
\code{"sq"} (square).}

\item{shift}{A vector of two values which will be added to the variables
\eqn{x} and/or \eqn{y} before they are transformed as specified by the
\code{xform} parameter, where the first element will be added to the
\eqn{x} variable and the second element to the \eqn{y} variable. The
purpose is to prevent an undefined state which could arise when variables
with values of \eqn{\leq 0} are log or square root transformed. The
default is \code{c(0, 0)}.}

\item{ivl_side}{A character string that specifies if the specification
limit, given that the limit has only one side, is an \dQuote{upper} or a
\dQuote{lower} bound, i.e. it is specified as either \code{"upper"} or
\code{"lower"}, respectively. The default is \code{"lower"}. If the
specification has two boundaries, then this parameter specifies the
preferred side. If no side is preferred over the other, \code{"both"} can
be used.}
}
\value{
A list with the following elements is returned:
\item{sf.option}{A character string that specifies the option concerning the
  significant figures.}
\item{xform}{A vector of two character strings that specifies the
  transformation of the response and the time variable.}
\item{shift}{A vector of two values to be added to the values of the
  transformed \eqn{x} and/or \eqn{y} variables (specified via the
  \code{xform} parameter).}
\item{rl.orig}{A numeric value or a numeric vector of the release limit(s)
  on the original scale. If \code{NA} was passed in, \code{NA} is returned.}
\item{rl.sf}{A numeric value or a numeric vector that specifies the
  significant figures of the release limit(s). If \code{NA} was  passed in,
  \code{NA} is returned.}
\item{rl}{A numeric value or a numeric vector of the adjusted (as specified
  by the \code{sf_option} parameter) release limit(s). If \code{NA} was
  passed in, \code{NA} is returned.}
\item{rl.trfmd}{A numeric value or a numeric vector of the adjusted and
  transformed, if applicable (as specified by the the \code{sf_option}
  parameter and the second element of the \code{xform} parameter,
  respectively), release limit(s), otherwise the same as \code{rl}.}
\item{sl.orig}{A numeric value or a numeric vector of length \code{2} of the
  specification limit(s) on the original scale.}
\item{sl.sf}{A numeric value or a numeric vector of length \code{2}
  that specifies the significant figures of the specification limit(s).}
\item{sl}{A numeric value or a numeric vector of length \code{2} of the
  adjusted (as specified by the \code{sf_option} parameter) specification
  limit(s).}
\item{sl.trfmd}{A numeric value or a numeric vector of length \code{2} of
  the adjusted and transformed, if applicable (as specified by the the
  \code{sf_option} parameter and the second element of the \code{xform}
  parameter, respectively) specification limit(s), otherwise the same as
  \code{sl}.}
}
\description{
The function \code{set_limits()} adjusts the limits according to the number
of relevant decimal places and according to the transformation requirement.
}
\details{
The function \code{set_limits()} adjusts the limits according to
\code{rl_sf} and \code{sl_sf} and, if necessary, transforms the limits
(\code{rl} and \code{sl}) as specified by the parameters \code{xform} and
\code{shift}.
}
\seealso{
\code{\link{expirest_osle}}, \code{\link{expirest_wisle}}.
}
\keyword{internal}
