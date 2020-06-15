library(dslabs)
data(heights)
x <- heights$height[heights$sex == "Male"]

#What proportion of the data is between 69 and 72 inches 
# (taller than 69 but shorter or equal to 72)? A proportion is 
# between 0 and 1.

mean(x <= 72) - mean(x <= 69)

#Use the normal approximation to estimate the proportion the proportion of 
# the data that is between 69 and 72 inches.

avg <- mean(x)
stdev <- sd(x)

pnorm(72, mean(x), sd(x)) - pnorm(69, mean(x), sd(x))

# Use normal approximation to estimate the proportion of heights 
# between 79 and 81 inches and save it in an object called approx.

exact <- mean(x > 79 & x <= 81)
approx<- pnorm(81, mean(x), sd(x)) - pnorm(79, mean(x), sd(x))

# Report how many times bigger the actual proportion is 
# compared to the approximation.
exact/approx

# Assume that the distribution of adult men in the world as normally distributed 
# with an average of 69 inches and a standard deviation of 3 inches.
# use pnorm to calculate the proportion over 7 feet (7*12 inches)
1-pnorm(7*12, 69, 3)

# Use your answer to the previous exercise to estimate the proportion of men that 
# are seven feet tall or taller in the world and store that value as p.

p<- 1- pnorm(7*12, 69, 3)

N<- round(p*10^9)

# There are about 10 National Basketball Association (NBA) players that are 7 feet tall or higher.
# calculate the proportion of the world's 18 to 40 year old seven footers that 
# are in the NBA.
10/N

# Repeat the calculations performed in the previous question for Lebron James' 
# height: 6 feet 8 inches. There are about 150 players, instead of 10, 
# that are at least that tall in the NBA.

p <- 1 - pnorm(6*12+8, 69, 3)
N <- round(p * 10^9)
150/N









