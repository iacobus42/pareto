A Package For The Pareto Distribution in R
==========================================

A package for calculating the density, cdf, inverse cdf and random
replicates of the Pareto distribution using R. Support for C using
<code>.C()</code> in R is provided as well as multicore OpenMP. 
The normal "d, p, r, q" functions are provided (all run in C). Also
the functions with a leading "p." provide multithread support.

Depends on <code>ggplot2</code> and <code>xtable</code> for building
the vignette. But really who doesn't already have them installed? If
you don't, <code>install.packages(ggplot2)</code> and 
<code>install.packages(xtable)</code> will take care of that for you.

Install by running <code>R CMD build pareto</code> from the command
line in the directory with the <pareto> folder. Alternatively,
download the tar.gz file. Install with 
<code>install.packages(\<path to tar.gz/>, repos = NULL, type = "source")</path>.

I have tested this on Crunchbang, Fedora and Ubuntu and it builds and
installs on all machines. There may be a few issues if you don't have
all the proper LaTeX tools installed (this is especially true with 
Ubuntu). I suspect it will work on Mac OSX as-is but it might present
some problems with Windows (namely the compiling of the C code). I
don't feel like cross-compiling for Windows but if you feel like it, 
you have my blessing. 