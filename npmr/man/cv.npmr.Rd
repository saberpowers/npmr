\name{cv.npmr}
\alias{cv.npmr}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Cross-validated nuclear penalized multinomial regression
}
\description{
Divide the training data into folds. Hold out each fold and fit NPMR for a
range of regularization values on the remaining data, testing the result on the
held-out fold. After the optimal value of the regularization parameter is
determined, fit NPMR with this tuning parameter to the whole training set.
}
\usage{
cv.npmr(X, Y, lambda = exp(seq(7, -2)), s = 0.1/max(X), eps = 1e-06,
    group = NULL, accelerated = TRUE, B.init = NULL, b.init = NULL,
    foldid = NULL, nfolds = 10)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{X}{
    Covariate matrix. May be in sparse form from \code{Matrix} package
}
  \item{Y}{
    Multinomial reponse. May be (1) a vector of length equal to nrow(X), which
    will be interpreted as a factor, with levels representing response classes;
    or (2) a matrix with nrow(Y) = nrow(X), and each row has exactly one 1
    representing the response class for that observation, with the remaining
    entries of the row being zero.
}
  \item{lambda}{
    Vector of regularization parameter values for penalizing nuclear norm.
    Default is a wide range of values. We suggest that the user choose this
    sequence via trial and error. If the model takes too long to fit, try
    larger values of lambda. If cross validation error is strictly increasing
    or strictly decreasing over the range of lambda specified, try extending
    the range in the direction of the smallest cross validation error.
}
  \item{s}{
    Step size for proximal gradient descent
}
  \item{eps}{
    Convergence threshold. When relative change in the objective function after
    an interation drops below this threshold, algorithm halts.
}
  \item{group}{
    Vector of length equal to number of variables (ncol(X) and nrow(B)).
    Variables in the same group indexed by a POSITIVE integer will be penalized
    together (the nuclear norm of the sub-matrix of the regression coefficients
    will be penalized). Variables without positive integers will NOT be
    penalized. Default is NULL, which means there are no sub-groups; nuclear
    norm of entire coefficient matrix is penalized.
}
  \item{accelerated}{
    Logical. Should accelerated proximal gradient descent be used? Default is
    TRUE.
}
  \item{B.init}{
    Initial value of the regression coefficient matrix for proximal gradient
    descent
}
  \item{b.init}{
    Initial value of the regression intercept vector for proximal gradient
    descent
}
  \item{foldid}{
    Vector of length equal to nrow(X). Specifies folds for cross
    validation.
}
  \item{nfolds}{
    Number of folds for cross validation. Ignored if \code{foldid}
    is specified. Default is 10.
}
}
%\details{
%%  ~~ If necessary, more details than the description above ~~
%}
\value{
    An object of class ``cv.npmr'' with values:
  \item{call}{
the call that produced this object
}
  \item{error}{
    A vector of total cross validation error for each value of \code{lambda}
}
  \item{fit}{
    An object of class \code{\link{npmr}} fitted to the entire training data
    using \code{lambda.min}
}
  \item{lambda.min}{
    The value of lambda with minimum cross validation error
}
  \item{lambda}{
    The input sequence of regularization parameter values for which cross
    validation error was calculated
}
  \item{n}{
    number of rows in the input covariate matrix \code{X}
}
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
\code{\link{npmr}}, \code{\link{predict.cv.npmr}}, \code{\link{print.cv.npmr}},
\code{\link{plot.cv.npmr}}
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

# Produce a biplot:
plot(fit2)

# Compute mean test error using the predict function:
-mean(log(rowSums(Ytest*predict(fit2, Xtest))))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
