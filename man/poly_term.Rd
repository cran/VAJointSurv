% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/expansions.R
\name{poly_term}
\alias{poly_term}
\title{Term for Orthogonal Polynomials}
\usage{
poly_term(
  x = numeric(),
  degree = 1,
  coefs = NULL,
  raw = FALSE,
  intercept = FALSE,
  use_log = FALSE
)
}
\arguments{
\item{x, degree, coefs, raw}{same as \code{\link{poly}}.}

\item{intercept}{\code{TRUE} if there should be an intercept.}

\item{use_log}{\code{TRUE} if the polynomials should be in the log of the
argument.}
}
\value{
A list like \code{\link{poly}} with an additional element called \code{eval}
to evaluate the basis. See \code{\link{VAJointSurv-terms}}.
}
\description{
Term for Orthogonal Polynomials
}
\examples{
vals <- c(0.41, 0.29, 0.44, 0.1, 0.18, 0.65, 0.29, 0.85, 0.36, 0.47)
spline_basis <- poly_term(vals,degree = 3, raw = TRUE)
# evaluate spline basis at 0.5
spline_basis$eval(0.5)
# evaluate first derivative of spline basis at 0.5
spline_basis$eval(0.5, der = 1)
}
\seealso{
\code{\link{bs_term}}, \code{\link{ns_term}}, \code{\link{weighted_term}}, and
\code{\link{stacked_term}}.
}
