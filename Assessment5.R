library(dplyr)
library(ggplot2)
library(dslabs)
data(heights)
data(murders)
p <- ggplot(murders)

# What is the class of the object p?

class(p)


# Using the pipe %>%, create an object p associated with the heights dataset 
# instead of with the murders dataset as in previous exercises.
data(heights)
# define ggplot object called p like in the previous exercise but using a pipe 
p<- heights %>% ggplot()

# Fill out the sample code with the correct variable names to 
# plot total murders versus population size.

murders %>% ggplot(aes(x = population, y = total)) +
  geom_point()

# Remake the plot but flip the axes so that total is on 
# the x-axis and population is on the y-axis.
murders %>% ggplot(aes(total, population)) +
  geom_point()

# add a label aesthetic to aes equal to the state abbreviation
# use geom_label instead of geom_point

library(dplyr)
library(ggplot2)
library(dslabs)
data(murders)
## edit the next line to add the label
murders %>% ggplot(aes(population, total, label = abb)) +
  geom_label()

# Rewrite the code above to make the labels blue by adding an argument to geom_label.
# You do not need to put the color argument inside of an aes col.

murders %>% ggplot(aes(population, total,label= abb)) +
  geom_label(color = "blue")

# Rewrite the code above to make the label color correspond to the state's region. 
# Because this is a mapping, you will have to do this through the aes function. 
# Use the existing aes function inside of the ggplot function.

murders %>% ggplot(aes(population, total, label = abb, color = region)) +
  geom_label()

# To change the x-axis to a log scale we learned about the scale_x_log10() function. 
# We can change the axis by adding this layer to the object p to change the scale 
# and render the plot using the following code:

# Change both axes to be in the log scale on a single graph. 
# Make sure you do not redefine p - just add the appropriate layers.
p <- murders %>% ggplot(aes(population, total, label = abb, color = region)) + geom_label()
## add layers to p here
p + scale_x_log10() + scale_y_log10()

# We are now going to add a title to this plot. We will do this by adding yet another layer, 
# this time with the function ggtitle.
p <- murders %>% ggplot(aes(population, total, label = abb, color = region)) +
  geom_label()
# add a layer to add title to the next line
p + scale_x_log10() + 
  scale_y_log10() + ggtitle("Gun murder data")


# Create a ggplot object called p using the pipe to assign the heights data to 
# a ggplot object.
# Assign height to the x values through the aes function.
# define p here
p <- heights  %>% ggplot(aes(height))

# Add a layer to the object p (created in the previous exercise) using 
# the geom_histogram function to make the histogram.
p <- heights %>% 
  ggplot(aes(height))
## add a layer to p
p + geom_histogram()

# Use the binwidth argument to change the histogram made in the previous exercise 
# to use bins of size 1 inch.
p <- heights %>% 
  ggplot(aes(height))
## add the geom_histogram layer but with the requested argument
p + geom_histogram(binwidth = 1)

# Now instead of geom_histogram we will use 
# geom_density to create a smooth density plot.
## add the correct layer using +
heights %>% 
  ggplot(aes(height)) + geom_density()

# Create separate smooth density plots for males and females by defining group 
# by sex. Use the existing aes function inside of the ggplot function.

## add the group argument then a layer with +
heights %>% 
  ggplot(aes(height, group = sex)) + geom_density()


# Change the density plots from the previous exercise to add color.
## edit the next line to use color instead of group then add a density layer
heights %>% 
  ggplot(aes(height, color = sex)) + geom_density()


# When using the geom_density geometry, color creates a colored line for 
# the smooth density plot while fill colors in the area under the curve.
# However, here the second density is drawn over the other. 
# We can change this by using something called alpha blending.
# Set the alpha parameter to 0.2 in the geom_density function to make this change.
heights %>% 
  ggplot(aes(height, fill = sex,)) + 
  geom_density(alpha = 0.2)








