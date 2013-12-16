rpareto <- function(n, a, b) {
    # qpareto handles vector recycling
    qpareto(runif(n), a, b)
}

rcpareto <- function(n, a, b) {
    maxLength <- max(c(n, length(a), length(b)))
    a <- rep(a, length.out = maxLength)
    b <- rep(b, length.out = maxLength)
    N <- length(a)
    ramdomReps <- .C("rrparetoDotC", as.integer(n), as.double(a),
              as.double(b), as.integer(N), ramdomReps = double(N), 
              as.integer(N), PACKAGE = "pareto")
    ramdomReps$ramdomReps
}
