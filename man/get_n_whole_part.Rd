% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utility.R
\name{get_n_whole_part}
\alias{get_n_whole_part}
\title{Get number of digits of whole part (of a decimal number)}
\usage{
get_n_whole_part(x)
}
\arguments{
\item{x}{A decimal number (or an integer) or a vector of decimal numbers (or
of integers).}
}
\value{
An integer representing the number of digits of the whole number
portion of the decimal number that was handed over.
}
\description{
The function \code{get_n_whole_part()} counts the number of digits of the
whole number portion of a decimal number.
}
\details{
The function \code{get_n_whole_part()} counts the number of digits
of the whole number portion of a decimal number.
}
\seealso{
\code{\link{print_val}}, \code{\link{set_limits}},
\code{\link{get_text_annotation}}.
}
\keyword{internal}
