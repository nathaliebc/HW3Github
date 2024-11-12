setwd("/cloud/project")

TM <- read.csv("TextMessages.csv", header = TRUE) 
is.factor(TM$Six_months)
#False

names(TM)

install.packages("pastecs")

library(pastecs)

stat.desc(TM$Baseline)

stat.desc(TM$Six_months)

round(stat.desc(TM$Baseline),2)
 
