% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/expansions.R
\name{stacked_term}
\alias{stacked_term}
\title{Term for a Basis Matrix for of Different Types of Terms}
\usage{
stacked_term(...)
}
\arguments{
\item{...}{term objects from the package.}
}
\value{
A list with an element called \code{eval}
to evaluate the basis. See \code{\link{VAJointSurv-terms}}.
}
\description{
Creates a basis matrix consisting of different types of terms.
E.g. to create a varying-coefficient.
}
\examples{
vals <- c(0.41, 0.29, 0.44, 0.1, 0.18, 0.65, 0.29, 0.85, 0.36, 0.47)

spline_basis1 <- ns_term(vals, df = 3)
spline_basis2 <- bs_term(vals, df = 3)

# create stacked term from two spline bases
stacked_basis <- stacked_term(spline_basis1, spline_basis2)

# evaluate stacked basis at 0.5
stacked_basis$eval(0.5)
# evaluate first derivative of stacked basis at 0.5
stacked_basis$eval(0.5, der = 1)
}
\seealso{
\code{\link{poly_term}}, \code{\link{bs_term}}, \code{\link{ns_term}}, and
\code{\link{weighted_term}}.
}
