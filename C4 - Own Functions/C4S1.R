a <- 3
b <- 4
c <- sqrt(a^2 + b^2)
c

Pythagoras <- function(a,b)
{
  c <- sqrt(a^2 + b^2)
  print(a)
  print(b)
  c
}


Pythagoras(a=1,b=1)

Pythagoras(a=3,b=4)

# Use of the list function in your Pythagoras function
Pythagoras <- function(a,b)
{
  c <- sqrt(a^2 + b^2)
  list(a=a, b=b, hypothenusa=c)
}
# Apply your function
Pythagoras(a=1,b=1)

Pythagoras(a=3,b=4)


x <- -3.526

x1 <- 21
x2 <- 5



my_own_vector <- rep(25:80)
a <- own_min(my_own_vector)
b <- own_median(my_own_vector)
c <- own_mean(my_own_vector)
d <- own_sd(my_own_vector)
e <- own_length(my_own_vector)


own_min <- function(vec)
{
  new_vec <- min(vec)
  list(vec=vec, own_min_value=new_vec)
}

own_median <- function(vec)
{
  new_vec <- median(vec)
  list(vec=vec, own_median_value=new_vec)
}

own_max <- function(vec)
{
  new_vec <- max(vec)
  list(vec=vec, own_max_value=new_vec)
}

own_mean <- function(vec)
{
  new_vec <- mean(vec)
  list(vec=vec, own_mean_value=new_vec)
}

own_sd <- function(vec)
{
  new_vec <- sd(vec)
  list(vec=vec, own_sd_value=new_vec)
}

own_length <- function(vec)
{
  new_vec <- length(vec)
  list(vec=vec, own_length_value=new_vec)
}

#proctor
#data management - r software - fundamentals 


#1. Write a function which gives the most elementary statistics for a sample x: min, median, max, mean, sd and length. Apply your function on a vector x with values from 25 to 80.

#2. Write a function fun1 which produces the text ‘Non-negative number’ if you apply fun1 to a positive number and ‘negative number’ if you apply fun1 to a negative number. You can make use of the ifelse
#function in R. Apply this function to the values 9 and -13:
  
fun1 <- function(number)
{
  #rango <- rep(-13:9)
  return(ifelse(number>0,'Non-negative number',ifelse(number==0, 'zero', 'negative number')))
}  
 

fun1(-0) 





