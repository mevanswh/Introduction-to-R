#Other ways to make Matrices
#We have used the function data.frame to string together
#vectors. Remember:
y1<-c(1,2,3,4)
y2<-c(5:8)
y3<-c(9:12)
y4<-c(13:16)
data1<-data.frame(y1,y2,y3,y4)
#You may also use the matrix command
#It reads from left to right and assigns columns
#based on row designation.  So in the following example,
#there are only going to be 3 rows, there have to be 3 columns
X<-matrix(c(1,2,3,11,12,13,5,6,7),nrow=3)
X
#If you have an existing vector that you want to 
#convert to a matrix, you can use a slightly different
#format for the objects in the matrix command. So first
#we create a vector, then use matrix on the vector
Z<-c(1,2,3,4,4,3,2,1)
V<-matrix(Z, byrow=T, nrow=2)
V
#Another way to convert an existing vector into a matrix 
#is with dim function
dim (Z)<-c(4,2)
#You see this removed our Z variable from under the "values"
#heading to the "data" heading in the global environment
#You can also see that when we converted it to a matrix
#we asked for 4 rows and 2 columns
#another way to get the same structure using matrix function
W<-c(1,2,3,4,4,3,2,1)
U<-matrix(W, byrow=T, nrow=4)
#We can transpose matrices using function t
Z <- t(Z)
#Now the matrix Z is the same as V
Z
V
#Notice that your rows and columns are named by numbers
#You can name the rows and columns of matrices
#do.NULL is a logical function. If = FALSE names are created
#If you were to put TRUE here then it just gives the numbers again
rownames(Z)<-rownames(Z,do.NULL=FALSE,prefix="Trial.")
Z
colnames(Z)<-colnames(Z,do.NULL=FALSE,prefix="Drug.")
Z
#the row or column names can be more specific
#but first you must create a variable
drug.names<-c("aspirin", "paracetamol", "nurofen", "hedex")
colnames (Z)<-drug.names
Z
#adding rows or columns to a matrix; rbind= add another row to a database
Z<-rbind(Z,c(3,2,1,4))
Z
#cbind = add another column to a database
data1<-cbind(data1,drug.names)
data1
#Let's say you want to apply a function to all observations
#The apply function is used for applying other functions
#across matrices. The next command creates a matrix with 4 rows
#How many columns?
A<-matrix(1:24, nrow=4)
A
#In the apply function, the object of the function is listed first, 
# then either a 1 for rows or a 2 for columns,
# then the function to be applied
#The following produces a sum for all the rows in A
apply(A,1,sum)
#The following produces a sum for all the columns in A
apply(A,2,sum)
#the shape of the matrix produced depends on the margin specified 1
#or 2
#applied to 1, produces a matrix with rows as column headers
apply(A,1,sqrt)
#applied to 2, produces a matrix with columns as column headers
apply(A,2,sqrt)
#You can supply your own function
#y=x^2+x
apply(A,2,function(x) x^2+x)
#we can make this a new matrix if we simply assign it
B<-apply(A,2,function(x) x^2+x)
#Let's start with a clean slate
rm(list=ls())
#We will learn how to sort and manipulate databases
setwd ("C://Users//mevanswh//Desktop//rdata")
worms<-read.table("worms.txt",header = T)
#notice the set up of this database.
#all measures reflecting the same variable are listed in one column
#This rule causes one to have to delineate factor variables associated
#with each replicate measure of the same variable in a column as well
#if we attach this database, we can simply call it by name.
attach(worms)
#let's find out a little about the database
summary(worms)
#str gives us the structure
str(worms)
#If we view the worms database, we find that replicates
#are listed in no particular order.
#Let's learn how to sort the database
#It is common to want to sort a database by rows, but not by columns
#Because good databases are made up of atomic column vectors
#with each row representing a replicate in your experimental design
#let's sort all replicates in order of the variable "slope"
worms[order(Slope),]
worms.slope<-worms[order(Slope),]
#Notice the structure.  When there are ties for a particular value of 
#slope, then rows are listed in their original order
#To sort on more than one variable simply use a comma
#R will sort first on the left hand variable, then ties are broken
#by the second variable
worms[order(Vegetation,Worm.density),]
#and so on
worms[order(Vegetation,Worm.density,Soil.pH),]
#to reverse the order, .e.g. from ascending to descending
worms[rev(order(Slope)),]
#remember we can grab bits and pieces of the dataset
#whenever we want
worms[,3]
worms[1,]
worms[1:5,2:3]

