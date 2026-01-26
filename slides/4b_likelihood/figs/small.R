dir <- "f:/verk/assmt-namskeid/1/biolike/figs"

size <- 2.1

small.1 <- paste(dir, "small-1.eps", sep="/")
small.2 <- paste(dir, "small-2.eps", sep="/")
small.3 <- paste(dir, "small-3.eps", sep="/")

theta <- seq(100, 200, 1)
L <- dnorm(theta, 150, 10)
logL <- dnorm(theta, 150, 10, log=TRUE)

eps(small.1, width=size, height=size, pointsize=8)
par(plt=c(0.25,0.85, 0.25,0.85))
plot(theta, L, type="l", ann=FALSE, xaxt="n", las=1)
axis(1, seq(100, 200, 25))
box()
title(xlab=expression(theta))
title(main="L")
dev.off()
eps2pdf(small.1)

eps(small.2, width=size, height=size, pointsize=8)
par(plt=c(0.25,0.85, 0.25,0.85))
plot(theta, logL, type="l", ann=FALSE, xaxt="n", las=1)
axis(1, seq(100, 200, 25))
box()
title(xlab=expression(theta))
title(main="log L")
dev.off()
eps2pdf(small.2)

eps(small.3, width=size, height=size, pointsize=8)
par(plt=c(0.25,0.85, 0.25,0.85))
plot(theta, -logL, type="l", ann=FALSE, xaxt="n", las=1)
axis(1, seq(100, 200, 25))
box()
title(xlab=expression(theta))
title(main="-log L")
dev.off()
eps2pdf(small.3)

unlink(c(small.1, small.2, small.3))
