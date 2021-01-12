#First Lesson

#1.  Install packages used in the textbook

install.packages("akima")
install.packages("boot")
install.packages("car")
install.packages("lme4")
install.packages("meta")
install.packages("mgcv")
install.packages("nlme")
install.packages("deSolve")
install.packages("R2jags")
install.packages("RColorBrewer")
install.packages("RODBC")
install.packages("rpart")
install.packages("spatstat")
install.packages("spdep")
install.packages("tree")

#This is the location of my packages:
#C:\Users\mevanswh\AppData\Local\Temp\RtmpgV5EQj\downloaded_packages


#2. To load a library, type the library function and the name of the library in parentheses:

library (spatial)


#3. Contents of packages read
#To view contents of packages:

library(help=spatial)

#To view the list of library contents, you use objects funtion with search():

objects(grep("spatial", search ()))

#To find out how to use a function within a library, you can use a ? followed
#by the name of the function or help.search("function"):

?Kfn

help.search("Kfn")

#4Lets Download some data at http://www.bio.ic.ac.uk/research/mjcraw/therbook/index.htm
#let's find out where we should save the files

getwd()
#you will download your data files and save them here.

#5. Data editor:  First identify and activate a data file.  We will use a file named bacteria in the MASS library
#The bacteria is activated by using the attach() command. The data editor is opened using the fix() command

library(MASS)
attach(bacteria)
fix(bacteria)

#6.  Good housekeeping
#To see what variables you have created in the current session, type:

objects()

#To see what packages and dataframes are currently attached:

search()

#To remove any variables you have created:

rm(x,y,z)

#To detach any dataframes:

detach(bacteria)

#To get rid of everything in the current session type the following, but be absolutely sure that 
#you want to do this before you execute the command:

rm(list=ls())


