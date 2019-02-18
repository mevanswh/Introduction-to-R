#Random numbers, sampling, and shuffling pages69-71
rm(list=ls())
#The default sample function shuffles the contents of a vector
#into a random sequence while maintaining all
#the numberical values in tact.
#Its helpful for randomly assigning treatments to units
y<-c(8,3,5,7,6,6,8,9,2,3,9,4,10,4,11)
sample (y)
sample (y)
#The order of the values differs between the first and second
#shuffle, but the same numbers in the orginal vector appear
#This is called sampling without replacement.
#You may want to specify the size of the sample as an optional
#second argument
sample (y,5)
sample (y,5)
#The option replace=T allows for sampling with replacement
#which is the basis for bootstrapping.
#The vector produced by replace=T produces the same length as the vector
#sampled, but some values are left out at random
#and other values, again at random, appear two or more times
#In this sample, 10 has been left out and there are now three 9s:
sample(y,replace=T)
#In the next case, there are only two 10s and one 9
sample(y,replace=T)
#Now we will go through an example of assigning
#Assigning treatments to blocks 1-5
#First assign all treatments or combos to a vector
#Let's assign the 20 students from the CRD example to 
#treatments A or B.  First you need to have a vector
#of unique numbers for each experimental unit (person)
students<-c(1:20)
#then we will come up with an order to assign them
#to treatment A or B depending on the list.  The 
#first 10 in the list will go to treatment A
#the remainder will go to treatment B
sample (students)
#Now we will go through an example of assigning
#Assigning treatments to blocks 1-5
#First assign all treatments or combos to a vector
treatments<-c("ZPZG", "ZPG", "PZG", "PG")
#Then, we use the sample function to shuffle them
#into experimental units within 4 blocks assigned from 
#left to right facing north across each block.
#block 1 assignment
sample(treatments)
#block 2 assignment
sample(treatments)
#block 3 assignment
sample(treatments)
#block 4 assignment
sample(treatments)
