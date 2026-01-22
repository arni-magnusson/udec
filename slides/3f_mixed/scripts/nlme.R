library(nlme)

# Orange
# Tree  age circumference

plot(circumference~age, Orange)
xyplot(circumference~age|Tree, Orange)

fm <- nlme(circumference~phi1/(1+exp(-(age-phi2)/phi3)),
           fixed=phi1+phi2+phi3~1, random=phi1~1|Tree,
           data=Orange, start=c(phi1=200,phi2=800,phi3=400))
