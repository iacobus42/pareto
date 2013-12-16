\name{dpareto}
\alias{dpareto}
\title{
A Function to Calculate the Pareto Density
}
\description{
  A function to calculate the Pareto density. 
}
\usage{
dpareto(x, a, b, log = FALSE)
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
}
\details{
  \code{dpareto} calculates the Pareto density for f(x | a, b) with support for 
  returning the log density. The alpha and beta values must be strictly greater 
  than 0. When provided with arguments of length > 1, \code{dpareto} will 
  recycle the input vectors in the same fashion as the other density functions 
  (such as \code{dgamma}).
}
\value{
  A vector of doubles that is the density f(x | a, b).
}

\author{
Jacob Simmering
}

\examples{
  dpareto(4, 2, 3) 
  dpareto(1:10, 2, 4)
  dpareto(1:10, 2, 4, log = TRUE)
}
\keyword{distribution}

