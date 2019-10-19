##################################################################
# Let's nnow create other interesting plots.
# We will need an additional package for that purpose
install.packages('ggalluvial')
library(ggalluvial)	
library(ggplot2)
# Read this dataset that contains ratings for the teachears "classroom management", "teaching", and "MindSet" practices
classObservation <- read.csv2("observationData.csv",header=TRUE,sep=",")
str(classObservation)

a<-ggplot(classObservation[classObservation$numOfobservationsPerId==1,] , aes(x=ClassManagement )) + 
  geom_histogram(alpha=0.8,  stat="count")

b<-ggplot(classObservation[classObservation$numOfobservationsPerId==2,] , aes(x=ClassManagement )) + 
  geom_histogram(alpha=0.8,  stat="count")
c<-ggplot(classObservation[classObservation$numOfobservationsPerId==3,] , aes(x=ClassManagement )) + 
  geom_histogram(alpha=0.8,  stat="count")

d<-ggplot(classObservation[classObservation$numOfobservationsPerId==4,] , aes(x=ClassManagement )) + 
  geom_histogram(alpha=0.8,  stat="count")
install.packages('scater')
library(Rmisc)

library(scater)
multiplot(a,b,c,d, cols=2)
           # Check out the data set
head(classObservation)
# And check out the structure (Data type of all columns) of our data set
str(classObservation)
# Note that our columns ClassManagement, Teaching, and Mindset variables are Factors, which
# allow us to treat them as categorical variables.

# We can organize these categories using the function 'factor', and 
# we also want to add one for Not Available (NA)
classObservation$ClassManagement<- factor(classObservation$ClassManagement, 
                                          levels=c("High", "Mid", "Low", 'NA'))

classObservation[is.na(classObservation$ClassManagement),]$ClassManagement<-'NA'

# Remember, we first set up the plot
myParallelPlot <- ggplot(classObservation,
                         aes(x = numOfobservationsPerId, # Observation number is our x axis
                             stratum = ClassManagement,  # These are the categories within each observation
                             alluvium = ids,             # Keeps control of individuals
                             fill = ClassManagement,     # Set up the categories for the color
                             label = ClassManagement     # What text will we use for each category
                         ))
myParallelPlot

# Now we can add the streams between observations
myParallelPlot <- myParallelPlot +
  geom_flow()               # The geom_glow allow us to connect the different observations
myParallelPlot

# Now, we can add the distribution boxes along each observation 
myParallelPlot <- myParallelPlot +
  geom_stratum(alpha = .80)+ # The stratum corresponds to our categories
  geom_text(stat = "stratum", size = 3) # Here we put the text within the boxes

# Let's add some names to the labels and axes.
myParallelPlot+
  labs(title="Classroom Manamgent Ratings", 
       subtitle="Progression with visits",
       y="Number of Teachers", 
       x="Observation Number", 
       fill="Rating")



################ Practice Activity ##################################
# Create this plot for the Teaching practices
#####################################################################
