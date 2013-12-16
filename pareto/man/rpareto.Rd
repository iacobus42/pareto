\name{rpareto}
\alias{rpareto}
\title{
A Function to Calculate Pseudo-Random Replicates From the Pareto Distribution
}
\description{
  A Function to Calculate Pseudo-Random Replicates From the Pareto Distribution.
}
\usage{
rpareto(n, a, b)
}
\arguments{
  \item{n}{
  numeric - The number of desired random replicates
}
  \item{a}{
  numeric - The alpha parameter for the Pareto distribution (must be > 0)
}
  \item{b}{
  numeric - The beta parameter for the Pareto distribution (must be > 0)
}
}
\details{
  \code{rpareto} calculates pseudo-random replicates of the Pareto. It uses 
  cdf inversion to generate the random Pareto values from a U(0, 1) 
  distribution, see \code{qpareto} for details on cdf inversion of the Pareto 
  distribution. The alpha and beta values must be strictly greater 
  than 0. When provided with alpha and beta arguments of length > 1, 
  \code{rpareto} will recycle the input vectors in the same fashion as the other 
  distribution functions (such as \code{rgamma}).
}
\value{
  A vector of doubles that are randomly sampled from the specificed Pareto 
  distribution(s).
}

\author{
Jacob Simmering
}

\examples{
  rpareto(4, 2, 3) 
  rpareto(4, c(1, 2), c(3, 4))
}
\keyword{distribution}