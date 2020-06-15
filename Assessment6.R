
# Filter the NHANES dataset so that only 20-29 year old females are included and assign this new data frame to the object tab.
# Use the pipe to apply the function filter, with the appropriate logicals, to NHANES.
# Remember that this age group is coded with 20-29, which includes a space. You can use head to explore the NHANES table to construct the correct call to filter.

library(dplyr)
library(NHANES)
data(NHANES)
## fill in what is needed
tab <- NHANES %>% filter(AgeDecade == " 20-29" & Gender == "female")


# Complete the line of code to save the average and standard deviation of systolic blood pressure as average and standard_deviation to a variable called ref.
# Use the summarize function after filtering for 20-29 year old females and connect the results using the pipe %>%. When doing this remember there are NAs in the data!
library(dplyr)
library(NHANES)
data(NHANES)
## complete this line of code.
ref <- NHANES %>% filter(AgeDecade == " 20-29" & Gender == "female") %>% summarize(average = mean(BPSysAve, na.rm = TRUE), standard_deviation = sd(BPSysAve, na.rm = TRUE))  

# Use the dot

ref_avg <- NHANES %>%
  filter(AgeDecade == " 20-29" & Gender == "female") %>%
  summarize(average = mean(BPSysAve, na.rm = TRUE), 
            standard_deviation = sd(BPSysAve, na.rm=TRUE)) %>% .$average

# Report the min and max values for the same group as in the previous exercises.
# Use filter and summarize connected by the pipe %>% again. The functions min and max can be used to get the values you want.
# Within summarize, save the min and max of systolic blood pressure as minbp and maxbp.


NHANES %>%
  filter(AgeDecade == " 20-29"  & Gender == "female") %>% summarize(minbp = min(BPSysAve, na.rm=TRUE), maxbp = max(BPSysAve, na.rm=TRUE))

# Use the functions filter, group_by, summarize, and the pipe %>% to compute the average and standard deviation of systolic blood pressure for females for each age group separately.
# Within summarize, save the average and standard deviation of systolic blood pressure (BPSysAve) as average and standard_deviation.
# Note: ignore warnings about implicit NAs. This warning will not prevent your code from running or being graded correctly.

NHANES %>%
  filter(Gender == "female") %>% group_by(AgeDecade) %>% summarize(average = mean(BPSysAve, na.rm = TRUE), standard_deviation = sd(BPSysAve, na.rm=TRUE))

# Do the same for male
NHANES %>% filter(Gender == "male") %>% group_by(AgeDecade) %>% summarize(average=mean(BPSysAve, na.rm=TRUE), standard_deviation=sd(BPSysAve, na.rm=TRUE)) 

# Create a single summary table for the average and standard deviation of systolic blood pressure using group_by(AgeDecade, Gender).
# Note that we no longer have to filter!
NHANES %>% group_by(AgeDecade, Gender) %>% summarize(average=mean(BPSysAve, na.rm=TRUE), standard_deviation=sd(BPSysAve, na.rm=TRUE)) 


# Compute the average and standard deviation for each value of Race1 for males in the age decade 40-49.
# Order the resulting table from lowest to highest average systolic blood pressure.
# Use the functions filter, group_by, summarize, arrange, and the pipe %>% to do this in one line of code.
# Within summarize, save the average and standard deviation of systolic blood pressure as average and standard_deviation.

NHANES %>% filter(Gender=="male" & AgeDecade == " 40-49") %>% group_by(Race1) %>% summarize(average=mean(BPSysAve, na.rm=TRUE), standard_deviation=sd(BPSysAve, na.rm=TRUE)) %>% arrange(average)


