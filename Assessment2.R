library(dslabs)
data(heights)
male <- heights$height[heights$sex=="Male"]
female <- heights$height[heights$sex=="Female"]

# Report the length of each variable.

length(male)
length(female)

# Create two five row vectors showing the 10th, 30th, 50th, 70th, and 90th percentiles 
# for the heights of each sex called these vectors female_percentiles and 
# male_percentiles.

male <- heights$height[heights$sex=="Male"]
female <- heights$height[heights$sex=="Female"]

female_percentiles<- quantile(female, probs = c(0.1, 0.3, 0.5, 0.7, 0.9))
male_percentiles<- quantile(male, probs = c(0.1, 0.3, 0.5, 0.7, 0.9))

df <- data.frame(female = female_percentiles, male = male_percentiles)
df










