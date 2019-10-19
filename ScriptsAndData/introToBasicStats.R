# Learning Outcomes
# By the end of this activity, you will be able to: 
# - Load data from a CSV (Comma Separated Values) file 
# - Summarize a data frame using descriptive statistics
# - Conduct statistical analysis to compare two groups or two measures of the same group

# We first want to load some data, so we need to tell the computer where to get it from
# Set the working directory to the folder where you have your files
setwd('C:/Users/cvieira/Dropbox/Phd/Administrative/Mimi/FIE/2019/ScriptsAndData/data/')
# Read the file into a data frame
percepcionsAndLearning <- read.csv("sampleData.csv",header=TRUE,sep=";")

head(percepcionsAndLearning)

# Check out the data frame
# This is a  data set contains the following columns
# - Prior Courses: Number (or type) of previos courses in programming
# - Control  (Pre, Post, and Gain): self-perceived ability to create a computer program
# - Value (Pre, Post, and Gain): perceived value of computing in their carreers.
# - Learning (Pre, Post, Gain): conceptual understanding of specific topics
percepcionsAndLearning


# Remeber that You can access a specific column using the symbol '$' .
percepcionsAndLearning$ControlPre



# To compute the descriptive statistics you can:
mean(percepcionsAndLearning$ControlPre) # Mean
sd(percepcionsAndLearning$ControlPre) # Standard Deviation

################ Practice Activity ##################################
# Find the mean and standard deviation for the learning  variables in the dataframe
#####################################################################

# Alternatively, you can get the mean for all your columns using:
summary(percepcionsAndLearning)

# The column Courses describes the number previous courses each student had

# If you want to get the mean or sd for specific groups (e.g. based on the previous courses),
# Mean of ControlPre for students with different number of previous courses
aggregate(LearningPre~PriorCourses,percepcionsAndLearning,mean)
# SD of ControlPre for students with different number of previous courses
aggregate(LearningPre~PriorCourses,percepcionsAndLearning,sd)

################ Practice Activity ##################################
# Find the mean and standard deviation for the learning gain grouping them by the prior courses
#####################################################################


# You can easily compute T-tests in R using the function t.test with different options based on what you need
# the function 'with' is simply saying what data we are using.
with(percepcionsAndLearning, t.test(LearningPre, LearningPost, paired=TRUE))  	# Paired
with(percepcionsAndLearning, t.test(LearningPre, LearningPost, var.equal=TRUE))  # Two Sample - This one is just 
                                                                                 # an example, but it is incorrect for
                                                                                 # this dataset, since we should do a Paired test
with(percepcionsAndLearning, t.test(LearningPre, LearningPost))  # Welch non-parametric (when variances are unequal)

################ Practice Activity ##################################
# Which one of these three tests make sense for the data set?
#####################################################################

################ Practice Activity ##################################
# Identify whether there are statistically significant differences
# between InterestPre	InterestPost
#####################################################################
