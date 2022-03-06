library(dplyr)

###Deliverable 1 ###########################################################
# import csv file
#example code from 15.2.3
#demo_table demo_table <- read.csv(file='demo.csv',check.names=F,stringsAsFactors = F)
MechaCar_mgp <- read.csv(file='./Data/MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

#Perform linear regression using the lm()function
#example code from module 15.7.3
#> lm(qsec ~ mpg + disp + drat + wt + hp,data=mtcars) 
Mecha_lm <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle +ground_clearance + AWD, data=MechaCar_mgp)
Mecha_lm

#view using summary
summary(Mecha_lm)

#view R-squared
summary(Mecha_lm)$r.squared


###Deliverable 2 ########################################################
#import csv file
Suspension_Coil <- read.csv(file='./Data/Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

#Create a summary table for suspension coils
total_summary <- Suspension_Coil %>%
  summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), Std_Dev=sd(PSI))
total_summary

#view by lots using group_by
lot_summary <- Suspension_Coil %>% group_by(Manufacturing_Lot) %>%
  summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), Std_Dev=sd(PSI))
lot_summary

##Deliverable 3 ###########################################################
#note: level of significance is .05 

#Ho: Mu = 1500
#Ha: mu <> 1500

t.test(Suspension_Coil$PSI, mu=1500)

#analysis- p-value(0.06) is greater than 0.05 therefore we fail to reject Ho

#t-test by lots
#lot 1
t.test(subset(Suspension_Coil, Manufacturing_Lot=="Lot1")$PSI, mu=1500)

#lot 2
t.test(subset(Suspension_Coil, Manufacturing_Lot=="Lot2")$PSI, mu=1500)

#lot 3
t.test(subset(Suspension_Coil, Manufacturing_Lot=="Lot3")$PSI, mu=1500)