#include <R.h>
#include <math.h>
#include "Rinternals.h"
#include "R_ext/Rdynload.h"

static double ppareto(double q, double alpha, double beta, int isLog, 
    int lowerTail) {
    double cdf;
    int validParam = 1;
    int inSupport = 0;

    if (alpha <= 0 || beta <= 0) {
        validParam = 0;
    }
    if (q > alpha) {
        inSupport = 1;
    }
    if (isLog) {
        if (validParam && inSupport) {
            cdf = beta * (log(alpha) - log(q));
        }
        else if (validParam) {
            cdf = log(1);
        } 
        else {
            cdf = R_NaN;
        }
        if (lowerTail) {
            cdf = log(1 - exp(cdf));
        }
    }
    else {
        if (validParam && inSupport) {
            cdf = exp(beta * (log(alpha) - log(q)));
        }
        else if (validParam) {
            cdf = 1;
        }
        else {
            cdf = R_NaN;
        }
        if (lowerTail) {
            cdf = 1 - cdf;
        }
    }
    return(cdf);
}

static void rpparetoDotC(double *q, double *alpha, double *beta, int *nq, 
    double *cdf, int *nd, int *isLog, int *lowerTail) {
    if (nq[0] == nd[0]) {
        int n = nq[0];
        int i;
        for (i = 0; i < n; i++){
            cdf[i] = ppareto(q[i], alpha[i], beta[i], 
                             isLog[0], lowerTail[0]);
            }
        }
    else {
        error("argument and results lengths do not match");
    }
}

static double dpareto(double x, double alpha, double beta, int isLog) {
    double density;
    int validParam = 1;
    int inSupport = 0;

    if (alpha <= 0 || beta <= 0) {
        validParam = 0;
    }
    if (x > alpha) {
        inSupport = 1;
    }
    if (isLog) {
        if (validParam && inSupport) {
            density = log(beta) + beta*log(alpha) - (beta+1)*log(x);
        }
        else if (validParam) {
            density = log(0);
        } 
        else {
            density = R_NaN;
        }
    }
    else {
        if (validParam && inSupport) {
            density = exp(log(beta) + beta*log(alpha) - (beta+1)*log(x));
        }
        else if (validParam) {
            density = 0;
        }
        else {
            density = R_NaN;
        }
    }
    return(density);
}

static void rdparetoDotC(double *x, double *alpha, double *beta, int *nx, 
    double *density, int *nd, int *isLog) {
    if (nx[0] == nd[0]) {
        int n = nx[0];
        int i;
        for (i = 0; i < n; i++){
            density[i] = dpareto(x[i], alpha[i], beta[i], isLog[0]);
        }
    }
    else {
        error("argument and density lengths do not match");
    }
}

static double qpareto(double p, double alpha, double beta, int isLog, 
    int lowerTail) {
    double invCdf;
    int validParam = 1;
    int inSupport = 1;

    if (alpha <= 0 || beta <= 0) {
        validParam = 0;
    }
    if (isLog) {
        p = exp(p);
    }
    if (p > 1 || p < 0 || p == 0) {
        inSupport = 0;
    }
    if (lowerTail == FALSE) {
        p = 1 - p;
    }
    if (validParam && inSupport) {
        invCdf = exp(log(alpha) + (-1/beta)*log(1 - p));
    }
    else {
        invCdf = R_NaN;
    }
    return(invCdf);
}

static void rqparetoDotC(double *p, double *alpha, double *beta, int *np, 
    double *invCdf, int *nd, int *isLog, int *lowerTail) {
    if (np[0] == nd[0]) {
        int n = np[0];
        int i;
        for (i = 0; i < n; i++){
            invCdf[i] = qpareto(p[i], alpha[i], beta[i], 
                             isLog[0], lowerTail[0]);
            }
        }
    else {
        error("argument and results lengths do not match");
    }
}

/* functions callable from R with .C that use OpenMP are here */

static void rpparetoDotC_p(double *q, double *alpha, double *beta, int *nq, 
    double *cdf, int *nd, int *isLog, int *lowerTail, int *P) {
    if (nq[0] == nd[0]) {
        int n = nq[0];
        int i;
#pragma omp parallel for num_threads(P[0]) default(none) \
    firstprivate(n, q, alpha, beta, isLog, cdf, lowerTail) private(i)
        for (i = 0; i < n; i++){
            cdf[i] = ppareto(q[i], alpha[i], beta[i], 
                             isLog[0], lowerTail[0]);
            }
        }
    else {
        error("argument and results lengths do not match");
    }
}

static void rdparetoDotC_p(double *x, double *alpha, double *beta, int *nx, 
    double *density, int *nd, int *isLog, int *P) {
    if (nx[0] == nd[0]) {
        int n = nx[0];
        int i;
#pragma omp parallel for num_threads(P[0]) default(none) \
    firstprivate(n, x, alpha, beta, isLog, density) private(i)
        for (i = 0; i < n; i++){
            density[i] = dpareto(x[i], alpha[i], beta[i], isLog[0]);
        }
    }
    else {
        error("argument and density lengths do not match");
    }
}

static void rqparetoDotC_p(double *p, double *alpha, double *beta, int *np, 
    double *invCdf, int *nd, int *isLog, int *lowerTail, int *P) {
    if (np[0] == nd[0]) {
        int n = np[0];
        int i;
#pragma omp parallel for num_threads(P[0]) default(none) \
    firstprivate(n, p, alpha, beta, isLog, invCdf, lowerTail) private(i)
        for (i = 0; i < n; i++){
            invCdf[i] = qpareto(p[i], alpha[i], beta[i], 
                             isLog[0], lowerTail[0]);
            }
        }
    else {
        error("argument and results lengths do not match");
    }
}

static void rrparetoDotC(int *n, double *a, double *b, int *nn, 
    double *randomReps, int *nr) {
    if (nn[0] == nr[0]) {
        int N = n[0];
        int i;
        double x;
        double y;
        GetRNGstate();
        for (i = 0; i < N; i++){
            x = unif_rand();
            randomReps[i] = qpareto(x, a[i], b[i], 0, 0);
        }
        PutRNGstate();
    }
    else {
        error("argument and results lengths do not match");
    }
}

/* This defines a data structure for registering the routine
   `pareto'. It records the number of arguments, which allows some
   error checking when the routine is called. */
static R_CMethodDef DotCEntries[] = {
    {"rpparetoDotC", (DL_FUNC) rpparetoDotC, 8},
    {"rdparetoDotC", (DL_FUNC) rdparetoDotC, 7},
    {"rqparetoDotC", (DL_FUNC) rqparetoDotC, 8},
    {"rpparetoDotC_p", (DL_FUNC) rpparetoDotC_p, 9},
    {"rdparetoDotC_p", (DL_FUNC) rdparetoDotC_p, 8},
    {"rqparetoDotC_p", (DL_FUNC) rqparetoDotC_p, 9},
    {"rrparetoDotC", (DL_FUNC) rrparetoDotC, 6},
    {NULL}
};


/* This is called by the dynamic loader to register the routine. */
void R_init_pareto(DllInfo *info)
{
    R_registerRoutines(info, DotCEntries, NULL, NULL, NULL);
}
