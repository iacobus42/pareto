\name{ppareto}
\alias{ppareto}
\title{
A Function to Calculate the Pareto CDF
}
\description{
  A function to calculate the Pareto CDF. 
}
\usage{
ppareto(q, a, b, lower.tail = TRUE, log.p = FALSE)
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
}
\details{
  \code{ppareto} calculates the Pareto CDF for F(x | a, b) with support for 
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
  ppareto(4, 2, 3)
  ppareto(4, 2, 3, lower.tail = FALSE) 
  ppareto(1:10, 2, 4)
  ppareto(1:10, 2, 4, log.p = TRUE)

}
\keyword{distribution}

