\name{print.cv.npmr}
\alias{print.cv.npmr}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
summarize a "cv.npmr" object
}
\description{
Print (1) the call that produced the \code{\link{cv.npmr}} object;
(2) the value of the regularization parameter lambda that led to the
minimum cross validation error; (3) the rank of the fitted regression
coefficient matrix; and (4) the per-observation cross validation error using
the optimal lambda.
}
\usage{
\method{print}{cv.npmr}(x, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
    an object of class \code{\link{cv.npmr}}
}
  \item{\dots}{
    ignored
}
}
%\details{
%%  ~~ If necessary, more details than the description above ~~
%}
%\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
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
\code{\link{cv.npmr}}, \code{\link{print.npmr}}
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

# Print the NPMR fit:
fit2
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
