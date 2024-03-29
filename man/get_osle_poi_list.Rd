% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utility.R
\name{get_osle_poi_list}
\alias{get_osle_poi_list}
\title{Compile information on worst case batches for ordinary shelf life estimation}
\usage{
get_osle_poi_list(
  data,
  batch_vbl,
  icpt_list,
  model_list,
  sl,
  srch_range,
  alpha = 0.05,
  xform = c("no", "no"),
  shift = c(0, 0),
  ivl = "confidence",
  ivl_type = "one.sided",
  ivl_side = "lower",
  ...
)
}
\arguments{
\item{data}{A data frame with the columns specified by \code{response_vbl},
\code{time_vbl} and \code{batch_vbl}.}

\item{batch_vbl}{A character string that specifies the column in \code{data}
with the grouping information (i.e. a factorial variable) for the
differentiation of the observations of the various batches.}

\item{icpt_list}{A list of four elements named \code{cics}, \code{dics},
\code{dids.pmse} and \code{dids} with the intercepts of each linear
regression model and batch. The \code{cics}, \code{dics} and
\code{dids.pmse} elements are \code{NA} if data of only a single batch
is available.}

\item{model_list}{A list of regression models of different type. Usually,
it is a list of four elements named \code{cics}, \code{dics},
\code{dids.pmse} and \code{dids}, where the first three elements contain
\sQuote{\code{lm}} objects of the \dQuote{common intercept / common slope}
(\code{cics}), \dQuote{different intercept / common slope} (\code{dics})
and \dQuote{different intercept / different slope} (\code{dids.pmse}) type.
The fourth element with the label \code{dids} is usually a list of the
\sQuote{\code{lm}} objects that is obtained from fitting a regression
model to the data of each level of the categorical variable separately.
The \code{dids.pmse} model differs from the \code{dids} model in that it
is a model with the categorical variable as a fixed main effect and with
an interaction term of the categorical variable with the time variable,
i.e. a model where the mean square error is pooled across batches (thus
the \dQuote{pmse} suffix meaning \dQuote{pooled mean square error}). The
\code{cics}, \code{dics} and \code{dids.pmse} elements are \code{NA} if
data of only a single batch is available.}

\item{sl}{A numeric value or a numeric vector of length \code{2} that
specifies the specification limit or limits. If a vector is provided it
must be of the form \code{c(lower limit, upper limit)}.}

\item{srch_range}{A vector of length \code{2} that specifies the end-points
of the (time) range that is supposed to contain the shelf life or retest
period.}

\item{alpha}{A numeric value between 0 and 1 that specifies the significance
level for the calculation of confidence or prediction intervals. The
default is \code{0.05}.}

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

\item{...}{Additional named or unnamed arguments passed on to
\code{uniroot()}.}
}
\value{
A list with the following elements is returned:
\item{all.poi}{A list of the POI values, i.e. a list with one or two list
  elements for the side (i.e. \code{lower} or \code{upper}) of the
  corresponding specification limit, each containing a list returned by the
  \code{\link{get_poi_list}()} function, containing of four elements named
  \code{cics}, \code{dics}, \code{dids.pmse} and \code{dids}. Each of them
  contains a named vector of the POI values estimated for each batch and
  named accordingly.}
\item{poi}{A named vector of the worst case POI values of each model, i.e.
  named \code{cics}, \code{dics}, \code{dids.pmse} and \code{dids}. In
  addition, the vector has an attribute called \code{side} that specifies
  the side of the specification limit which is crossed by the confidence or
  prediction interval at the corresponding POI value.}
\item{wc.icpt}{A named vector of the intercepts of the worst case batches of
  each model, i.e. named \code{cics}, \code{dics}, \code{dids.pmse} and
  \code{dids}. In addition, the vector has an attribute called \code{side}
  that specifies the side of the specification limit which is crossed by the
  confidence or prediction interval at the POI value of the corresponding
  worst case batch.}
\item{which.wc.batch}{A named vector of the indices of the worst case
  batches of each model, i.e. named \code{cics}, \code{dics},
  \code{dids.pmse} and \code{dids}. In addition, the vector has an attribute
  called \code{side} that specifies the side of the specification limit
  which is crossed by the confidence or prediction interval at the POI value
  of the corresponding worst case batch.}
}
\description{
The function \code{get_osle_poi_list()} prepares a list of points of
intersection (POI) for multiple regression models using the
\code{find_poi()} function.
}
\details{
The function \code{get_osle_poi_list()} applies the
\code{find_poi()} function (find the \dQuote{point of intersection}) on
all the models and for each release limit (\code{rl}) provided. With respect
to the latter it differs from the \code{\link{get_poi_list}()} function.
}
\seealso{
\code{\link{get_icpt_list}}, \code{\link{get_model_list}},
\code{\link{get_poi_list}}, \code{\link{get_wc_icpt}},
\code{\link{expirest_osle}}, \code{\link{expirest_wisle}}.
}
\keyword{internal}
