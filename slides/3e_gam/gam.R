## Fit LM to data
plot(mpg~hp, data=mtcars)
model.lm <- lm(mpg~hp, data=mtcars)
abline(model.lm)
summary(model.lm)

## Fit GAM to data
library(mgcv)
model.gam <- gam(mpg~s(hp), data=mtcars)
xvec <- seq(min(mtcars$hp), max(mtcars$hp))
y.gam <- predict(model.gam, data.frame(hp=xvec))
lines(xvec, y.gam, lwd=2, col="red")
summary(model.gam)

## Compare LM and GAM using AIC
AIC(model.lm, model.gam)
