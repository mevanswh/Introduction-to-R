#2.1 Calculations
#The command line can be used as a calculator:

log(42/7.3)

#Each line can have 8192 characters, but lengthy commands can be continued on
#one or more lines by ending the line at a place where it is obviously incomplete
#in which case the command prompt will change from > to +:

5+6+3+6+4+2+4+8+

3+2+7

#If you mistakenly get the + prompt, then press esc and use the up arrow to edit
#the last incomplete line.

#Two or more expressions/calculations can be placed on the same line if they are
#seperated by a semicolon:

2+3; 5*7; 3-7

#Muliplication is done before addition and subtractions.
7+3-5*2

#Powers liked squared and cubed root are done with the ^ symbol and are done 
#before multiplication and division:
3^2/2

#Division can be accomplished using the backslash/ symbol
6/2
119/13

#If for some reason you want to know the integer quotient
119%/%13

#Modulo is the remainder in integer form
119%%13

#For very big or small numbers, R uses and exponent scheme:


#One often needs to define variables in the course of their script, the following
#number has a real (Re) and an imaginary (Im) part:
z<-3.5-8i
Re(z)
Im(z)

#What command removes this variable assignment?:
rm(z)

#Rounding: 
#floor=greatest integer less than:

floor(5.7)
floor(-5.7)

#ceiling is "the next bigger integer' function:
ceiling(5.7)
ceiling(5.3)

#So negatives are rounded to the next bigger integer too -5 is bigger than -6
ceiling(-5.7)
ceiling(-5.3)

#Sometimes it is easier to think of your goal in rounding to be rounding towards 
#or away from zero
#For negative numbers, rounding towards zero, you would use ceiling
#For rounding away from zero, you would use floor:

#Another command called round will allow you to specify the decimal place 
#place you want to round to.

round(5.7,0)
round(-5.7,0)
floor(5.7)
floor(-5.7)
ceiling(5.7)
ceiling(-5.7)

#So, round (x,0) rounds both positive and negative numbers away from zero
#floor frounds positive numbers towards zero, and negative numbers away
#ceiling rounds positive numbers away, and negative numbers towards

#Significant digits: these are not exactly the same as the number of decimal places.
#It applies to larger numbers too:

signif(12345678,4)
signif(12345678,5) 
signif(12345678,6)


#Factors and functions for dealing with factors:
#We are going to bring in some data.  First, you need to determine where your working directory is:
getwd()

#This will likely differ from the working directory with the data file
#To set the working directory, use setwd command. This may differ slightly for macs.  In Mac, go to the
#MISC toolbar option and choose change working directory in the dropdown menu:

setwd("C:\\Users\\mevanswh\\Desktop\\rdata")
#You can check the files in your directory by using:
dir()

#Double backslashes must be used in the directory assignment and the directory
#assignment must be in quotes:


data<-read.table("daphnia.txt",header=T)
attach(data)
head(data)
edit(data)

