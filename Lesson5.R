#Lines 1-6 of code are just helpful codes to clean the working environment or set working directory
rm(list=ls())
#On a pc you set the wroking directory using a command similar to this
setwd ("C://Users//mevanswh//Desktop//rdata")
#On Mac, you set working directory using a command similar to this
setwd("~/Documents/therbook")
#Making a character list and converting it to factor
a<-c("cat","dog","goldfish")
b<-factor(a)
#2.3 Generating sequences: this is an important way of creating vectors
#All you do to create a sequence with steps of 1 is use a colon operator
0:10
#the order can be from smallest to largest or largest to smallest
15:5
#To generate a sequence with steps not equal to 1, you use the seq function
#The simplest form of the function has 3 arguments: (from, to, by)=(the initial value, the final value, and the increment)
#This will generate a sequence from 0 to 1.5 with increments of 0.1
seq(0,1.5,0.1)
#You can generate a sequence going the opposite direction from largest to smallest. Notice the increment is negative.
seq(6,4,-0.2)
#In many cases you want to generate a sequene to match an existing vector length.
#To figure out what increment will produce a vector of appropriate length, you use
#the along and length options
#suppose you have a vector N of populations sizes
N<-c(55,76,92,103,84,88,121,91,65,77,99)
#You need to plot this against a sequence that starts at 0.04 in steps of 0.01
seq(from=0.4, by=0.01, length=11)
#The above command requires you to figure out the length of N. A simpler method
#uses the along argument and specifies the vector, N, whose length has to be matched
seq(0.4, by=0.1, along=N)
#Alternatively you can get R to work out the increment (0.01) in this example
#by specifying the start and the end values (from and to), and the name of 
#the vector that has to be matched.
seq(from=0.4, to=0.14, along=N)
#The above command could be a good way to get x values for drawing
#smooth lines through a scatterplot of data
#Notice if we make a mistake and the increment won't generate a sequence that matches the final
#value in the command, the generated sequence stops short of the final value given
seq(1.4,2.1,0.3)
#If you want a vector made up of sequences of unequal lengths, then use the sequence function.  
#suppose that most of the five sequences you want to string together are from 1 to 4, but
#the second one is 1 to 3 and the last one is 1 to 5, then
sequence(c(4,3,4,4,4,5))
#2.3.1 Generating repeats
#To generate repeating numbers or characters, you use the rep function.
#In parentheses, the first argument is the object you want to repeat, then the second is the number of times to repeat
rep(9,5)
#In the rep function, the each command can change the sorting of the numbers, the times command 
#is the number of repeats of the each command
rep(1:4,2)
rep(1:4, each=2)
rep(1:4, each=2, times=3)
#When we want each element of the series to be repeated a different number of times,
#the second argument in parentheses should be a vector of the same length as the vector
#defined in the first argument
rep(1:4,1:4)
#Suppose that we need four 1s, one 2, four 3s, and two 4s.  Then we use the concatenation function (c) 
#to create a vector of length 4 which all act as a second argument in the rep function
rep(1:4, c(4,1,4,2))
#You may also use characters in the rep function
rep(c("cat","dog","gerbil","goldfish","rat"), c(2,3,2,1,3))
