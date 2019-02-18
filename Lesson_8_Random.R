#Random numbers, sampling, and shuffling pages69-71
rm(list=ls())
y<-c(8,3,5,7,6,6,8,9,2,3,9,4,10,4,11)
sample (y)
sample (y)
#adding a number after the vector name in the parentheses constrains
#number of returned items
sample (y,5)
sample (y,5)
#The option replace=T allows for sampling with replacement
#which is the basis for bootstrapping.
sample(y,replace=T)
sample(y,replace=T)
#Now we will go through an example of assigning
#Assigning treatments to blocks 1-5
students<-c(1:20)
sample (students)
treatments<-c("ZPZG", "ZPG", "PZG", "PG")
#block 1 assignment
sample(treatments)
#block 2 assignment
sample(treatments)
#block 3 assignment
sample(treatments)
#block 4 assignment
sample(treatments)
