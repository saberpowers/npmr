\name{objectiveFast}
\alias{objectiveFast}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Shortcut computation for NPMR objective function
}
\description{
Computes the objective function for NPMR more quickly than \code{objective} by
leveraging pre-computed fitted values, which is the bottleneck in
computing the objective. Intended for internal use only.
}
\usage{
objectiveFast(B, P, W, lambda)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{B}{
    fitted regression coefficient matrix
}
  \item{P}{
    matrix of fitted multinomial class probabilities
}
  \item{W}{
    vector containing indices of \code{P} which correspond to observed data
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
\code{\link{objective}}, \code{\link{nuclear}}, \code{\link{PGDnpmr}}
}
