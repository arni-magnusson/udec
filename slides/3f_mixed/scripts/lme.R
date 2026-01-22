library(nlme)

# Orthodont
# distance age Subject  Sex

plot(distance~age, Orthodont)
boxplot(distance~Sex, Orthodont)

lm(distance~age+Sex+age:Sex, data=Orthodont)

fm1 <- lme(distance~age, data=Orthodont, random=~1|Subject)
fm2 <- lme(distance~age, data=Orthodont, random=~age|Subject)
