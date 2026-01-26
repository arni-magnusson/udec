dir <- "f:/verk/assmt-namskeid/1/biolike/figs"
epsfile <- paste(dir, "max.eps", sep="/")

width <- 5
height <- 3

theta <- seq(100, 200, 1)
L <- dnorm(theta, 150, 10)

eps(epsfile, width=width, height=height, pointsize=8)
par(plt=c(0.25,0.85, 0.25,0.85))
plot(theta, L, type="l", ann=FALSE, xaxt="n", las=1)
axis(1, seq(100, 200, 25))
box()
title(xlab=expression(theta))
title(ylab=expression(paste(Likelihood, " ( ", theta, " | ", data, " )")), line=4)
dev.off()
eps2pdf(epsfile)

unlink(epsfile)
