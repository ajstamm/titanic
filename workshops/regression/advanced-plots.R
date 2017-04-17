## #############################################################################
## Advanced Plots
##
## More advanced plots.
##
## Requires the passengers data set.
##
## #############################################################################


## Plot All The Things! --------------------------------------------------------
## Try this on for size.
## Yes, it is a little overwhelming.
plot(passengers, main="Plot All The Things!")


## Age, Slightly Skewed --------------------------------------------------------
## This is another example of doing something complex in R, as a series of
## simple commands. Previously, you drew a histogram of passenger age. But,
## is passenger age normally distributed, or is it skewed?
x <- passengers$age
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
## plot. And we can do that. And, I've got a thing for age.
plot( density(passengers$age), xlab="Age", main="Density Distribution of Titanic Age")
