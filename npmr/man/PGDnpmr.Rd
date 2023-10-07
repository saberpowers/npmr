\name{PGDnpmr}
\alias{PGDnpmr}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Proximal gradient descent for nuclear penalized multinomial regression
}
\description{
Iterates steps of proximal gradient descent until convergence, by repeatedly
taking steps in the direction of the negative of the gradient and
soft-thresholding the singular values of the result. Intended for internal use
only.
}
\usage{
PGDnpmr(B, b, X, Y, lambda, s, group = NULL, accelerated = TRUE, eps = 1e-07,
    maxit = 1e+05, quiet = TRUE)
}
\arguments{
  \item{B}{
    Initial regression coefficient matrix
}
  \item{b}{
    Initial intercept vector
}
  \item{X}{
    Covariate matrix. May be in sparse form from \code{Matrix} package
}
  \item{Y}{
    Response matrix. Each row has exactly one 1 indicating response category
    for that observation. All other entries are zero.
}
  \item{lambda}{
    Vector of regularization parameter values for penalizing nuclear norm
}
  \item{s}{
    Step size for proximal gradient descent
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
  \item{eps}{
    Convergence threshold. When relative change in the objective function after
    an interation drops below this threshold, algorithm halts.
}
  \item{maxit}{
    Maximum number of iterations for proximal gradient descent.
}
  \item{quiet}{
    Logical. Should output be silenced? If not, print the value of the
    objective function after each step of proximal gradient descent. Perhaps
    useful for debugging. Default is TRUE.
}
}
%\details{
%%  ~~ If necessary, more details than the description above ~~
%}
\value{
  \item{B}{
    Optimal value of the regression coeffient matrix at convergence
}
  \item{b}{
    Optimal value of the regression intercept vector at convergence
}
  \item{objectivePath}{
    Vector showing the value of the objective function at each step in proximal
    gradient descent
}
  \item{time}{
    Time taken until convergence
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
\code{\link{npmr}}, \code{\link{prox}}, \code{\link{objective}},
\code{\link{objectiveFast}}
}
%\examples{
%}
