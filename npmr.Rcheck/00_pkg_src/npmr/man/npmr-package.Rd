\name{npmr-package}
\alias{npmr-package}
\docType{package}
\title{
Nuclear penalized multinomial regression
}
\description{
As an alternative to an l1- or l2-penalty on multinomial logistic regression,
this package fits multinomial regression with a penalty on the nuclear norm
of the fitted regression coefficient matrix. The result is often a matrix of
reduced rank, leveraging structure among the response classes so that the
likelihood of one class informs the likelihood of other classes. Proximal
gradient descent is used to solve the NPMR optimization problem.
}
\details{
\tabular{ll}{
Package: \tab npmr\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2016-02-05\cr
License: \tab What license is it under?\cr
}
The primary functions in the package are \code{\link{npmr}}, which solves
nuclear penalized multinomial regression for a sequence of input values for the
regularization parameter lambda, and \code{\link{cv.npmr}}, which chooses the
optimal value of the regularization parameter lambda via cross validation. Both
\code{\link{npmr}} and \code{\link{cv.npmr}} have predict and plot methods.
}
\author{
Scott Powers, Trevor Hastie, Rob Tibshirani

Maintainer: Scott Powers <sspowers@stanford.edu>
}
\references{
Scott Powers, Trevor Hastie and Rob Tibshirani (2016). ``Nuclear penalized
multinomial regression with an application to predicting at bat outcomes in
baseball.'' In prep.
}
\keyword{ package }
%\seealso{
%~~ Optional links to other man pages, e.g. ~~
%~~ \code{\link[<pkg>:<pkg>-package]{<pkg>}} ~~
%}
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
