% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/score_fun_gee.R
\name{score_fun_gee}
\alias{score_fun_gee}
\title{Given estimates from the null model fit and the design matrix for alternative model, find the score statistic (this is used for GEEs only).}
\usage{
score_fun_gee(
  Y = NULL,
  N = NULL,
  n_vec = NULL,
  VS.est_list = NULL,
  AWA.est_list = NULL,
  J2_list = NULL,
  Sigma2_list = NULL,
  J11.inv = NULL,
  JSigma11 = NULL,
  mu.est = NULL,
  V.est = NULL,
  B1 = NULL,
  XA = NULL
)
}
\arguments{
\item{Y}{The response variable. Defaults to NULL.}

\item{N}{The number of clusters. Defaults to NULL.}

\item{n_vec}{A vector consisting of the cluster sizes for each cluster. Defaults to NULL.}

\item{VS.est_list}{A product of matrices. Defaults to NULL.}

\item{AWA.est_list}{A product of matrices. Defaults to NULL.}

\item{J2_list}{A product of matrices. Defaults to NULL.}

\item{Sigma2_list}{A product of matrices. Defaults to NULL.}

\item{J11.inv}{A product of matrices. Defaults to NULL.}

\item{JSigma11}{A product of matrices. Defaults to NULL.}

\item{mu.est}{Estimates of the fitted mean under the null model. Defaults to NULL.}

\item{V.est}{Estimates of the fitted variance under the null model. Defaults to NULL.}

\item{B1}{Design matrix under the null model. Defaults to NULL.}

\item{XA}{Design matrix under the alternative model. Defaults to NULL.}
}
\value{
A calculated score statistic for the null and alternative model when fitting a GEE.
}
\description{
Calculate the score statistic for a GEE model.
}
\references{
Stoklosa, J., Gibb, H. and Warton, D.I. (2014). Fast forward selection for generalized estimating equations with a large number of predictor variables. \emph{Biometrics}, \strong{70}, 110--120.

Stoklosa, J. and Warton, D.I. (2018). A generalized estimating equation approach to multivariate adaptive regression splines. \emph{Journal of Computational and Graphical Statistics}, \strong{27}, 245--253.
}
\seealso{
\code{\link{score_fun_glm}}
}
\author{
Jakub Stoklosa

David I. Warton

Jack R. Leary
}
