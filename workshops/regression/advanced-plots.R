## #############################################################################
## Advanced Plots
##
## Plots to demonstrate Base R's graphics abilities. 
##
## Examples focus on the train data set, but work with the test data set too.
##
## The data dictionary is available here:
## http://choens.github.io/titanic/workshops/regression/data-dictionary/
##
## #############################################################################


## Plot All The Things! --------------------------------------------------------
## You know how I keep telling you that R is object oriented, and that functions
## adapt based on the type of data passed to the function?
## Well, try this on for size.
## Yes, it is a little overwhelming.
plot(train, main="Plot All The Things!")


## Age, Slightly Skewed --------------------------------------------------------
## This is another example of doing something complex in R, as a series of
## simple commands. PReviously, you drew a histogram of passenger age. But,
## is passenger age normally distributed, or is it skewed?
x <- train$age
h <- hist(x, col="lightblue",
          xlab = "Passenger Age",
          main = "Age, Slightly Skewed"
          )
xfit <- seq( min(x, na.rm=TRUE), max(x, na.rm=TRUE), length=length(x) ) 
yfit <- dnorm( xfit, mean=mean(x, na.rm=TRUE), sd=sd(x, na.rm=TRUE) ) 
yfit <- yfit*diff( h$mids[1:2] )*length(x) 
lines(xfit, yfit, col="red", lwd=2)


## Plot the distribution density -----------------------------------------------
## Sometimes, histograms just aren't enough. Sometimes, we want a kernel density
## plot. And we can do that.
plot( density(train$fare), xlab="Cost", main="Distribution of Titanic Fare Costs")


## Everything x Everything -----------------------------------------------------
## Writing a bunch of 2x2 comparisons is sooooooo boring.
## We can just do it all at once.
## You might be wanting to sit down for this one.
pairs(train, main="Everything By Everything")
