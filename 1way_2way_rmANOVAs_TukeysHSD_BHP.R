#For One-way, Two-way, and repeated measures ANOVAs

#If you have only manipulated one thing(factor) in your experiment, you would run a one-way ANOVA.
#Example:
onewaymodel<-aov(response~factor)


#If you manipulated two things(factors) in your experiment, you would run a two-way ANOVA.
#Example:
twowaymodel<-aov(response~factor1*factor2)
####Notice that you can use the '*' symbol between factors to incorporate several manipulated factors...MANOVA. The output will give you summary stats for each individual manipulated factor and all combinations of factors.


#If you collect data several times over a period of time(as 'time' below), you have done repeated measures.
#Example of repeated measures with two manipulated factors.
repmeas2waymodel<-aov(response~(factor1*factor2)+Error(time)/(factor1*factor2))


#You will need to look at the results of your ANOVAs. To get a summary table, do the following:
summary(aovmodelname)
#If you assign a name to this summary, you can simply call the name to see the results later on as an easy way to access the output for printing or writing tables elsewhere.
#Example:
aovsumm<-summary(aovmodelname)


#If your results are significant, you will need to do a post hoc test. Tukey's HSD test is good for ANOVAs.
#Example:
TukeyHSD(aovmodelname)
#You can name this test for easy recall similar to how you named the ANOVA output.
#Example:
tuksumm<-TukeyHSD(aovmodelname)