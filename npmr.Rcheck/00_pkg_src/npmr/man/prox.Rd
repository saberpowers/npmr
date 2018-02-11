\name{prox}
\alias{prox}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Proximal operator for nuclear norm
}
\description{
Return the value of the proximal operator of the nuclear norm (scaled by
\code{threshold}) applied to a matrix
}
\usage{
prox(B, threshold, group)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{B}{
matrix
}
  \item{threshold}{
scaling factor applied to the nuclear norm. In proximal gradient descent for
NPMR, this is the product of the stepsize and the regularization parameter
lambda
}
  \item{group}{
    Vector of length equal to number of variables, i.e. nrow(B).
    Variables in the same group indexed by a POSITIVE integer will be penalized
    together (the nuclear norm of the sub-matrix of the regression coefficients
    will be penalized). Variables without positive integers will NOT be
    penalized. Default is NULL, which means there are no sub-groups; nuclear
    norm of entire coefficient matrix is penalized.
}
}
%\details{
%%  ~~ If necessary, more details than the description above ~~
%}
\value{
the value of the proximal operator of the nuclear norm (scaled by
\code{threshold}) applied to \code{B}
}
\references{
Neal Parikh and Stephen Boyd (2013) ``Proximal algorithms.'' Foundations and
Trends in Optimization 1, 3:123-231.
}
\author{
Scott Powers, Trevor Hastie, Rob Tibshirani
}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{nuclear}}, \code{\link{PGDnpmr}}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
