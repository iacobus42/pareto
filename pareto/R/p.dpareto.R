p.dpareto <-
function(x, a, b, log = FALSE, P = 1) {
    maxLength <- max(c(length(x), length(a), length(b)))
    x <- rep(x, length.out = maxLength)
    a <- rep(a, length.out = maxLength)
    b <- rep(b, length.out = maxLength)
    n <- maxLength
    density <- .C("rdparetoDotC_p", as.double(x), as.double(a),
                  as.double(b), as.integer(n), density = double(n),
                  as.integer(n), as.integer(log), as.integer(P),
                  PACKAGE = "pareto")
    density$density
}
