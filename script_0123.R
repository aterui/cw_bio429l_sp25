
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
