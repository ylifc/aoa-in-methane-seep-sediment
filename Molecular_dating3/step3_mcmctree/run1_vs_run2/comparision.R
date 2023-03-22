# Make sure R's working directory is divtime/R

rm(list=ls()) # clean up the workspace

# ###############################################
# POSTERIOR:
# ###############################################
# read in MCMC trace files
mcmc1 <- read.table("./mcmc1.txt", head=TRUE)
mcmc2 <- read.table("./mcmc2.txt", head=TRUE)

names(mcmc1)

# to check for convergence of the MCMC runs, we calculate the posterior
# means of times for each run, and plot them against each other
t.mean1 <- apply(mcmc1[,2:126], 2, mean) * 100
t.mean2 <- apply(mcmc2[,2:126], 2, mean) * 100
# good convergence is indicated when the points fall on the y = x line.

par(mfrow=c(2,2))
# posterior times for run 1 vs run 2:
plot(t.mean1, t.mean2, main="a) Posterior times, r 1 vs. r 2"); abline(0, 1)
# notice that ancient times (t_n127 and t_n128) have small ESS
# trace plots are useful to visualise the MCMC and split problems
plot(mcmc1$t_n127, ty='l', main="b) trace of t_n127")
plot(mcmc1$t_n128, ty='l', main="c) trace of t_n128")
plot(density(mcmc1$t_n127), main="d) histogram of t_n127, r 1 vs. r2")
lines(density(mcmc2$t_n127), lty=2)