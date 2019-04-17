#This is to show you how to make barplots to include multiple observations as bars in a single category
#Here I am just creating a small table of fake data to represent mean values
obs1<-c(1,2,3)
obs2<-c(4,5,6)
observations<-cbind(obs1,obs2)
#The above line of code created a matrix. If your data is in the form of a vector or matrix, you can use 'barplot' to make your graph from here. However, you have to use correct notation when telling R which columns to plot from a matrix. For ex: observations[,1]
#Example plotting from a vector
barplot(obs1)
#Example plotting obs2 from a matrix
barplot(observations[,2])
#Now let's say you want to plot both individual vectors or both columns in the matrix so that bars appear side by side. You can use the'add' argument to add bars to the last plot you made for bargraphs.
#Example using individual vectors
barplot(obs1,space = 2)
#The 'space' agrument spaces the bars out to make room for more bars. The more bars you need to add into a category, the bigger the space you will need.
#Now we can add in the other column of observations
barplot(obs2,space=c(3,2,2),add = T,beside = T)
#Notice that we have to tell R exactly how to space out this second set of bars. You also use the 'add' argument to add these bars to the previous graph and you use the 'beside' argument so they appear side by side.
#The next line of code helps you make a barplot like this one from the matrix you created instead of the vectors.
barplot(observations[,1],space = 2)
barplot(observations[,2],add = T,space = c(3,2,2),beside = T)
#These are the same results as before, just different ways of getting there.
#Depending on how many bars you need to add to your plot, you will have to play with adjusting the spacing accordingly.
#You will likely want to add error bars to your plots, so now I will create a couple of vectors the way I did before to serve as standard error values. I will also make them into a matrix
se1<-c(0.1,0.2,0.3)
se2<-c(0.4,0.5,0.6)
standarderrors<-cbind(se1,se2)
#Here, I will start over with the bar plot from the earlier matrix and give it a name so we can call it up when adding error bars in the next few steps.
bplot<-barplot(observations[,1],space = 2)
#Go ahead and add in the error bars for this first round of bars. Notice that you don't keep renaming things here. If you do, the plot won't work out.
segments(bplot,observations[,1]-standarderrors[,1],bplot,observations[,1]+standarderrors[,1],lwd = 1.5)
arrows(bplot,observations[,1]-standarderrors[,1],bplot,observations[,1]+standarderrors[,1],lwd = 1.5, angle = 90,code = 3,length = 0.05)
#Now we are going to add more bars. Notice that now you should give the plot a name again because it saves all your previous work plus the new bars as a matrix object.
bplot2<-barplot(observations[,2],add = T,space = c(3,2,2),beside = T)



#THIS PART OF THE CODE ISN'T WORKING YET. I WILL WORK MORE ON THIS LATER. YOU CAN ALSO DO SOME RESEARCH ON YOUR OWN IF YOU NEED TO USE THIS PARTICULAR METHOD OF PLOTTING. IN THE MEAN TIME, REFER TO THE GGPLOT METHOD A FEW LINES DOWN.
segments(bplot2,observations[,2]-standarderrors[,2],bplot2,observations[,2]+observations[,2],lwd = 1.5)
arrows(bplot2,observations[,2]-standarderrors[,2],bplot2,observations[,2]+standarderrors[,2],lwd = 1.5, angle = 90,code = 3,length = 0.05)



#now create a bar graph using ggplot
library(ggplot2)
#first, ggplot will want x and y values determined. Our x values are categorical and we can make a vector for them.
namesvec<-c("A","B","C")
#now we can bind our categorical values (labels for x axis) vector to our observation matrix to form a new data frame since ggplot needs a data frame rather than a matrix.
meansframe<-data.frame(namesvec,observations)
View(meansframe)
#Do the same for the x axis names and the standard errors matrix.
seframe<-data.frame(namesvec,standarderrors)
View(seframe)
#R also likes data to be in long for (or tidy) when using ggplot, so let's melt the data.
library(reshape2)
meanslong<-melt(meansframe)
View(meanslong)
#Rename the columns to keep down confusion on what we are looking at now.
names(meanslong)<-c("labels","variables","means")
#Now plot bars for obs1 and obs2 (your variables) side by side. Give the plot a name to fix it in the environment for easy recall.
ggbplot<- ggplot(data = meanslong,aes(x=labels,y=means,fill=variables))+geom_bar(position = position_dodge(),stat = 'identity')
ggbplot
#Remember that you can do lots of aesthetics with ggplot to make it look how you want.
#For now we will just add error bars to the plot. 
#First, we will melt the standard errors data frame to put it in 'long' form.
selong<-melt(seframe)
View(selong)
#Now rename the columns
names(selong)<-c("labels","var.se","se")
#Combine the melted means data frame with just the se column from the melted se data frame.
longcombo<-cbind(meanslong,selong$se)
View(longcombo)
#rename the se column in the combo frame
names(longcombo)[4]<-"se"
#Finally, we can add error bars to our gg bar plot
ggbplot+geom_errorbar(aes(ymin=longcombo$means-longcombo$se,ymax=longcombo$means+longcombo$se),width=.2,position=position_dodge(.9))