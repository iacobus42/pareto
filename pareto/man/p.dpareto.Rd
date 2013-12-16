\name{p.dpareto}
\alias{p.dpareto}
\title{
A Multi-threaded Function to Calculate the Pareto Density
}
\description{
  A parallelized function to calculate the Pareto density. 
}
\usage{
p.dpareto(x, a, b, log = FALSE, P = 1)
}
\arguments{
  \item{x}{
  numeric - The x values at which to calculate the density
}
  \item{a}{
  numeric - The alpha parameter for the Pareto distribution (must be > 0)
}
  \item{b}{
  numeric - The beta parameter for the Pareto distribution (must be > 0)
}
  \item{log}{
  logical - whether to return the log density 
}
  \item{P}{
  numeric - The number of threads to use, defaults to 11 (must be > number of
  threads supported on your machine) 
}
}
\details{
  \code{p.dpareto} calculates the Pareto density for f(x | a, b) with support 
  for returning the log density. The alpha and beta values must be strictly 
  greater than 0. When provided with arguments of length > 1, \code{dpareto} 
  will recycle the input vectors in the same fashion as the other density 
  functions (such as \code{dgamma}).
}
\value{
  A vector of doubles that is the density f(x | a, b).
}

\author{
Jacob Simmering
}

\examples{
  p.dpareto(4, 2, 3) 
  p.dpareto(1:10, 2, 4)
  p.dpareto(1:10, 2, 4, log = TRUE)
}
\keyword{distribution}

