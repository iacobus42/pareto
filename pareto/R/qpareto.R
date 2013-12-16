qpareto <-
function(p, a, b, lower.tail = TRUE, log.p = FALSE) {
    maxLength <- max(c(length(p), length(a), length(b)))
    p <- rep(p, length.out = maxLength)
    a <- rep(a, length.out = maxLength)
    b <- rep(b, length.out = maxLength)
    n <- length(p)
    invCdf <- .C("rqparetoDotC", as.double(p), as.double(a),
              as.double(b), as.integer(n), invCdf = double(n),
              as.integer(n), as.integer(log.p), as.integer(lower.tail),
              PACKAGE = "pareto")
    invCdf$invCdf
}

p.qpareto <-
function(p, a, b, lower.tail = TRUE, log.p = FALSE, P = 1) {
    maxLength <- max(c(length(p), length(a), length(b)))
    p <- rep(p, length.out = maxLength)
    a <- rep(a, length.out = maxLength)
    b <- rep(b, length.out = maxLength)
    n <- length(p)
    invCdf <- .C("rqparetoDotC_p", as.double(p), as.double(a),
              as.double(b), as.integer(n), invCdf = double(n),
              as.integer(n), as.integer(log.p), as.integer(lower.tail),
              as.integer(P), PACKAGE = "pareto")
    invCdf$invCdf
}
