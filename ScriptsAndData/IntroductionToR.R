# Learning Outcomes
# By the end of this activity, you will be able to: 
# - Describe the different sections of RStudio
# - Create variables, assign and read values to/from these variables
# - Compute simple calculatinos among variables/values
# - Convert the data type of the variables
# - Create and invoke functions that compute simple calculations

# All the lines of code that are below correspond to R programming code
# The lines starting with the symbol # represent a 'comment' and will not be executed
# Every time you want to execute one of these lines, please select it and click on Run (upper right corner)

# The symbol <- assigns a value to a variable
# For instance, if we want to assign the value 5 to a variable 'y'
y <- 5
# Let's make sure it has the corresponding value - please execute the following line
y
# Now we can use the variable 'y'. Let's multiply 'y' by the value 2:
y*2
# Since we did not assign it to any variable, 'y' will keep the same value
y
# Now, if we want to save the result in a variable 'x':
x <- y*2
# Check out the value of variable 'x' now
x

################ Practice Activity ##################################
# Divide 'x' by 'y' and assign it to a variable 'a'
# Make sure that 'a' has the correct value in it
#####################################################################

# Now, let's create a small data set called vector
# A vector is a data list that we store in a single variable
# We can create a vector using the instruction c()
z <- c(1.1, 9, pi, 5 , 6, 7, 8) 
# What is the meaning of having 'pi' in this vector?
# Check out the value of the variable 'z' 
z

# This vector can be used to create larger vectors
# For example, if we want to create a vector with all values in 'z', 
# but also the values from 'x' and y', we can use:
c(x,z,y)

################ Practice Activity ##################################
# Create a vector with all the values from 'z' twice, and 'x's value in the middle
# This should look something like:
# 1.1, 9, 3.141593, 5 , 6, 7, 8, 10, 1.1, 9, 3.141593, 5 , 6, 7, 8
#####################################################################

# What happens if we multiply a vector by a scalar number?
z * 2 + 100
# Describe the results here:



# Other operators that can be used are: `+`, `-`, `/`, y `^`
# x^2 means to 'square' x
x^2

# Now, if you want to find the square root of a variable, you will need to use the function sqrt().
# A function is a group of instructions that we assign a name to
sqrt(x)

# Any time you have a question about a function from R, you can access its information using '?'
# For instance, if you want to know what the 'mean' function does:
?mean
# On the lower right corner window you should be able to see the information

# What is the purpose of the 'mean' function?


# You can use it with vector 'z', like this:
mean(z)

# We can also make calculations between vectors
# For instance, the following instruction will multiply one by one the elements from both vectors
z * c(2, 1, 2,3,5,6,4)

# When the length is different for both vectors, R 'recycles' the numbers from the smaller vector
# This recylcing process re-uses the numbers on the same order. For instance:
c(2, 2, 4, 4) + c(1, 2)
# The outcome is a vector including four elements, just like executing: c(2, 2, 4, 4) + c(1, 2, 1, 2)

# Now, if we want to have more than one column in a single variable,  we can use a matrix or a data frame
# The main difference between these two data structures is that matrices can only store one data type (e.g., numbers), 
# while data frames can include both of them

# Let's first create a vector called mi_vector containing all integers from 1 to 20.
# We can do that using the operator ':' 
mi_vector <-1:20
# Check out the content of mi_vector
mi_vector

# To validate the data type, we can use the function 'class'
class(mi_vector)

# If we want to know how many elements are in there, we can use the function 'length'
length(mi_vector)

################ Practice Activity ##################################
# How many elements are in 'z'? 
#####################################################################

#  Now we can turn our vector into a 4x5 matrix
dim(mi_vector)<-c(4,5)
# What we just did was to tell R that mi_vector will have four rows and five columns
mi_vector

################ Practice Activity ##################################
# Check out the data type of mi_vector again
#####################################################################

# Let's use an appropriate name for our variable
mi_matrix <- mi_vector

# Another approach to create this matrix is:
matrix(1:20,nrow=5, ncol=5)

# Let's assume that the numbers in each row correspond to individual students
# from which we know five values: age, height, grade, GPA, and weight

# It would be good to know which student corresponds to each row, 
# so we can create this additional column
students <- c('Charlie','Hayden','Alex','Ben')
mi_data <- cbind (students, mi_matrix)

# Now all the values in mi_matrix have quotation marks around them
mi_data

# This is because the matrix can only have a single data type: in this case all the values are
# considered to be text

# To keep our data types, we need to use a data frame
mi_data <- data.frame(students, mi_matrix)
mi_data

# Now, to assign names to the columns, we use the function 'colnames'
colnames(mi_data)<- c("Name", "age", "height", "grade", "GPA", "weight")

mi_data

# If you want to access a single column from the data frame, use the '$' symbol
mi_data$age
mi_data$Name



# As you have seen, we can invoke existing functions such as mean or cbind to perform certain tasks
# There are many of these functions in R, and any time you want to do something, 
# you should try to find an existing function first
# For instance, to get a vectors with 20 random numbers normally distributed:
randNumbers <- rnorm(20)

################ Practice Activity ##################################
# Find the functions that will find the minimum value in randNumbers
#####################################################################

# If we don't find an existing function for our task, we can create our own
# This is similar than creating a variable in the sense that we assign a function with '<-'
# The following function multiples 'a' times 'b' and divides the result by 'c'
myFunction <- function(a,b,c)
{
  x <- (a*b)
  y <- x/c
  y
}

# We can invoke this function using the following parameters a=10 b=5, c=2 like
myFunction(10,5,2)
# Likewise
myFunction(b=5, c=2, a=10)

# The 'apply' function is often challenging to understand, but it is very useful
# These are a family of functions that will execute a given functions through the elements of a given data set
??apply

# For instance, if we create a function to print numbers from a list one by one:
printNumber <- function(number)
{
  textToPrint <- paste('The number is: ',number)
  print(textToPrint)
}

printNumber(3)
printNumber(5)

# We can invoke this function for all the elements from randNumbers 
output <- lapply(randNumbers, printNumber)

# Note that we pass the name of our function (printNumber) as a parametter to lapply.
# We will be using lapply for our methods later.
