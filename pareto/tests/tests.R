library(pareto)
stopifnot(is.na(dpareto(3, -2, 1)))
stopifnot(is.na(dpareto(3, 2, -1)))
stopifnot(all.equal(dpareto(3, 2, 1), 0.2222222222))
stopifnot(all.equal(dpareto(1, 2, 3), 0.0))
stopifnot(all.equal(dpareto(3:5, 2, 1), c(0.2222222222, 0.1250000, 0.0800000)))
stopifnot(all.equal(dpareto(1:5, 2, 1), c(0.0, 0.0, 0.2222222222, 0.1250000, 
                                         0.0800000)))
stopifnot(all.equal(dpareto(6, 2:4, 1), c(0.05555555556, 0.08333333333, 
                                         0.11111111111)))
stopifnot(all.equal(log(dpareto(1:5, 2, 1)), dpareto(1:5, 2, 1, log = TRUE)))

stopifnot(is.na(ppareto(1:5, -1, 2)))
stopifnot(is.na(ppareto(1:5, 1, -2)))
stopifnot(all.equal(log(ppareto(1:5, 2, 1)), ppareto(1:5, 2, 1, log.p = TRUE)))
stopifnot(all.equal((ppareto(seq(-1, 2, 0.25), 
                                       seq(1, 2, 0.5), 
                                       seq(1, 3, 0.5), 
                                       TRUE, FALSE) + 
                               ppareto(seq(-1, 2, 0.25), 
                                       seq(1, 2, 0.5), 
                                       seq(1, 3, 0.5), 
                                       FALSE, FALSE)), 
                              rep(1, max(length(seq(-1, 2, 0.25)), 
                                         length(seq(1, 2, 0.5)), 
                                         length(seq(1, 3, 0.5))))))

stopifnot(is.na(qpareto(0.5, -1, 1)))
stopifnot(is.na(qpareto(0.5, 1, -1)))
stopifnot(is.na(qpareto(-1, 1, 1)))
stopifnot(is.na(qpareto(2, 1, 1)))
stopifnot(is.na(qpareto(0, 1, 1)))
# recover
stopifnot(all.equal(seq(1.1, 4, 0.1), 
          qpareto(ppareto(seq(1.1, 4, 0.1), 
                          seq(0.5, 1, 0.5), 1:2), seq(0.5, 1, 0.5), 1:2)))
stopifnot(all.equal(seq(1.1, 4, 0.1), 
          qpareto(ppareto(seq(1.1, 4, 0.1), 1, 1:2, log.p = TRUE), 
                  1, 1:2, log.p = TRUE)))

stopifnot(is.na(p.dpareto(3, -2, 1, P = 2)))
stopifnot(is.na(p.dpareto(3, 2, -1, P = 2)))
stopifnot(all.equal(p.dpareto(3, 2, 1, P = 2), 0.2222222222))
stopifnot(all.equal(p.dpareto(1, 2, 3, P = 2), 0.0))
stopifnot(all.equal(p.dpareto(3:5, 2, 1, P = 2), c(0.2222222222, 0.1250000, 
                                                   0.0800000)))
stopifnot(all.equal(p.dpareto(1:5, 2, 1, P = 2), c(0.0, 0.0, 0.2222222222, 
                                                   0.1250000, 0.0800000)))
stopifnot(all.equal(p.dpareto(6, 2:4, 1, P = 2), c(0.05555555556, 0.08333333333, 
                                         0.11111111111)))
stopifnot(all.equal(log(p.dpareto(1:5, 2, 1, P = 2)), 
  p.dpareto(1:5, 2, 1, log = TRUE, P = 2)))

stopifnot(is.na(p.ppareto(1:5, -1, 2, P = 2)))
stopifnot(is.na(p.ppareto(1:5, 1, -2, P = 2)))
stopifnot(all.equal(log(p.ppareto(1:5, 2, 1, P = 2)), 
  p.ppareto(1:5, 2, 1, log.p = TRUE, P = 2)))
stopifnot(all.equal((p.ppareto(seq(-1, 2, 0.25), 
                                       seq(1, 2, 0.5), 
                                       seq(1, 3, 0.5), 
                                       TRUE, FALSE) + 
                               p.ppareto(seq(-1, 2, 0.25), 
                                       seq(1, 2, 0.5), 
                                       seq(1, 3, 0.5), 
                                       FALSE, FALSE)), 
                              rep(1, max(length(seq(-1, 2, 0.25)), 
                                         length(seq(1, 2, 0.5)), 
                                         length(seq(1, 3, 0.5))))))

stopifnot(is.na(p.qpareto(0.5, -1, 1, P = 2)))
stopifnot(is.na(p.qpareto(0.5, 1, -1, P = 2)))
stopifnot(is.na(p.qpareto(-1, 1, 1, P = 2)))
stopifnot(is.na(p.qpareto(2, 1, 1, P = 2)))
stopifnot(is.na(p.qpareto(0, 1, 1, P = 2)))
# recover
stopifnot(all.equal(seq(1.1, 4, 0.1), 
          p.qpareto(p.ppareto(seq(1.1, 4, 0.1), 
                          seq(0.5, 1, 0.5), 1:2), seq(0.5, 1, 0.5), 1:2)))
stopifnot(all.equal(seq(1.1, 4, 0.1), 
          p.qpareto(p.ppareto(seq(1.1, 4, 0.1), 1, 1:2, log.p = TRUE), 
                  1, 1:2, log.p = TRUE)))

set.seed(42)
rr <- rpareto(10, c(1, 2), c(3, 6))
stopifnot(all.equal(rr, c(2.27263873241339, 3.17122166916032, 1.11891103357127, 
  2.68831001440167, 1.40800043686527, 2.25954115767964, 1.55998942496429, 
  2.04879930256579, 1.42856072541629, 2.45137013292676)))
set.seed(42)
rc <- rcpareto(10, c(1, 2), c(3, 6))
stopifnot(all.equal(rc, c(1.03012594366122, 2.02178159400051, 1.51754197028833, 
  2.06289894775278, 1.15934417705375, 2.2309442742118, 1.1072823866308, 
  2.79353005315021, 1.15030562166599, 2.11994775656395))) 

