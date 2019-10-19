# Learning Outcomes
# By the end of this activity, you will be able to:
# - Load a data set to visualize the possible relationships among variables
# - Create different plots using the ggplot2 package to represent data from educational phenomena

# Part of this tutorial was adapted from:
# - http://r-statistics.co/Complete-Ggplot2-Tutorial-Part1-With-R-Code.html 
# - Our own work on visualizations


# Since we want to use the plots from the library ggplot2, 
# the first thing we need to do is to import this library 
# install.packages('ggplot2')   # install it first if it is not installed yet
library(ggplot2)

# We first want to load some data, so we need to tell the computer where to get it from
# Set the working directory to the folder where you have your files
setwd('C:/Users/cvieira/Dropbox/Phd/Administrative/Mimi/FIE/2019/ScriptsAndData/data/')

# Read the file into a data frame
litReview <- read.csv2("litReviewData.csv",header=TRUE,sep=";")

# Let's see the first rows our data set
# A quick reminder of our columns: 
# Connection to Visualization Background (CVG)
# Connection to Educational Theories (CET)
# Sophistication of the Visualization (SoV)
# Venue - Journal or conference where the paper was published
# Author - First author of the paper
head(litReview)

# The function ggplot will only create the blank plot specifying our axes
# For example, in the following instruction, we set up the CET as the x axis, and the SoV as the y-axis. 
# Check out what happens when you run it.
ggplot(litReview, aes(x=CET, y=SoV))

# Why did we include that function 'aes()' in the code?
?aes() # Describes how variables in the data are mapped to visual properties of geoms.
       # Everything we want to include into the visualization should be included there.

## We now need to tell ggplot what kind of plot we want. 
ggplot(litReview, aes(x=CET, y=SoV))+
  geom_point()  # Adding this line we are saying we want a scatter plot

# Here are some other ideas:
# geom_point() ==> Scatter Plot
# geom_bar() ==> Bar Plot
# geom_line() ==> Line Plot
# geom_histogram() ==> Histogram
# Each plot would require specific data and columns within the aes function
# For instance, to plot a histogram, we only need x variable:
ggplot(litReview, aes(x=CET))+
  geom_histogram()

# Here is a useful cheatsheet for different plots:
# https://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf

############################ ACtivity ############################
# Change the plot to a line plot
##################################################################


# Let's now get back to our scatter plot, which seems to be best for 
# our purpose: identifying gaps in this literature
ggplot(litReview, aes(x=CET, y=SoV))+
      geom_point()  # Adding this line we are saying we want a scatter plot

# These are still many points, and they are coming from differnt venues
# So, let's use the state to differentiate them with colors
ggplot(litReview, aes(x=CET, y=SoV))+
  geom_point(aes(color=Venue), size=3)  # Do you remember the aes() function?
                                        # Here it is again

# You can change the color palette, edit the legend on the right, and many other things,
# but we will leave these aesthetics functions for some other time.
# If you want to explore, here are a few functions you could use:
# - theme(legend.position="None")  # remove legend
# - scale_colour_brewer(palette = "Set1")  # change color palette


# This is a nice simple scatter plot, but the scales in each axis seem odd
# Let's adjust the axes to go on the whole range of our scale: 0-10
ggplot(litReview, aes(x=CET, y=SoV))+
  geom_point(aes(color=Venue), size=3)+
  ylim(c(0, 10))

# Did you notice that we just added up these new lines of code to the plot? 
# That's how ggplot works, we can just continue adding new lines to modify our plot

############################ ACtivity ############################
# Set the limits 0 to 10 to the x-axis. 
##################################################################

# If we don't want to write the whole thing again, we can just store it in a variable
myPlot <- ggplot(litReview, aes(x=CET, y=SoV))+
  geom_point(aes(color=Venue), size=3)+
  ylim(c(0, 10))
  
# And then, use that variable to add new things to our plot
myPlot+
  ggtitle("Two Dimensional Comparison", subtitle="Gap between Education and Visualization Researchers") + # Add a title and subtitle
  xlab("Connection to Edu. Theories") # Set the axis names

############################ ACtivity ############################
# Set the name for the y-axis
##################################################################

# We can also change the breaks in each axis. Here are a couple of parameters to explain
myPlot+
scale_y_continuous(breaks=seq(0, 10, 1), # Set a break in the y axis every unit
                   limits=c(0, 10)) # Set the limits


# Also note that we used scale_y_continuous because y is a continuous variable,
# but there are other types:
# scale_x_continuous, scale_y_continuous  ==> For numbers
# scale_x_discrete, scale_y_discrete   ==> For categories
# scale_x_date, scale_y_date   ==> For dates
############################ ACtivity ############################
# Change the x-axis limit so have breaks every 1
##################################################################




# Now, there is an issue with our plot, there may be more than one point overlapping
# with each other at a single position.
# We can use the size as an indicaton of how many papers are at each point
# To do that, we use geom_count instead of geom_point
myPlot <- ggplot(litReview, aes(x=CET, y=SoV))+
  geom_count(aes(color=Venue))+
  scale_x_continuous(breaks=seq(0, 10, 1), limits=c(0, 10))+
  scale_y_continuous(breaks=seq(0, 10, 1), limits=c(0, 10))+ 
  scale_size_continuous(breaks = seq(0, 5, 1))+
  labs(title="Two Dimensional Comparison", 
       subtitle="Gap between Education and Visualization Researchers",
       y="Sophistication of the Visualization", 
       x="Connection to Educational Theories", 
       size="# of Studies")
myPlot

############################ ACtivity ############################
# Create a scatter plot for 
# Connection to Educational Theories (CET) vs. Connectino to Visualizaiton Background (CET vs CVG)
##################################################################

