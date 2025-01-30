
# trial -------------------------------------------------------------------

# x <- 2
# y <- 4 - 17
# z <- 113 * 234


# vector ------------------------------------------------------------------

# ex.1a manually create a vector using c()
(x <- c(1, 3, 4, 8))

# ex.1b character
(x <- c("a", "b", "c"))

# ex.1c logical
(x <- c(TRUE, FALSE, FALSE))

# ex.3a replicate same numbers or characters

# you can create vector in this way, but ineffective
x <- c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1)

# this is more effective
(x <- rep(1, times = 10)) # replicate 2 five times

# ex.3b replicate same numbers or characters
(x <- rep("a", times = 5)) # replicate "a" five times

# ex.3c replicate each element multiple times
v <- c(1, 2)
(x <- rep(v, each = 2))

# ex.4a use seq() function
# create a vector from 1 to 5 with interval 1
(x <- seq(1, 5, by = 1))

# ex.4b use seq() function
# create a vector from 1 to 5 with 20 elements
(x <- seq(1, 5, length = 20))

# ex.5a use colon `:` - interval is fixed at one
(x <- 1:5)


# extract summary ---------------------------------------------------------

x <- c(10, 15, 20)
mean(x)

x <- c(10, 15, 20)
sum(x)

x <- c(10, 15, 20)
length(x)


# access elements ---------------------------------------------------------

x <- c(2, 2, 3, 2, 5)
x[2] # access element #2

x[c(2, 4)] # access elements #2 and 4

x[2:4] # access elements #2-4


# equation matching -------------------------------------------------------

# creating a vector
x <- c(2, 2, 3, 2, 5)

# ex.1a equal
x == 2

# ex.1b larger than
x > 2 

# ex.2a equal
x[x == 2]


# exercise ----------------------------------------------------------------

# a. Create three numeric vectors with length 3, 6 and 20, respectively. The three vectors must be created using different functions
x3 <- c(1, 2, 3)
x6 <- rep(1, times = 6)
x20 <- seq(0, 100, length = 20)
x20 <- rep(0, times = 20)

# b. Create two character vectors with length 3 and 20, respectively. The two vectors must be created using two different functions (c(), rep()).
z3 <- c("a", "b", "c")
z20 <- rep("a", times = 20)

# c. Copy the following script to your R script and perform the following analysis:
set.seed(1)
y <- rnorm(100)

# Identify element IDs of y that are greater than 2.0
which(y > 2)

# Identify element values of y that are greater than 2.0
y[y > 2]

# Calculate the arithmetic mean of y
mean(y)

# data frame --------------------------------------------------------------

# Create data frame

# Lake type
x <- c("Pristine", "Pristine", "Disturbed", "Disturbed", "Pristine")

# TSS: total suspended solids (mg/L)
y <- c(1.2, 2.2, 10.9, 50.0, 3.0)

# x is named as "LakeType" while y is named as "TSS"
(df0 <- data.frame(LakeType = x, TSS = y))

df0$LakeType # access LakeType
df0$TSS # access TSS

## access by column number
df0[,1]
df0[,2]

## access by row number
df0[1,]
df0[5,]

## data frame exercise
set.seed(1)
x <- rnorm(100, mean = 10, sd = 3)
y <- rpois(100, lambda = 10)
z <- rep(c("VA", "NC"), 50)
df0 <- data.frame(temperature = x, abundance = y, state = z)

## Access temperature column.
df0$temperature

## Calculate the means of temperature and abundance for states VA and NC separately.
## get NC data
df_nc <- df0[df0$state == "NC", ]
mean(df_nc$temperature)
mean(df_nc$abundance)

## get VA data
df_va <- df0[df0$state == "VA", ]
mean(df_va$temperature)
mean(df_va$abundance)
