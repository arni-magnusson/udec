recdata <- read.table("../data/rec.dat", header=TRUE)

par <- list(logRmax=0, logS50=0, logSigma=0)

f <- function(par)
{
  Rmax <- exp(par[["logRmax"]])
  S50 <- exp(par[["logS50"]])
  sigma <- exp(par[["logSigma"]])

  S <- recdata$S
  R <- recdata$R

  Rhat <- Rmax * S / (S + S50)
  nll <- -sum(dnorm(log(R), log(Rhat), sigma, TRUE))
  nll
}

fit <- nlminb(par, f)

################################################################################

R <- recdata$R
S <- recdata$S
plot(S, R, xlim=c(0,4000), ylim=c(0, 1200))
Rmax <- exp(fit$par[["logRmax"]])
S50 <- exp(fit$par[["logS50"]])
sigma <- exp(fit$par[["logSigma"]])
x <- seq(0, 3000)
yhat <- Rmax * x / (x + S50)
lines(x, yhat)
