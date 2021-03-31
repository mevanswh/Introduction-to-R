setwd("C:\\Users\\mevanswh\\Desktop\\rdata")
install.packages("Hmisc")
library(ggplot2)
library(ggpubr)
library(magrittr)
library(Hmisc)
#Data for this exercise comes from an experiment testing
#whether caterpillar growth depends upon the tannin content
#of their food
reg.data<-read.table("regression.txt", header=T)
attach(reg.data)
plot(tannin,growth,pch=21,col="blue", bg="red")
#with(reg.data, plot (tannin,growth,pch=21,col="blue", bg="red"))
model<-lm(reg.data$growth~reg.data$tannin)
summary(model)
abline(model,col="red")
par(mfrow=c(2,2))
plot(model)
#leverage of point 7
model2<-update(model,subset=(tannin !=6))
summary(model2)
#linear regression model
datareg<-lm(y~x, data=data)
summary(datareg)
par(mfrow=c(2,2))
plot(datareg)
par(mfrow=c(1,1))
plot(x,y)
abline(lm(y~x,data=data))
data<-read.csv("twosample.csv")
attach(data)
#Assumptions of Pearsons Correlation (Parametric)
#x and y variables seem to have a linear relationship
plot(x,y)
#x and y variable are normal
ggqqplot(x)
ggqqplot(y)
#The null hypothesis for Shapiro's test is that the data are normal
#So p>0.05 means your data are normal.
shapiro.test(x)
shapiro.test(y)
detach(data)
