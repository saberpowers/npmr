\name{Vowel}
\alias{Vowel}
\docType{data}
\title{
Vowel Recognition
}
\description{
Speaker independent recognition of the eleven steady state vowels
of British English using a specified training set of lpc derived log area
ratios.
}
%\usage{data("Vowel")}
\format{
  A data frame with 990 observations on the following 12 variables.
  \describe{
    \item{\code{y}}{Class label indicating vowel spoken}
    \item{\code{subset}}{a factor with levels \code{test} \code{train}}
    \item{\code{x.1}}{a numeric vector}
    \item{\code{x.2}}{a numeric vector}
    \item{\code{x.3}}{a numeric vector}
    \item{\code{x.4}}{a numeric vector}
    \item{\code{x.5}}{a numeric vector}
    \item{\code{x.6}}{a numeric vector}
    \item{\code{x.7}}{a numeric vector}
    \item{\code{x.8}}{a numeric vector}
    \item{\code{x.9}}{a numeric vector}
    \item{\code{x.10}}{a numeric vector}
  }
}
\details{
The speech signals were low pass filtered at 4.7kHz and then digitised to 12
bits with a 10kHz sampling rate.  Twelfth order linear predictive analysis was
carried out on six 512 sample Hamming windowed segments from the steady part
of the vowel.  The reflection coefficients were used to calculate 10 log area
parameters, giving a 10 dimensional input space.  For a general introduction
to speech processing and an explanation of this technique see Rabiner and
Schafer [RabinerSchafer78].

Each speaker thus yielded six frames of speech from eleven vowels.  This gave
528 frames from the eight speakers used to train the networks and 462 frames
from the seven speakers used to test the networks.

The eleven vowels, along with words demonstrating their sound, are:
i (heed)
I (hid)
E (head)
A (had)
a: (hard)
Y (hud)
O (hod)
C: (hoard)
U (hood)
u: (who'd)
3: (heard)
}
\source{
https://archive.ics.uci.edu/ml/machine-learning-databases/undocumented/connectionist-bench/vowel/
}
\references{
D. H. Deterding, 1989, University of Cambridge, "Speaker Normalisation for Automatic Speech Recognition", submitted for PhD.
}
\examples{
data(Vowel)
summary(Vowel)
}
\keyword{datasets}
