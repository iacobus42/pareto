\name{p.ppareto}
\alias{p.ppareto}
\title{
A Multi-Threaded Function to Calculate the Pareto CDF
}
\description{
  A parallelized function to calculate the Pareto CDF. 
}
\usage{
p.ppareto(q, a, b, lower.tail = TRUE, log.p = FALSE, P = 1)
}
\arguments{
  \item{q}{
  numeric - The x values at which to calculate the cdf
}
  \item{a}{
  numeric - The alpha parameter for the Pareto distribution (must be > 0)
}
  \item{b}{
  numeric - The beta parameter for the Pareto distribution (must be > 0)
}
  \item{lower.tail}{
  logical - whether to return the upper or lower tail
}
  \item{log.p}{
  logical - whether to return the log density 
}
  \item{P}{
  numeric - The number of threads to use, defaults to 11 (must be > number of
  threads supported on your machine) 
}
}
\details{
  \code{p.ppareto} calculates the Pareto CDF for F(x | a, b) with support for 
  returning the log density. The alpha and beta values must be strictly greater 
  than 0. When provided with arguments of length > 1, \code{ppareto} will 
  recycle the input vectors in the same fashion as similar cdf functions 
  (such as \code{pgamma}).
}
\value{
  A vector of doubles that is the CDF F(x | a, b).
}

\author{
Jacob Simmering
}

\examples{
  p.ppareto(4, 2, 3)
  p.ppareto(4, 2, 3, lower.tail = FALSE) 
  p.ppareto(1:10, 2, 4)
  p.ppareto(1:10, 2, 4, log.p = TRUE)

}
\keyword{distribution}

