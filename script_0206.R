
# data manipulation

# call library `tidyverse`
# we have to call tidyverse every single time
library(tidyverse)

set.seed(123)

iris_sub <- as_tibble(iris) %>% 
  group_by(Species) %>% 
  sample_n(3) %>% 
  ungroup()

print(iris_sub)


# row manipulation --------------------------------------------------------

## filter() function
## - one match
filter(iris_sub, Species == "setosa")
filter(iris_sub, Species == "versicolor")

## - multiple match "%in% c(XXX)
filter(iris_sub, Species %in% c("setosa", "versicolor"))

## - except !=
filter(iris_sub, Species != "setosa")

## - multiple except
filter(iris_sub, !(Species %in% c("setosa", "versicolor")))

## - filter by numeric information
##  - greater
filter(iris_sub, Petal.Length > 5)

filter(iris_sub, Petal.Length >= 5)

##  - less
filter(iris_sub, Petal.Length < 5)

filter(iris_sub, Petal.Length <= 5)

## arrange() function
## - increasing order
arrange(iris_sub, Sepal.Length)

## - decreasing order
arrange(iris_sub, desc(Sepal.Length))

## exercise
## Q. Sepal.Width is greater than 3.0 and assign the new dataframe to iris_3
iris_3 <- filter(iris_sub, Sepal.Width > 3)

## Q. Species is "setosa" and assign the new dataframe to iris_setosa
iris_setosa <- filter(iris_sub, Species == "setosa")


# column manipulation -----------------------------------------------------

## select() function
## - select one column
select(iris_sub, Sepal.Length)

## - select multiple columns
select(iris_sub, c(Sepal.Length, Sepal.Width))

## - remove one column
select(iris_sub, -Sepal.Length)

## - remove multiple columns
select(iris_sub, -c(Sepal.Length, Sepal.Width))

## - starts_with()
select(iris_sub, starts_with("Sepal"))

## - ends_with()
select(iris_sub, ends_with("Width"))

## mutate() function
# nrow() returns the number of rows of the dataframe
(x_max <- nrow(iris_sub))

# create a vector from 1 to x_max
x <- 1:x_max

## add new column
mutate(iris_sub, row_id = x)

## modify existing column
mutate(iris_sub, sl_two_times = 2 * Sepal.Length)

## exercise
## - Q Select column Petal.Width and Species and assign the new dataframe to iris_pw
iris_pw <- select(iris_sub, c(Petal.Width, Species))

## - Q Select columns starting with text "Petal" and assign the new dataframe to iris_petal
iris_petal <- select(iris_sub, starts_with("Petal"))

## - Q Add new column pw_two_times by doubling values in column Petal.Width, and assign the new dataframe to iris_pw_two
iris_pw_two <- mutate(iris_sub, pw_two_times = 2 * Petal.Width)


# piping ------------------------------------------------------------------

## multiple operations are performed
df_vir <- filter(iris_sub, Species == "virginica")
df_vir_sl <- select(df_vir, Sepal.Length)

print(df_vir_sl)

## with pipe %>% 
df_vir_sl <- iris_sub %>% 
  filter(Species == "virginica") %>% 
  select(Sepal.Length)




