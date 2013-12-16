\name{p.qpareto}
\alias{p.qpareto}
\title{
A Multi-Threaded Function to Calculate the Pareto Inverse CDF
}
\description{
  A parallelized function to calculate the Pareto inverse CDF. 
}
\usage{
p.qpareto(p, a, b, lower.tail = TRUE, log.p = FALSE, P = 1)
}
\arguments{
  \item{p}{
  numeric - The p levels of the CDF at which to calculate the x value
}
  \item{a}{
  numeric - The alpha parameter for the Pareto distribution (must be > 0)
}
  \item{b}{
  numeric - The beta parameter for the Pareto distribution (must be > 0)
}
  \item{log.p}{
  logical - whether the vector p is log(p) 
}
  \item{lower.tail}{
  logical - whether to return the upper or lower tail
}
  \item{P}{
  numeric - The number of threads to use, defaults to 11 (must be > number of
  threads supported on your machine) 
}
}
\details{
  \code{p.qpareto} calculates the Pareto inverse CDF and returns 
  F^{-1}(x | a, b). The alpha and beta values must be strictly greater than 0. 
  When provided with arguments of length > 1, \code{qpareto} will recycle the 
  input vectors in the same fashion as the other inverse cdf functions (such 
  as \code{qgamma}).
}
\value{
  A vector of doubles that is the x values for F^{-1}(x | a, b).
}

\author{
Jacob Simmering
}

\examples{
  p.qpareto(0.75, 2, 3)
  p.qpareto(0.75, 2, 3, lower.tail = FALSE) 
  p.qpareto(c(0, 0.33, 0.67, 1), 2, 4)
  p.qpareto(log(c(0.1, 0.2)), 2, 4, log.p = TRUE)
}
\keyword{distribution}