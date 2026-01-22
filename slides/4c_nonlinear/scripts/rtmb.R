library(RTMB)

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
  ADREPORT(log(Rhat))
  nll
}

model <- MakeADFun(f, par)
fit <- nlminb(model$par, model$fn, model$gr)
rep <- summary(sdreport(model))

rep
fit
