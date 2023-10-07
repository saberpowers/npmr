\name{logL}
\alias{logL}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Log-likelihood for multinomial regression model
}
\description{
Computes the log-likelihood of the fitted regression parameters given the data
observed. Intended for internal use only.
}
\usage{
logL(B, b, X, Y)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{B}{
    Regression coefficient matrix
}
  \item{b}{
    Regression intercept vector
}
  \item{X}{
    Covariate matrix
}
  \item{Y}{
    Multinomial response matrix
}
}
%\details{
%%  ~~ If necessary, more details than the description above ~~
%}
\value{
    The log-likelihood of B and b given X and Y
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
\code{\link{nuclear}}, \code{\link{objective}}
}
