\name{plot.npmr}
\alias{plot.npmr}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Visualize the regression coefficient matrix fit by cross-validated NPMR
}
\description{
Plots features (in orange) by their weights on the first two latent variables
in the singular value decomposition of the regression coefficient matrix. Plots
response classes (as blue arrows) by their loadings on the first two latent
variables. Does this for the regression coefficient matrix fit with the
value of lambda closest among all those tried to the value of \code{lambda}
specified.
}
\usage{
\method{plot}{npmr}(x, lambda, feature.names = TRUE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
    an object of class \code{\link{npmr}}
}
  \item{lambda}{
    a single regularization parameter value
}
  \item{feature.names}{
    logical. Should the names of the covariates be used in the plot? If FALSE,
    use standard plotting symbol (\code{pch=1}) instead.
}
  \item{\dots}{
    additional arguments to be passed to \code{plot}
}
}
%\details{
%%  ~~ If necessary, more details than the description above ~~
%}
\references{
Scott Powers, Trevor Hastie and Rob Tibshirani (2016). ``Nuclear penalized
multinomial regression with an application to predicting at bat outcomes in
baseball.'' In prep.
}
\author{
Scott Powers, Trevor Hastie, Rob Tibshirani
}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{npmr}}, \code{\link{plot.cv.npmr}}
}
\examples{
#   Fit NPMR to simulated data

K = 5
n = 1000
m = 10000
p = 10
r = 2

# Simulated training data
set.seed(8369)
A = matrix(rnorm(p*r), p, r)
C = matrix(rnorm(K*r), K, r)
B = tcrossprod(A, C)            # low-rank coefficient matrix
X = matrix(rnorm(n*p), n, p)    # covariate matrix with iid Gaussian entries
eta = X %*% B
P = exp(eta)/rowSums(exp(eta))
Y = t(apply(P, 1, rmultinom, n = 1, size = 1))

# Simulate test data
Xtest = matrix(rnorm(m*p), m, p)
etatest = Xtest %*% B
Ptest = exp(etatest)/rowSums(exp(etatest))
Ytest = t(apply(Ptest, 1, rmultinom, n = 1, size = 1))

# Fit NPMR for a sequence of lambda values without CV:
fit2 = npmr(X, Y, lambda = exp(seq(7, -2)))

# Produce a biplot:
plot(fit2, lambda = 20)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
