% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/joint_surv_VA.R
\name{joint_ms_set_vcov}
\alias{joint_ms_set_vcov}
\title{Sets the Covariance Parameters}
\usage{
joint_ms_set_vcov(
  object,
  vcov_vary,
  vcov_surv,
  par = object$start_val,
  va_mean = NULL
)
}
\arguments{
\item{object}{a joint_ms object from \code{\link{joint_ms_ptr}}.}

\item{vcov_vary}{the covariance matrix for the time-varying effects.}

\item{vcov_surv}{the covariance matrix for the frailties.}

\item{par}{parameter vector to be formatted.}

\item{va_mean}{a matrix with the number of rows equal to the number of
random effects per observation and the number of columns is the number
of observations. The order for the observations needs to be the same as the
\code{id} element of \code{object}.}
}
\value{
Numeric vector with model parameters.
}
\description{
Sets the covariance matrices to the passed values. The function also sets
covariance matrices for the variational distributions to the same values.
}
\examples{
# load in the data
library(survival)
data(pbc, package = "survival")

# re-scale by year
pbcseq <- transform(pbcseq, day_use = day / 365.25)
pbc <- transform(pbc, time_use = time / 365.25)

# create the marker terms
m1 <- marker_term(
  log(bili) ~ 1, id = id, data = pbcseq,
  time_fixef = bs_term(day_use, df = 5L),
  time_rng = poly_term(day_use, degree = 1L, raw = TRUE, intercept = TRUE))
m2 <- marker_term(
  albumin ~ 1, id = id, data = pbcseq,
  time_fixef = bs_term(day_use, df = 5L),
  time_rng = poly_term(day_use, degree = 1L, raw = TRUE, intercept = TRUE))

# base knots on observed event times
bs_term_knots <-
  with(pbc, quantile(time_use[status == 2], probs = seq(0, 1, by = .2)))

boundary <- c(bs_term_knots[ c(1, length(bs_term_knots))])
interior <- c(bs_term_knots[-c(1, length(bs_term_knots))])

# create the survival term
s_term <- surv_term(
  Surv(time_use, status == 2) ~ 1, id = id, data = pbc,
  time_fixef = bs_term(time_use, Boundary.knots = boundary, knots = interior))

# create the C++ object to do the fitting
model_ptr <- joint_ms_ptr(
  markers = list(m1, m2), survival_terms = s_term,
  max_threads = 2L, ders = list(0L, c(0L, -1L)))

# compute var-covar matrices with the first set of starting values
joint_ms_format(object = model_ptr)$vcov
joint_ms_va_par(object = model_ptr)[[1]]

# altering var-covar matrices
alter_pars <- joint_ms_set_vcov(
  object = model_ptr,
  vcov_vary = diag(1:4),
  vcov_surv = matrix(0,0,0))

# altered var-covar matrices
joint_ms_format(object = model_ptr, par = alter_pars)$vcov
joint_ms_va_par(object = model_ptr, par = alter_pars)[[1]]
}
