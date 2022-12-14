% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/expansions.R
\name{weighted_term}
\alias{weighted_term}
\title{Term for a Basis Matrix for Weighted Term}
\usage{
weighted_term(x, weight)
}
\arguments{
\item{x}{a term type from the package.}

\item{weight}{a symbol for the weight. Notice that the symbol is first
first used when the \code{eval} function on the returned object is called.}
}
\value{
A list with an element called \code{eval}
to evaluate the basis. See \code{\link{VAJointSurv-terms}}.
}
\description{
Creates a weighted basis matrix where the entries are weighted with a
numeric vector to e.g. create a varying-coefficient.
}
\examples{
vals <- c(0.41, 0.29, 0.44, 0.1, 0.18, 0.65, 0.29, 0.85, 0.36, 0.47)

spline_basis <- ns_term(vals, df = 3)
ws <- c(4,5)
# create a weighted term
w_term <- weighted_term(spline_basis, weights)

# evaluate weighted basis at 0.5 and 0.7 with weights 4 and 5
w_term$eval(c(0.5,0.7), newdata = data.frame(weights = ws))
# evaluate the first derivative of weighted basis at 0.5 and 0.7
# with weights 4 and 5
w_term$eval(c(0.5,0.7), newdata = data.frame(weights = ws), der = 1)
}
\seealso{
\code{\link{poly_term}}, \code{\link{bs_term}}, \code{\link{ns_term}}, and
\code{\link{stacked_term}}.
}
