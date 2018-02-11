\name{npmr}
\alias{npmr}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Nuclear penalized multinomial regression
}
\description{
Fit a multinomial logistic regression model for a sequence of regularization
parameters penalizing the nuclear norm of the regression coefficient matrix.
}
\usage{
npmr(X, Y, lambda = exp(seq(7, -2)), s = 0.1/max(X), eps = 1e-06, group = NULL,
    accelerated = TRUE, B.init = NULL, b.init = NULL, quiet = TRUE)
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
    larger values of lambda.
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
  \item{quiet}{
    Logical. Should output be silenced? If not, print the value of the
    objective function after each step of proximal gradient descent. Perhaps
    useful for debugging. Default is TRUE.
}
}
\details{
In multinomial regression (in contrast with Gaussian regression or logistic
regression) there is a matrix of regression coefficients, not just a vector.
NPMR fits a logistic multinomial regression with a penalty on the nuclear norm
of this regression coefficient matrix B. Specifically, the objective is

-loglik(B,b|X,Y) + lambda*||B||_*

where ||.||_* denotes the nuclear norm. This implementation solves the problem
using proximal gradient descent, which iteratively steps in the direction of
the negative gradient of the loss function and soft-thresholds the singular
values of the result.

This function makes available the option, through the groups
argument, of dividing the regression coefficient matrix into sub-matrices (by
row) and penalizing the sum of the nuclear norms of these submatrices. Rows
(correspond to variables) can be given no penalty in this way.
}
\value{
    An object of class ``npmr'' with values:
  \item{call}{
the call that produced this object
}
  \item{B}{
    A 3-dimensional array, with dimensions
    (\code{ncol(X), ncol(Y), length(lambda)}).
    For each lambda, this array stores the regression coefficient matrix which
    solves the NPMR optimization problem for that value of lambda.
}
  \item{b}{
    A matrix with \code{ncol(Y)} rows and \code{length(lambda)} columns. Each
    column stores the regression intercept vector which solves the NPMR
    optimization problem for that value of lambda.
}
  \item{objective}{
    A vector of length equal to the length of \code{lambda}, giving the value
    value of the objective for the solution corresponding to each value of
    lambda.
}
  \item{lambda}{
    The input sequence of values for the regularization parameter, for each of
    which NPMR has been solved.
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
\code{\link{cv.npmr}}, \code{\link{predict.npmr}}, \code{\link{print.npmr}},
\code{\link{plot.npmr}}
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

# Print the NPMR fit:
fit2

# Produce a biplot:
plot(fit2, lambda = 20)

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
