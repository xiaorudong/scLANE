% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/score_fun_glm.R
\name{score_fun_glm}
\alias{score_fun_glm}
\title{Given estimates from the null model fit and the design matrix for alternative model, find the score statistic (this is used for GLMs only).}
\usage{
score_fun_glm(
  Y = NULL,
  VS.est_list = NULL,
  A_list = NULL,
  B1_list = NULL,
  mu.est = NULL,
  V.est = NULL,
  B1 = NULL,
  XA = NULL
)
}
\arguments{
\item{Y}{The response variable. Defaults to NULL.}

\item{VS.est_list}{A product of matrices. Defaults to NULL.}

\item{A_list}{A product of matrices. Defaults to NULL.}

\item{B1_list}{A product of matrices. Defaults to NULL.}

\item{mu.est}{Estimates of the fitted mean under the null model. Defaults to NULL.}

\item{V.est}{Estimates of the fitted variance under the null model. Defaults to NULL.}

\item{B1}{Design matrix under the null model. Defaults to NULL.}

\item{XA}{Design matrix under the alternative model. Defaults to NULL.}
}
\value{
A calculated score statistic for the null and alternative model when fitting a GLM.
}
\description{
Calculate the score statistic for a GLM model.
}
\references{
Stoklosa, J., Gibb, H. and Warton, D.I. (2014). Fast forward selection for generalized estimating equations with a large number of predictor variables. \emph{Biometrics}, \strong{70}, 110--120.

Stoklosa, J. and Warton, D.I. (2018). A generalized estimating equation approach to multivariate adaptive regression splines. \emph{Journal of Computational and Graphical Statistics}, \strong{27}, 245--253.
}
\author{
Jakub Stoklosa

David I. Warton

Jack R. Leary
}
