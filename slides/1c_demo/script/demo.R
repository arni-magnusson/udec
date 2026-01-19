# cars <- read.table("../data/cars.txt", header=TRUE)

# Explore data
cars
head(cars)
plot(cars$speed, cars$dist)
summary(cars)

# Fit model
cars.lm <- lm(dist~speed, data=cars)
abline(cars.lm)
summary(cars.lm)

# Export plot
# png("../report/cars.png")
plot(dist~speed, data=cars)
abline(cars.lm)
# dev.off()
