# Plot types
plot(cars$speed, cars$dist)
barplot(cars$dist)
hist(cars$dist)
boxplot(cars$dist)

# Plot interface
plot(cars$speed, cars$dist)
plot(dist~speed, data=cars)
plot(cars)
cars.lm <- lm(dist~speed, data=cars)
par(mfrow=c(2,2))
plot(cars.lm)

# Color
barplot(1, col="darkgreen")
colors()
barplot(1, col=2)
barplot(rep(1,8), names=1:8, col=1:8)
palette()

# Graphical parameters
plot(c(1,10), c(1,100),
     main="title", xlab="x", ylab="y",
     xlim=c(0,20), ylim=c(0,120),
     pch=2, lwd=5, col="orange", cex=2)
lines(c(5,15), c(50,60), lty=2, lwd=5, col="purple")
text(10, 20, "here", col="brown")

# Multipanel
par(mfrow=c(2,3))
plot(0, main=1)
plot(0, main=2)
plot(0, main=3)
plot(0, main=4)
plot(0, main=5)
plot(0, main=6)
par(mfrow=c(1,1))

# Aspect ratio
boxplot(count~spray, data=InsectSprays)
plot(sunspots)

