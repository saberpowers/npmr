\name{predict.npmr}
\alias{predict.npmr}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Make predictions from a ``npmr'' object
}
\description{
Return predicted reponse class probabilities from a fitted NPMR model,
for each value of lambda on which the NPMR model was originally fit.
}
\usage{
\method{predict}{npmr}(object, newx, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{
    an object of class \code{\link{npmr}}
}
  \item{newx}{
    covariate matrix on which for which to make response class probability
    predictions. Must have same number of columns as \code{X} used original to
    fit \code{object}.
}
  \item{\dots}{
    ignored
}
}
%\details{
%%  ~~ If necessary, more details than the description above ~~
%}
\value{
a 3-dimensional array, with dimensions
    (\code{nrow(newx), ncol(Y), length(lambda)}).
    For each lambda, this array stores for that value of lambda the predicted
    response class probabilites for each observation.
}
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
\code{\link{npmr}}, \code{\link{predict.cv.npmr}}
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

# Compute mean test error using the predict function (for each value of lambda):
getloss = function(pred, Y) {
    -mean(log(rowSums(Y*pred)))
}
apply(predict(fit2, Xtest), 3, getloss, Ytest)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
