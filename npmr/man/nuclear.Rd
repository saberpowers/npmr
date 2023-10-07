\name{nuclear}
\alias{nuclear}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Nuclear norm of a matrix
}
\description{
Returns the nuclear norm of a matrix, which is the sum of its singular values,
obtained through a singular value decomposition. Intended for internal use
only.
}
\usage{
nuclear(B)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{B}{
    a matrix
}
}
%\details{
%%  ~~ If necessary, more details than the description above ~~
%}
\value{
the nuclear norm of the matrix
}
%\references{
%% ~put references to the literature/web site here ~
%}
\author{
Scott Powers, Trevor Hastie, Rob Tibshirani
}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{logL}}, \code{\link{objective}}, \code{\link{objectiveFast}}
}
