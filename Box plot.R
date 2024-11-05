setwd("/cloud/project")



TextM <- read.csv("TextMessages(1).csv", header = TRUE)

install.packages("ggplot2")

library(ggplot2)


install.packages("reshape")

library(reshape)

names(TextM)

long_data <- melt(TextM, id.vars = c("Participant", "Group"), variable.name = "Time", value.name ="Value")

is.factor(long_data$Group)

long_data$Group <- as.factor(long_data$Group)
#Covert to factor!

is.factor(long_data$Group)

Box <- ggplot(long_data, aes(Group, value))

Box

Box + geom_boxplot() 

Box + geom_boxplot() + labs(x="Group", y="All Text Messages") 

                  
                  






