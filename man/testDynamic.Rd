% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/testDynamic.R
\name{testDynamic}
\alias{testDynamic}
\title{Test whether a gene is dynamic over pseudotime.}
\usage{
testDynamic(
  expr.mat = NULL,
  pt = NULL,
  genes = NULL,
  size.factor.offset = NULL,
  is.gee = FALSE,
  cor.structure = "ar1",
  gee.bias.correction.method = NULL,
  gee.test = "wald",
  is.glmm = FALSE,
  glmm.adaptive = TRUE,
  id.vec = NULL,
  n.potential.basis.fns = 5,
  n.cores = 4L,
  approx.knot = TRUE,
  verbose = TRUE,
  random.seed = 312
)
}
\arguments{
\item{expr.mat}{Either a \code{SingleCellExperiment}, \code{Seurat}, or \code{CellDataSet} object from which counts can be extracted, or a matrix of integer-valued counts with genes as rows & cells as columns. Defaults to NULL.}

\item{pt}{Either the output from \code{\link[slingshot]{SlingshotDataSet}} object from which pseudotime can be generated, or a data.frame containing the pseudotime or latent time estimates for each cell (can be multiple columns / lineages). Defaults to NULL.}

\item{genes}{A character vector of genes to model. If not provided, defaults to all genes in \code{expr.mat}. Defaults to NULL.}

\item{size.factor.offset}{(Optional) An offset to be included in the final model fit. Can be generated easily with \code{\link{createCellOffset}}. Defaults to NULL.}

\item{is.gee}{Should a GEE framework be used instead of the default GLM? Defaults to FALSE.}

\item{cor.structure}{If the GEE framework is used, specifies the desired working correlation structure. Must be one of "ar1", "independence", or "exchangeable". Defaults to "ar1".}

\item{gee.bias.correction.method}{(Optional) Specify which small-sample bias correction to be used on the sandwich variance-covariance matrix prior to test statistic estimation. Options are "kc" and "df". Defaults to NULL, indicating the use of the model-based variance.}

\item{gee.test}{A string specifying the type of test used to estimate the significance of the full model. Must be one of "wald" or "score". Defaults to "wald".}

\item{is.glmm}{Should a GLMM framework be used instead of the default GLM? Defaults to FALSE.}

\item{glmm.adaptive}{(Optional) Should the basis functions for the GLMM be chosen adaptively? If not, uses 4 evenly spaced knots. Defaults to TRUE.}

\item{id.vec}{If a GEE or GLMM framework is being used, a vector of subject IDs to use as input to \code{\link[geeM]{geem}} or \code{\link[glmmTMB]{glmmTMB}}. Defaults to NULL.}

\item{n.potential.basis.fns}{(Optional) The maximum number of possible basis functions. See the parameter \code{M} in \code{\link{marge2}}. Defaults to 5.}

\item{n.cores}{(Optional) If running in parallel, how many cores should be used? Defaults to 4L.}

\item{approx.knot}{(Optional) Should the knot space be reduced in order to improve computation time? Defaults to TRUE.}

\item{verbose}{(Optional) A boolean indicating whether a progress bar should be printed to the console. Defaults to TRUE.}

\item{random.seed}{(Optional) The random seed used to initialize RNG streams in parallel. Defaults to 312.}
}
\value{
A list of lists, where each element is a gene and each gene contains sublists for each lineage. Each gene-lineage sublist contains a gene name, lineage number, default \code{marge} vs. null model test results, model statistics, and fitted values. Use \code{\link{getResultsDE}} to tidy the results.
}
\description{
This function tests whether a NB \code{marge} model is better than a null (intercept-only) model using the Likelihood Ratio Test. In effect, the test tells us whether a gene's expression changes (in any way) over pseudotime.
}
\details{
\itemize{
\item If \code{expr.mat} is a \code{Seurat} object, counts will be extracted from the output of \code{\link[SeuratObject]{DefaultAssay}}. If using this functionality, check to ensure the specified assay is correct before running the function. If the input is a \code{SingleCellExperiment} or \code{CellDataSet} object, the raw counts will be extracted with \code{\link[BiocGenerics]{counts}}.
\item If using the GEE or GLMM model architectures, ensure that the observations are sorted by subject ID (this is assumed by the underlying fit implementations). If they are not, the models will error out.
\item If \code{gee.bias.correction.method} is set to "kc" or "df", a bias adjustment will be used to inflate the robust variance-covariance matrix prior to estimating the Wald test statistic. This is useful when the number of subjects is small and / or the number of per-subject observations is very large. Doing so will remove the bias in the sandwich estimator in small-sample cases. Currently, we suggest keeping this NULL and using the model-based variance estimates and specifying the "ar1" correlation structure.
}
}
\examples{
data(sim_counts)
data(sim_pseudotime)
cell_offset <- createCellOffset(sim_counts)
scLANE_models <- testDynamic(sim_counts,
                             pt = sim_pseudotime,
                             size.factor.offset = cell_offset,
                             n.cores = 1L)
}
\seealso{
\code{\link{getResultsDE}}

\code{\link{testSlope}}

\code{\link{marge2}}

\code{\link[MASS]{glm.nb}}

\code{\link[geeM]{geem}}

\code{\link[glmmTMB]{glmmTMB}}
}
\author{
Jack R. Leary
}
