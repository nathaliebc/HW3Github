setwd("/cloud/project")

Texts <-read.csv("TextMessages.csv")
#this loaded the external csv files
#we see that this data has 50 observations with 4 variables.

#to view the entire data
View(Texts)

#to view and print on the console the first 5 observations
head(Texts, 5)
#we see the first 5 observations, and the four variables
#the 4 variables are "group", "baseline", "Six_months", and "participants"

#to output the total number of rows in the data:
nrow(Texts)
#this confirms that there are 50 rows (obesercations) as noted in the console qwindow display. 

#view and print the variable names on the console window:
names(Texts)
#The data description shows that there are 4 variable, 
#this command output confirms that there are 4 variables; 
#Those being "Group", "Baseline", "Six_months", "Participant"

#to view the distribution of "Group" categorical variable by using the
#table() command:

table(Texts$Group)
#The distribution shows 25 observations for Group 1, and 
#25 observations for Group 2.
#this confirms that the data has two different groups with the same amount of participants. 

#To View the distribution of the Baseline" continous  variable by using the table() command:

table(Texts$Baseline)
#this command shows the distribution of the amount number of text messages
#within the "baseline" variable 
#the "Baseline" is the starting point in time. 
#in this dsitribution, observations are continous quantitative variable, that are measured
#amount of text messages typed are this time. 
#we can see that there are certain amount of text messages in this data that are reapeated at in the Baseline. 
#the most repeated amount of text messages are 66 with 4 repetitions. 
#the lowest is 46 text messages with 1 observation witth this measure. 

#To View the distribution of the Six_months continoius variable by using the table() command:

table(Texts$Six_months)
#the distribution shows that after six months, these are the amount of text messages type. 
#INFERENCE: We see that at the six months mark,
#the amount of text messaged type are lower than at the base line
#some numbers are also repeated, and with the most being at 61 text messages with 6 repetitions (obeservations).
#the lowest amount of text messages types in six months is 9, 
#signifciantly lower than at the starting point "Baseline"

#View the distribution of the Participant categorical variable by using the table() command:

table(Texts$Participant)
#this outputs all the participants, which are labled in numbers from 1-50, 
#which is the number of obervations (rows) in the data set. 
#INFERENCE: the numbers are used as unique identifiers. 

#since we assume that Group is a categorical variable, we want to asses whether Group is a factor:
is.factor(Texts$Group)
#the result is "False", therefore it indicates that it is not a factor
#so we convert it to a factor, to let Rstudio know to recognize those numberic values as categorical
#showing a characteristic and not as countable numbers

Texts$Group <- as.factor(Texts$Group)
#To Confirm whether Group is now a factor:
is.factor(Texts$Group)
#The result is TRUE, group is a factor now. 
#Group now converted to a factor using the commands above.

#install pastecs to be able to run summary statistics
install.packages("pastecs")

#load the packes and its dependencies. 
library(pastecs)
options(scipen = 999)

#to round to 2 decimal for more accuracy of results
round(stat.desc(Texts$Baseline), 2)


#to output all summary statistics for the Baseline time value, use this command:
stat.desc(Texts$Baseline)
#as mentioned earlier, the lowest number of text messages in "Baseline line is 46

round(stat.desc(Texts$Six_months), 2)
stat.desc(Texts$Six_months)
#this command outputs the summary statistics for the Six montths values
#confirms the minimus of 9 text messages mentioned above

#to stratify the summary statistic of Baseline by Group, use this command:
by(Texts$Baseline, Texts$Group, stat.desc)
#to round to 2, modify the command above with by addiing function (X) round(stat.desc(X), 2)) 
by(Texts$Baseline, Texts$Group, function (X) round(stat.desc(X), 2))

#This stratifies the data in a way we can anaylize the summary statistics better
#we can now see the stratification of Group 1 and Group 2 independently and,
#and its summary statatis in the the Baseline time value. 

#INFERENCE: the minimum for both groups in this category are very close (46  and 47) 
#in this catergory, the std. deveation for group 1 is 10.68 and for group 2 is 10.84; 
#indicating comparable spreads around their respective means.
#Both groups have similar means (64.84 and 65.6) and medians (64 and 65), 
#indicating similar central tendencies.
#the difference between the total number of text messages in both group is only 19. 

#Compute the stratification of summary statistic for Six_months by Group

by(Texts$Six_months, Texts$Group, stat.desc)
by(Texts$Six_months, Texts$Group, function (X) round(stat.desc(X), 2))
#we can now see the stratification of Group 1 and Group 2 independently in Six_months. 
#INFERENCES:
#Group 2 has a higher mean (61.84) and median (62) compared to Group 1 (mean: 52.96, median: 58), 
#suggesting that on average participants in Group 2 generally sent more texts.
#Group 1 has a much larger range (69 vs. 33) and higher standard deviation (16.33 vs. 9.41),
#indicating more variability in the number of texts sent.


