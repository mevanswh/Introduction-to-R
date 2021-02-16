#setwd ("C://Users//mevanswh//Desktop//rdata")
setwd("~/Documents/therbook")
library(foreign)
library(stringr)
install.packages("plyr")
install.packages("reshape2")
library(plyr)
library(reshape2)
source("xtable.r")

# Data from http://pewforum.org/Datasets/Dataset-Download.aspx

# Load data -----------------------------------------------------------------

pew <- read.spss("pew.sav")
pew <- as.data.frame(pew)
head(pew)
#First, we construct a command to extract the data we need
religion <- pew[c("q16", "reltrad", "income")]
head(religion)
#It would be good to know the membership of our new
#database vectors
summary(religion)
#Now we can begin further tidying the data by coercing
#and getting rid of extra words
religion$reltrad <- as.character(religion$reltrad)
summary(religion)
religion$reltrad <- str_replace(religion$reltrad, " Churches", "")
#Replaced Church with nothing
religion$reltrad <- str_replace(religion$reltrad, " Protestant", " Prot")
#Replaced Protestant with Prot
#Notice that q16 and reltrad vectors have information in them that we 
#need for the final table. So the next steps allow us to combine
#information from q16 into reltrad. Atheists and Agnostics received
#an "unaffiliated" classification in reltrad.
# the form here is a logical statement within parentheses
religion$reltrad[religion$q16 == " Atheist (do not believe in God) "] <- "Atheist"
religion$reltrad[religion$q16 == " Agnostic (not sure if there is a God) "] <- "Agnostic"
#trims whitespace from start and end of string
religion$reltrad <- str_trim(religion$reltrad)
religion$reltrad <- str_replace_all(religion$reltrad, " \\(.*?\\)", "")
#now we move to our next vector 1)shortens the entries
#automatically assigns income to a character vector
religion$income <- c("Less than $10,000" = "<$10k", 
                     "10 to under $20,000" = "$10-20k", 
                     "20 to under $30,000" = "$20-30k", 
                     "30 to under $40,000" = "$30-40k", 
                     "40 to under $50,000" = "$40-50k", 
                     "50 to under $75,000" = "$50-75k",
                     "75 to under $100,000" = "$75-100k", 
                     "100 to under $150,000" = "$100-150k", 
                     "$150,000 or more" = ">150k", 
                     "Don't know/Refused (VOL)" = "Don't know/refused")[religion$income]

summary(religion)
religion$income <- factor(religion$income, levels = c("<$10k", "$10-20k", "$20-30k", "$30-40k", "$40-50k", "$50-75k", 
                                                      "$75-100k", "$100-150k", ">150k", "Don't know/refused"))

str(religion)
#In tidied data, the counts in each factor level is
#the response variable. This command produces a dataset with vector "freq"
counts <- count(religion, c("reltrad", "income"))
#The data table now has 3 columns "reltrad", "income", and "freq"
#We want to change the name of column one from"reltrad"
#to "religion"
names(counts)[1] <- "religion"
xtable(counts[1:10, ], file = "pew-clean.tex")
