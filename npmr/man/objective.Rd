\name{objective}
\alias{objective}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
NPMR objective function
}
\description{
Return the objective function of the data and the fitted parameters for nuclear
penalized multinomial regression. The objective is the sum of the negative
log-likelihood and the product of the regularization parameter and nuclear norm
of the fitted regression coefficient matrix. Intended for internal use only.
}
\usage{
objective(B, b, X, Y, lambda)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{B}{
    fitted regression coefficient matrix
}
  \item{b}{
    fitted regression intercept vector
}
  \item{X}{
    covariate matrix
}
  \item{Y}{
    multinomial response matrix
}
  \item{lambda}{
    regularization parameter (maybe be a vector of values)
}
}
%\details{
%%  ~~ If necessary, more details than the description above ~~
%}
\value{
a vector of objective values for the NPMR optimization problem, one for each
value of \code{lambda}
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
\code{\link{logL}}, \code{\link{nuclear}}, \code{\link{objectiveFast}}
}
