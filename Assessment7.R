# Using ggplot and the points layer, create a scatter plot of life expectancy versus fertility for the African continent in 2012.
# Remember that you can use the R console to explore the gapminder dataset to figure out the names of the columns in the dataframe.
# In this exercise we provide parts of code to get you going. You need to fill out what is missing. But note that going forward, in the next exercises, you will be required to write most of the code.
library(dplyr)
library(ggplot2)
library(dslabs)
data(gapminder)
## fill out the missing parts in filter and aes
gapminder %>% filter(continent == "Africa" & year == 2012) %>%
  ggplot(aes(fertility, life_expectancy)) +
  geom_point()

# Remake the plot from the previous exercises but this time use color to distinguish the different regions of Africa to see if this explains the clusters. Remember that you can explore the gapminder data to see how the regions of Africa are labeled in the data frame!

gapminder %>% filter(continent == "Africa" & year == 2012) %>%
  ggplot(aes(fertility, life_expectancy, color = region)) +
  geom_point()

# Create a table showing the country and region for the African countries (use select) that in 2012 had fertility rates of 3 or less and life expectancies of at least 70.
# Assign your result to a data frame called df.
data(gapminder)
df <- gapminder %>% filter(continent == "Africa" & year == 2012 & fertility <= 3 & life_expectancy >=70) %>% select(c(country, region))



# Use filter to create a table with data for the years from 1960 to 2010 in Vietnam and the United States.
# Save the table in an object called tab.
years <- 1960:2010
countries <- c("United States", "Vietnam")
tab <- gapminder %>% filter(year %in% years & country %in% countries)

# Use geom_line to plot life expectancy vs year for Vietnam and the United States and save the plot as p. The data table is stored in tab.
# Use color to distinguish the two countries.
# Print the object p.
p <- tab %>% ggplot(aes(year, life_expectancy, color = country)) + geom_line()

p

# Use a single line of code to create a time series plot from 1960 to 2010 of life expectancy vs year for Cambodia.
gapminder %>% filter(country == "Cambodia" & year>=1960 & year<=2010) %>% ggplot(aes(year, life_expectancy)) + geom_line()


# Use mutate to create a dollars_per_day variable, which is defined as gdp/population/365.
# Create the dollars_per_day variable for African countries for the year 2010.
# Remove any NA values.
# Save the mutated dataset as daydollars.
daydollars <- gapminder %>%
  filter(continent == "Africa" & year == 2010 & !is.na(gdp)) %>%
  mutate(dollars_per_day = gdp/population/365)



# The dataset including the dollars_per_day variable is preloaded as daydollars.
# Create a smooth density plot of dollars per day from daydollars.
# Use scale_x_continuous to change the x-axis to a log (base 2) scale.
daydollars %>% ggplot(aes(dollars_per_day)) + geom_density() + scale_x_continuous(trans = "log2")


# Create the dollars_per_day variable as in Exercise 7, but for African countries in the years 1970 and 2010 this time.
# Make sure you remove any NA values.
# Create a smooth density plot of dollars per day for 1970 and 2010 using a log (base 2) scale for the x axis.
# Use facet_grid to show a different density plot for 1970 and 2010.
years <- c(1970, 2010)
daydollars <- gapminder %>%
  filter(continent == "Africa" & year %in% years & !is.na(gdp)) %>%
  mutate(dollars_per_day = gdp/population/365)

daydollars %>% ggplot(aes(dollars_per_day)) + geom_density() + scale_x_continuous(trans = "log2") + facet_grid(.~ year)


# Much of the code will be the same as in Exercise 9:
#  Create the dollars_per_day variable as in Exercise 7, but for African countries in the years 1970 and 2010 this time.
# Make sure you remove any NA values.
# Create a smooth density plot of dollars per day for 1970 and 2010 using a log (base 2) scale for the x axis.
# Use facet_grid to show a different density plot for 1970 and 2010. 
# Make sure the densities are smooth by using bw = 0.5.
# Use the fill and position arguments where appropriate to create the stacked density plot of each region.

data(gapminder)
years <- c(1970, 2010)
daydollars <- gapminder %>%
  filter(continent == "Africa" & year %in% years & !is.na(gdp)) %>%
  mutate(dollars_per_day = gdp/population/365)

daydollars %>% ggplot(aes(dollars_per_day, fill = region)) + geom_density(position = "stack", bw = 0.5) + scale_x_continuous(trans = "log2") + facet_grid(.~ year)



# Generate dollars_per_day using mutate and filter for the year 2010 for African countries.
# Remember to remove NA values.
# Store the mutated dataset in gapminder_Africa_2010.
# Make a scatter plot of infant_mortality versus dollars_per_day for countries in the African continent.
# Use color to denote the different regions of Africa.

gapminder_Africa_2010 <- gapminder %>%
  filter(continent == "Africa" & year == 2010 & !is.na(gdp)) %>%
  mutate(dollars_per_day = gdp/population/365) # create the mutated dataset

# now make the scatter plot
gapminder_Africa_2010 %>% ggplot(aes(dollars_per_day, infant_mortality, color = region)) + geom_point()



# The mutated dataset is preloaded as gapminder_Africa_2010.
# As in the previous exercise, make a scatter plot of infant_mortality versus dollars_per_day for countries in the African continent.
# As in the previous exercise, use color to denote the different regions of Africa.
# Transform the x axis to be in the log (base 2) scale.

gapminder_Africa_2010 %>%  ggplot(aes(dollars_per_day, infant_mortality, color = region)) + geom_point() + scale_x_continuous(trans = "log2")

# The mutated dataset is preloaded as gapminder_Africa_2010.
# As in the previous exercise, make a scatter plot of infant_mortality versus dollars_per_day for countries in the African continent.
# As in the previous exercise, use color to denote the different regions of Africa.
# As in the previous exercise, transform the x axis to be in the log (base 2) scale.
# Add a geom_text layer to display country names in addition to of points.

gapminder_Africa_2010 %>% ggplot(aes(dollars_per_day, infant_mortality, color = region, label = country)) + geom_text() + scale_x_continuous(trans = "log2")



# Generate dollars_per_day using mutate and filter for the years 1970 and 2010 for African countries.
# Remember to remove NA values.
# As in the previous exercise, make a scatter plot of infant_mortality versus dollars_per_day for countries in the African continent.
# As in the previous exercise, use color to denote the different regions of Africa.
# As in the previous exercise, transform the x axis to be in the log (base 2) scale.
# As in the previous exercise, add a layer to display country names instead of points.
# Use facet_grid to show different plots for 1970 and 2010. Align the plots vertically.

data(gapminder)
years <- c(1970, 2010)
daydollars <- gapminder %>%
  filter(continent == "Africa" & year %in% years & !is.na(gdp) & !is.na(infant_mortality)) %>% mutate(dollars_per_day = gdp/population/365)

daydollars %>% ggplot(aes(dollars_per_day, infant_mortality, color = region, label = country)) + geom_text() + scale_x_continuous(trans = "log2") + facet_grid(year~.)





