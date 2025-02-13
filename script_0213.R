
# visualization

# call library `tidyverse`
# we have to call tidyverse every single time
library(tidyverse)


# basic ggplot syntax -----------------------------------------------------

## scatter plot
iris %>% # hotkey for pipe is Ctr + Shift + M
  ggplot(aes(x = Sepal.Length,
             y = Sepal.Width)) +
  geom_point()

iris %>% 
  ggplot(aes(x = Sepal.Length,
             y = Sepal.Width,
             color = Species)) +
  geom_point()

# small exercise
# - draw a scatter plot
# - x axis is Petal.Length
# - y axis is Petal.Width
# - colored by Species

g <- iris %>% 
  ggplot(aes(x = Petal.Length,
             y = Petal.Width,
             color = Species)) +
  geom_point()


## line figure
df0 <- tibble(x = rep(1:50, 3),
              y = 2 * x)

df0 %>% 
  ggplot(aes(x = x,
             y = y)) +
  geom_line()
  
## histogram
iris %>% 
  ggplot(aes(x = Sepal.Length)) +
  geom_histogram()
  
iris %>% 
  ggplot(aes(x = Sepal.Length)) +
  geom_histogram(binwidth = 0.5)
  
iris %>% 
  ggplot(aes(x = Sepal.Length)) +
  geom_histogram(bins = 50)
  
## exercise
## - create a histogram of Petal.Width
## - specify binwidth to be 0.25
iris %>% 
  ggplot(aes(x = Petal.Width)) +
  geom_histogram(binwidth = 0.25)

## boxplot
iris %>% 
  ggplot(aes(x = Species,
             y = Sepal.Length)) +
  geom_boxplot()

iris %>% 
  ggplot(aes(x = Species,
             y = Sepal.Length,
             color = Species)) +
  geom_boxplot()

iris %>% 
  ggplot(aes(x = Species,
             y = Sepal.Length,
             fill = Species)) +
  geom_boxplot()

## exercise
## - create boxplot for Petal.Length, by Species
## - x is Species, y is Petal.Length
## - specify fill as Species

iris %>% 
  ggplot(aes(x = Species,
             y = Petal.Length,
             fill = Species)) +
  geom_boxplot()
  
  



  

