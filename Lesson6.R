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
#based on row designation
X<-matrix(c(1,0,0,0,1,0,0,0,1),nrow=3)
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
#adding rows or columns to a matrix
Z<-rbind(Z,c(3,2,1,4))
Z
data1<-cbind(data1,drug.names)
data1
#Let's say you want to apply a function to all observations
#The apply function is used for applying other functions across matrices
A<-matrix(1:24, nrow=4)
A
#In the apply function, the object of the function is listed first, 
# then either a 1 for rows or a 2 for columns,
# then the function to be applied
#The following produces a sum for all the rows in A
apply(A,1,sum)
#The following produces a sum for all the columns in A
apply(A,2,sum)
#the shape of the matrix produced depends on the margin specified 1 or 2
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
#There are circumstances where you may want create an array (set of matrices or tables)
#These are helpful when showing responses by treatment combinations
#Let's say you have a study examining values across a people 
#from 4 income groups and you want to know how age (young, mid, old)
#and sex (male and female) play into it. There is only one value
#per combination of these factors (2*3*4=24)
#We use the array function and it will have 3 dimensions(sex, age, income).
#In parentheses, we have each numbered
#observation as a sequence 1:24 on left, and each factor level 
#2,3,4 listed as a sequence on the right.
data<-array(1:24,2:4)
data
#We add names to our array using the dimnames function
dimnames(data) [[1]]<-list("male","female")
dimnames(data) [[2]]<-list("young","mid","old")
dimnames(data) [[3]]<-list("A","B","c","D")
data
#Suppose we want to reorder this array. We would use aperm
#We want the four income groups to be the columns and age to be rows
#in the subtables. Two subtables for sex.
#the c function will give us the new order for the 
#pre-assigned dimension 1=sex, dim 2= age
#dim3=income, c(row, column, subtable)
#If you put a parentheses around your command
#when you assigne values and tables you will
#see them immediately in the R code
(new.data<-aperm(data,c(2,3,1)))
