library(ggplot2)
library(tibble)
# We first want to load some data, so we need to tell the computer where to get it from
# Set the working directory to the folder where you have your files
setwd('C:/Users/cvieira/Dropbox/Phd/Administrative/Mimi/FIE/2019/ScriptsAndData/data/')

# For this example, we need to load the dataset in two different formats to avoid dealing with data transformation
typesOfKnowledge <- read.csv2("typesOfKnowledge.csv",header=TRUE,sep=",", row.names = 1)
meltedToK <- read.csv("meltedData.csv",header=TRUE,sep=",", row.names = 1)

################ Activity #################
#How are these two data frames different? Check them out
typesOfKnowledge
meltedToK
###########################################

# Let's get to the clusters now..

# We need to set a seed to always get the same set of clusters for the same data
set.seed(1234)
# Now we use kmeans function to identify four clusters in the data set.
stdClusters<- kmeans(typesOfKnowledge, 4)
# Check out the cluster for each student
stdClusters

# we need to transform the matrix into a data frame to map the clusters
groups<- as.data.frame(typesOfKnowledge)
# Assign the cluster to the data frame we just created
groups$stdClusters<- as.factor(stdClusters$cluster)

# The students are as row names and we need to have them as column to merge them later
groups <- rownames_to_column(groups, "std")

# Assign the clusters to each student in the melted format (which we will use to plot)
meltedToK <- merge(meltedToK,groups[,c('std','stdClusters')], by.x = 'Student', by.y = 'std')

# Make sure R recognizes the cluster as a categorical variable (it should not be a number!)
meltedToK$stdClusters <- factor(meltedToK$stdClusters, levels=c("1", "2","3","4"))

# Now we can create the plot using ggplot.
# Note that our X axis will have an interaction between the Types of Knowledge and the Steps of de modeling process (variable)
ggplot(meltedToK, aes(x=interaction(ToK,variable),Student))+
  geom_point(aes(size=sum, shape=stdClusters))

# The plot is ready, but it is better to se it organized, so we can do the following:

# Get the list of students in order based on the clusters.
students <- groups[order(groups$stdClusters),]$std
# And use that to organize the students in the data frame
meltedToK$Student <- factor(meltedToK$Student, levels=students)

#Plot it again:
ggplot(meltedToK, aes(x=interaction(ToK,variable),Student))+
  geom_point(aes(size=sum, shape=stdClusters))


################ Activity #################
#How differet does our data look like if we choose three or four clusters?
# Hint:modify the call to kmeans, but make sure you start the script
# from the beginning because our structures have been modified.)
# What else would you need to change? 
###########################################
