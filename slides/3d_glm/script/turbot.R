# Import data
turbot <- read.table("data/turbot.dat", header=TRUE)

# Tabulate
table(Age=turbot$Age, Maturity=turbot$Maturity)
proportions(table(Age=turbot$Age, Maturity=turbot$Maturity), margin = 1)
aggregate(Maturity~Age, turbot, mean)

# Plot
plot(aggregate(Maturity~Age, turbot, mean))

# Fit a generalized linear model
fm <- glm(Maturity~Age, data=turbot, family=binomial)
predict(fm, type="response")

# Superpose model prediction on plot
avec <- seq(0, 11, by=0.1)
fit <- data.frame(Age=avec, Maturity=predict(fm, data.frame(Age=avec), type="response"))
lines(fit)
