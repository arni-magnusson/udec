# Smooth line
plot(dist~speed, data=cars)
lofit <- loess(dist~speed, data=cars)$fit
lines(cars$speed, lofit, lwd=2, col="red")

# t test
chick2 <- split(chickwts$weight,
                chickwts$feed)[c("linseed", "soybean")]
chick2
boxplot(chick2)
t.test(chick2$linseed, chick2$soybean)

# One-way anova
PlantGrowth
boxplot(weight~group, data=PlantGrowth)
aov(weight~group, data=PlantGrowth)
summary(aov(weight~group, data=PlantGrowth))

# Simple LM
cars
head(cars)
plot(dist~speed, data=cars)
mylm <- lm(dist~speed, data=cars)
abline(mylm)
summary(mylm)
par(mfrow=c(2,2))
plot(mylm)

# Log-log LM
par(mfrow=c(1,1))
plot(log(dist)~log(speed), data=cars)
mylog <- lm(log(dist)~log(speed), data=cars)
abline(mylog)
summary(mylog)

# Compare
par(mfrow=c(1,2))
plot(dist~speed, data=cars, main="normal")
abline(mylm)
plot(log(dist)~log(speed), data=cars, main="log-log")
abline(mylog)

# Diagnostics
par(mfrow=c(2,2))
plot(mylm, main="normal")
dev.new()
par(mfrow=c(2,2))
plot(mylog, main="log-log")

# R squared and AIC
summary(mylm)
summary(mylog)
names(summary(mylm))
summary(mylm)$r.s
summary(mylog)$r.s
AIC(mylm, mylog)

# Ancova
ToothGrowth
head(ToothGrowth)
summary(ToothGrowth)
boxplot(len~supp, data=ToothGrowth)
plot(len~dose, data=ToothGrowth)
plot(len~log(dose), data=ToothGrowth)

# Intercept and slope options
library(lattice)
xyplot(len~log(dose)|supp, data=ToothGrowth,
       panel=function(...){panel.xyplot(...);
                           panel.lmline(...)})

lm(len~log(dose), data=ToothGrowth) # coefs 2
lm(len~log(dose)+supp, data=ToothGrowth)  # 3
lm(len~log(dose):supp, data=ToothGrowth)  # 3
lm(len~log(dose)*supp, data=ToothGrowth)  # 4

# Forward and backward model selection
add1(lm(len~1, data=ToothGrowth),
     .~log(dose)*supp, test="F")
add1(lm(len~log(dose), data=ToothGrowth),
     .~log(dose)*supp, test="F")
add1(lm(len~log(dose)+supp, data=ToothGrowth),
     .~log(dose)*supp, test="F")

# Plot ancova
graphics.off()
drop1(lm(len~log(dose)*supp, data=ToothGrowth), test="F")
anova(lm(len~log(dose)*supp, data=ToothGrowth))
mylm <- lm(len~log(dose)*supp, data=ToothGrowth)
plot(len~log(dose), data=ToothGrowth, subset=supp=="OJ",
     ylim=c(0,35), pch=16, col="orange")
points(len~log(dose), data=ToothGrowth, subset=supp=="VC",
       pch=16, col="blue")
d <- c(0.5, 1, 2)
ojfit <- predict(mylm, data.frame(dose=d, supp=factor("OJ")))
vcfit <- predict(mylm, data.frame(dose=d, supp=factor("VC")))
lines(log(d), ojfit, lwd=2, col="orange")
lines(log(d), vcfit, lwd=2, col="blue")

# Stepwise model selection
mylm1 <- step(lm(I(1/mpg)~1, data=mtcars),
              .~cyl+disp+hp+drat+wt+qsec+factor(vs)
                +factor(am)+gear+carb)
mylm2 <- step(lm(I(1/mpg)~cyl+disp+hp+drat+wt+qsec+factor(vs)
                          +factor(am)+gear+carb, data=mtcars))
summary(mylm1)
summary(mylm2)
AIC(mylm1, mylm2)

# Count data
kick <- read.table("../data/kick.txt", header=TRUE)
kick
head(kick)
xtabs(N~Corps+Year, data=kick)
tapply(kick$N, kick$Corps, sum)
barplot(tapply(kick$N, kick$Corps, sum))
lev <- c("G", as.character(as.roman(c(1:11,14:15))))
kick$Corps <- ordered(kick$Corps, levels=lev)

# Chi squared test
barplot(tapply(kick$N, kick$Corps, sum))
chisq.test(tapply(kick$N, kick$Corps, sum))
barplot(tapply(kick$N, kick$Year, sum))
chisq.test(tapply(kick$N, kick$Year, sum))

# GLM test
par(mfrow=c(2,1))
barplot(tapply(kick$N, kick$Corps, sum),
        main="Deaths by Corps")
barplot(tapply(kick$N, kick$Year, sum),
        main="Deaths by Year")
kick.0 <- glm(N~1, data=kick, family=poisson)
anova(step(kick.0, .~factor(Year)*Corps), test="Chisq")
