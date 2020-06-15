library(HistData)
data(Galton)
x <- Galton$child

# Compute the average and median of these data. Note: do not assign them to a variable

mean(x)
median(x)

# Compute the standard deviation and the median absolute deviation of these data.
sd(x)
mad(x)

# Now suppose that Galton made a mistake when entering the first value, 
# forgetting to use the decimal point. You can imitate this error by typing:

library(HistData)
data(Galton)
x <- Galton$child
x_with_error <- x
x_with_error[1] <- x_with_error[1]*10

# Report how many inches the average grows after this mistake. 
# Specifically, report the difference between the average of the data with 
# the mistake x_with_error and the data without the mistake x.
mean(x_with_error) - mean(x)


# Report how many inches the SD grows after this mistake. 
# Specifically, report the difference between the SD of the data with 
# the mistake x_with_error and the data without the mistake x.

sd(x_with_error) - sd(x)


# REport Impact on median
median(x_with_error)-median(x)

# Impact on median absolute
mad(x_with_error)-mad(x)


# Write a function called error_avg that takes a value k and returns 
# the average of the vector x after the first entry changed to k. 
#Show the results for k=10000 and k=-10000.

x <- Galton$child
error_avg <- function(k){
  x[1]<- k
  mean(x)
  
}

error_avg(10000)
error_avg(-10000)

