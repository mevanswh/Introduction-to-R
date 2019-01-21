#Introduction to R 090815
#1.Make an R script in R editor.  First, open the R editor
#Annotate it with your name and date
#Reset R's Brain
rm(list=ls()) 
#Get the current working directory using getwd
getwd()
#Set the current working directory to your rdata file
setwd ("C://Users//mevanswh//Desktop//rdata")
#create a variable named data and define it as the daphnia.txt file
data<-read.table("daphnia.txt",header=T)
#attach the variable data
attach(data)
#One thing you should always do is check that the data are your data
# and in the form you expect.  To examine the first few lines of data.  
head(data)
#To see the whole data set, you just type in the variable name data.  list(data) works in mac
data
#Why wouldn't you just want do this...look at the whole data set instead
#of just the first rows or maybe other summary characteristics...BIG DATA.
#Lets explore some more ways to check that your data are correct
#without looking at each line
#To see a list of the names of each column header
names(data)
#To see the dimensions of the data (rows by columns)
dim(data)
#To see the structure of the dataset.  This listes each vector and identifies the type of vector it is.  It also provides
#the number of levels in a factor variable
str(data)
#To see a summary of the dataset.  This command gives you the names
#of factors, how many levels in each factor, and how many experimental
#replicates per treatment level.  It provides a summary frequency distribution of numeric vectors
summary(data)
#Sometimes it useful to isolate, find, and grab parts of your data.
#Variable name {x,y].Rows=x and columns=y are denoted within 
#brackets seperated by commma
data[,1]
data[1,]
#You can ask for more than one column or row by including a colon
#in your number address
data[,1:3]
#This command gave you columns 1 to 3
data[1:3,]
#this command gave you rows 1 to 3
data[1:3,1:3]
#This command gave you rows only 1-3 and columns only 1-3
#R allows us to replace column numbers with an actual column name (word)
#in quotes.  The next 3 commands do the same thing
data[,"Water"]
#compare this with
data[,2]

#finally, we can isolate a column in a data frame using the following syntax
#employing symbol$.  This works for dataframes like Daphnia.txt, but not
#for matrices--all numbers
data$Water
#The subset() function allows you to subset your data by specific columns
#and values within those columns
#use the syntax subset(data.frame.name, column.name == value)
#where column.name is the name of the column varialbe and value is the value
#in rows you would like to keep.  This value would either be a value/
#number if the column contains continuous data, or a factor level in quotes 
#if the column contains continuous data
subset(data, Water=="Tyne")

#aggregate and tapply. Aggregate returns a dataframe.  Tapply returns a matrix
aggregate(data$Growth.rate, list(data$Detergent), mean)
tapply(data$Growth.rate, list(data$Detergent), mean)
#mean, sd, median, and even functions you make yourself can go in the last statement
aggregate(data$Growth.rate, list(data$Detergent), sd)
aggregate(data$Growth.rate, list(data$Detergent), median)

#Take the mean of treatments within a subset of another level by first
#naming another variable assigned to your subset.  Then, replacing the old
#variable name with new variable name in the aggregate or tapply function
tyne.mean<-subset(data, Water=="Tyne")
aggregate(tyne.mean$Growth.rate, list(tyne.mean$Detergent), mean)




