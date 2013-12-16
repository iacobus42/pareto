ppareto <-
function(q, a, b, lower.tail = TRUE, log.p = FALSE) {
    maxLength <- max(c(length(q), length(a), length(b)))
    q <- rep(q, length.out = maxLength)
    a <- rep(a, length.out = maxLength)
    b <- rep(b, length.out = maxLength)
    n <- maxLength
    cdf <- .C("rpparetoDotC", as.double(q), as.double(a),
                  as.double(b), as.integer(n), cdf = double(n),
                  as.integer(n), as.integer(log.p), as.integer(lower.tail),
                  PACKAGE = "pareto")
    cdf$cdf
}

p.ppareto <-
function(q, a, b, lower.tail = TRUE, log.p = FALSE, P = 1) {
    maxLength <- max(c(length(q), length(a), length(b)))
    q <- rep(q, length.out = maxLength)
    a <- rep(a, length.out = maxLength)
    b <- rep(b, length.out = maxLength)
    n <- maxLength
    cdf <- .C("rpparetoDotC_p", as.double(q), as.double(a),
                  as.double(b), as.integer(n), cdf = double(n),
                  as.integer(n), as.integer(log.p), as.integer(lower.tail),
                  as.integer(P), PACKAGE = "pareto")
    cdf$cdf
}
