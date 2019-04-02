#I recreated the gardens chart here because I couldn't get it read into R for some reason
gardenA<-c(3,4,4,3,2,3,1,3,5,2)
gardenB<-c(5,5,6,7,4,4,3,5,6,5)
gardenC<-c(3,3,2,1,10,4,3,11,3,10)
gardens<-cbind(gardenA,gardenB,gardenC)
gardens<-data.frame(gardens)
#calculate means for each column
avgmeanA<-mean(gardens$gardenA)
avgmeanB<-mean(gardens$gardenB)
avgmeanC<-mean(gardens$gardenC)
#calculate standard deviations for each column
devA<-sd(gardens$gardenA)
devB<-sd(gardens$gardenB)
devC<-sd(gardens$gardenC)
#calculate standard error for each column
stderrA<-devA/(sqrt(length(devA)))
stderrB<-devB/(sqrt(length(devB)))
stderrC<-devC/(sqrt(length(devC)))
#create a vector of the means
meanvec<-c(avgmeanA,avgmeanB,avgmeanC)
#create a vector of the standard errors
sevec<-c(stderrA,stderrB,stderrC)
#can use the basic function 'barplot' in R to create a bar plot.
#bind mean and standard error vectors to form a matrix 
barmatrix<-cbind(meanvec,sevec)
#now make a barplot using the matrix containing the means and standard errors
#note that you can create the barplot using the vectors. If you use a 'matrix' object, you cannot use the '$' to call up the means column. You must use the following notation
barplot(barmatrix[,1])
#basic 'barplot' command can take a lot of arguments for aesthetics
barplot((barmatrix[,1]),main = "Title of Bar Graph",ylab = "Y Axis Label",xlab = "X Axis Label",names.arg = c("A","B","C"),col="green")
#arguments include the ability to make horizontal bars
barplot(barmatrix[,1],main = "Title of Bar Graph", ylab = "Y Axis Label", xlab = "X Axis Label",names.arg = c("A","B","C"),col="green",horiz = TRUE)
#read more about 'barplot' arguments with '?barplot'
#replot with vertical bars and give the graph a name to fix it to the environment
bplot<-barplot(barmatrix[,1],main = "Title of Bar Graph", ylab = "Y Axis Label", xlab = "X Axis Label",names.arg = c("A","B","C"),col="green")
#now you can add the error bars. Notice that the arguments call up the name of the barplot to put the bars onto, then it uses the original vectors to actually create the positive and negative ends of the bars.
segments(bplot,meanvec-sevec,bplot,meanvec+sevec,lwd = 1.5)
arrows(bplot,meanvec-sevec,bplot,meanvec+sevec,lwd = 1.5, angle = 90,code = 3,length = 0.05)
#it appears that some of the positive ends of the error bars are missing, but that is because of the limitations of the y-axix. The y-axis is set to a max of the biggest bar in the plot. The parameters will have to be reset in order to see the rest of the error bars.


  
