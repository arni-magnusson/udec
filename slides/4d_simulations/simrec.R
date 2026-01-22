# Set true parameter values
Rmax <- 2000
S50 <- 500
sigmaR <- 0.4
sigmaS <- 150

# Number of datapoints in each simulated dataset
n <- 80

# Generate random stock size (normal distributed)
S <- abs(rnorm(n, m=S50, s=sigmaS))

# Generate random recruitment from Bev-Holt model (lognormal)
Rhat <- Rmax * S / (S + S50) * exp(rnorm(n, m=0, s=sigmaR))

plot(S, Rhat, xlim=c(0, 1200), ylim=c(0, 3000))
