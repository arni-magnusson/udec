library(RTMB)

recdata <- read.table("../data/rec.dat", header=TRUE)

par <- list(logRmax=7, logS50=6, logSigma=5)

f <- function(par)
{
  Rmax <- exp(par[["logRmax"]])
  S50 <- exp(par[["logS50"]])
  sigma <- exp(par[["logSigma"]])

  S <- recdata$S
  R <- recdata$R

  Rhat <- Rmax * S / (S + S50)
  nll <- -sum(dnorm(log(R), log(Rhat), sigma, TRUE))

  xvec <- 0:2000
  yvec <- Rmax * xvec / (xvec + S50)
  ADREPORT(log(yvec))
  nll
}

model <- MakeADFun(f, par)
fit <- nlminb(model$par, model$fn, model$gr)
rep <- summary(sdreport(model))

rep
fit

drep <- as.data.frame(rep[-(1:4),])
drep$fit <- exp(drep$Est)
drep$lo <- exp(drep$Est - 1.96 * drep$Std)
drep$hi <- exp(drep$Est + 1.96 * drep$Std)

plot(recdata[-1], xlim=c(0,1000), ylim=c(0,1000))
lines(1:2000, drep$fit)

lines(1:2000, drep$hi, lty=3)
lines(1:2000, drep$lo, lty=3)
