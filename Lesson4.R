#On a pc you set the wroking directory using a command similar to this
setwd ("C://Users//mevanswh//Desktop//rdata")
#On Mac, you set working directory using a command similar to this
setwd("~/Documents/therbook")
#Testing and coercing in R
#Membership relates to the class of an object in R. Coercion changes the class of an object.
#We can create (c) a variable that is classified as logical.  This is how we create the variable
lv<-c(T,F,T)
#This is how we test it's membership
is.logical(lv)
#It is not a factor, and so it does not have any levels:
levels(lv)
#But we can coerce it to be a two-level factor like this:
(fv<-as.factor(lv))
#we test its membership
is.factor(fv)
#we can coerce a logical variable to be numeric: True=1 and FALSE=0
(nv<-as.numeric(lv))
#We can test it
is.numeric(nv)
#
#Try out on cells?
#This is a particularly useful shortcut when creating new factors with a reduced number of levels as
#we might do in model simplification
#Missing Values in Dataframes (2.5.1).  Missing values affect the way that most model fitting functions
#operate and they can reduce the power of the model.  If you want to discover where missing values occur.
y<-c(4,NA,7)
#2 ways of searching that won't work for you are the following:
y==NA
#This command turns all the values into NA
y=="NA"
#It correctly identifies NA, but returns NA for the missing value instead of TRUE.  You must learn
#to do it the correct way in order to nest it in other functions to remove missing values.
is.na(y)
#To produce a vector with the NA Stripped out, use the substripts with the not operator (!)
y[! is.na(y)]
#Now you can edit out rows containing missing values from large dataframes, which will be useful
#in downloading and analyzing large data sets.  Here is an example that 1)creates vectors with missing values
#the c in this command is for create.  You are creating a new vector
y1<-c(1,2,3,NA)
y2<-c(5,6,NA,8)
y3<-c(9,NA,11,12)
y4<-c(NA,14,15,16)
#The #2)The next command aggregates all the vectors into a dataframe.
full.frame<-data.frame(y1,y2,y3,y4)
#Y1-Y4 vectors become columns in a dataframe called full.frame, the next command checks that
full.frame
#We can create a csv or text file with our new dataframe for Pc
write.csv(full.frame, file="C://Users//mevanswh//Desktop//rdata//fullframe.csv")
#we can create a csv for Mac using.  Macs will need to change codes in the later lines
write.csv(full.frame, file="fullframe.csv")
file.exists("fullframe.csv")
#We can check that the file exists
file.exists("C://Users//mevanswh//Desktop//rdata//fullframe.csv")
#We can remove the row numbers by adding
write.csv(full.frame, file="C://Users//mevanswh//Desktop//rdata//fullframe2.csv",row.names=FALSE)
#We are going to create a new dataframe called reduced.frame that has no missing value in column y1
reduced.frame<-full.frame[!is.na(full.frame$y1),]
reduced.frame
#Why would you want to remove a whole row with one missing reading?
#another way to get rid of na's and convert to file
write.csv(full.frame, file="C://Users//mevanswh//Desktop//rdata//fullframe3.csv",row.names=FALSE,na="")
#Some functions do not work with their default settings when there are missing values in the data,
#mean is an example of this.
x<-c(1:8,NA)
#This creates a sequence vector with NA as last value
mean(x)
#To calculate the mean of the non-missing values, you would need to specify that the NA are to be removed
#using the na.rm=TRUE argument:
mean(x,na.rm=T)
