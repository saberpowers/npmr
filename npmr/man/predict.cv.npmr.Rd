\name{predict.cv.npmr}
\alias{predict.cv.npmr}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Make predictions from a ``cv.npmr'' object
}
\description{
Return predicted reponse class probabilities from a cross-validated NPMR model,
using the value of the regularization parameter that led to the minimum
cross validation error
}
\usage{
\method{predict}{cv.npmr}(object, newx, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{
    an object of class \code{\link{cv.npmr}}
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
a matrix giving the predicted probability that each row of \code{newx} belongs
to each class, corresponding the value of the regularization parameter that led
to minimum cross validation error.
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
\code{\link{cv.npmr}}, \code{\link{predict.npmr}}
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
fold = sample(rep(1:10, length = nrow(X)))

# Simulate test data
Xtest = matrix(rnorm(m*p), m, p)
etatest = Xtest %*% B
Ptest = exp(etatest)/rowSums(exp(etatest))
Ytest = t(apply(Ptest, 1, rmultinom, n = 1, size = 1))

# Fit NPMR for a sequence of lambda values without CV:
fit2 = cv.npmr(X, Y, lambda = exp(seq(7, -2)), foldid = fold)

# Compute mean test error using the predict function:
-mean(log(rowSums(Ytest*predict(fit2, Xtest))))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
