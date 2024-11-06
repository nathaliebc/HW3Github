setwd("/cloud/project")

install.packages("readxl")
#Installed package to read Excel File

library(readxl)
#Loaded the package and its dependencies

Mess <- read.csv("TextMessages (1).csv")
#Importing the .csv file and naming it Mess

install.packages("ggplot2")
#Installed the ggplot2 package for my Bar Chart

library(ggplot2)
#Loaded the package and its denpendencies

install.packages("pastecs")
#Installed pastecs package to use the stat_summary...
#function to create my Bar Chart

library(pastecs)
#Loaded the package and its dependencies

names(Mess)
#To view and print the variable names

table(Mess$Six_months)
#To see the distribution of Six_months variable

table(Mess$Group)
#To see the distribution of Group variable

is.factor(Mess$Group)
#Checking to see if Group is a factor

Mess$Group <- as.factor(Mess$Group)
#It is not so will then ask R to view it as one

is.factor(Mess$Group)
#Checking to see if it is now a variable

Timebar_GroupbyMonth <- ggplot(Mess, aes(Group, Six_months))
#setting the x-y axis: the categorical variable(Group) will be set on the x-axis
#and the continuous variable (Six_months) will be set on the y-axis
#I then created an object called Timebar_GroupbyMonth ...
#that will store all of this information
#This time to create a stratified bar plot with Group by Six_months(Time)

Timebar_GroupbyMonth + stat_summary(fun.y= mean, geom= "bar", 
                                    fill= "white", colour= "black")+ labs(x= "Group", y= "Time")
#Outputs the blank x-y axis with the x-axis labeled exactly like the Group variable and the
#y-axis labeled exactly like the Six_months variable now labeled time
#Because we want to plot a summary of the data(the mean) rather than the raw scores themselves ...
#we use the stat function specifically the stat_summary( ) which takes ... 
#the following general form: stat_summary(function = x, geom = y)
