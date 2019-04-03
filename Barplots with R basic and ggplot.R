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
#Notice how small the y axis is. It is limited by the largest bar plotted. In order for error bars, which will be added later, to show up completely, you have to reset the parameters of the y-axis.
bplot<-barplot(barmatrix[,1],main = "Title of Bar Graph", ylab = "Y Axis Label", xlab = "X Axis Label",names.arg = c("A","B","C"),col="green",ylim=c(0,10))
#now you can add the error bars. Notice that the arguments call up the name of the barplot to put the bars onto, then it uses the original vectors to actually create the positive and negative ends of the bars.
#use 'segments' to add the verticle portion of the error bars
segments(bplot,meanvec-sevec,bplot,meanvec+sevec,lwd = 1.5)
#use 'arrows' to add the flat ends to the bars
arrows(bplot,meanvec-sevec,bplot,meanvec+sevec,lwd = 1.5, angle = 90,code = 3,length = 0.05)

#now create a bar graph using ggplot
library(ggplot2)
#first, ggplot will want x and y values determined. Our x values are categorical and we can make a vector for them
namesvec<-c("A","B","C")
#now we can bind our categorical values vector to our means and standard errors vectors to form a new data frame since ggplot needs a data frame rather than a matrix
ggbarframe<-data.frame(namesvec,meanvec,sevec)
#give the plot a name to fix it in the environment for easy recall
ggbplot<- ggplot(data = ggbarframe, aes(x=namesvec,y=meanvec))+geom_col()
ggbplot
#to make horizontal bars...
ggbplot+coord_flip()
#replot the verticle bars with a white background
ggbplot+theme_minimal()
#learn more about ggplot2 and other aesthetics under the 'Help' tab.
#add standard error bars to ggplot bar graph
ggbplot+theme_minimal()+geom_errorbar(aes(ymin=ggbarframe$meanvec-ggbarframe$sevec, ymax=ggbarframe$meanvec+ggbarframe$sevec), width=.2,position=position_dodge(.9))

