## #############################################################################
## Demo Plots
##
## Plots to demonstrate Base R's graphics abilities. 
##
## Examples focus on the train data set, but work with the test data set too.
##
## #############################################################################


## =============================================================================
## Opening Discussion
## =============================================================================

## There are several plotting functions in Base R:
## - hist()
## - abline()
## - plot()
## - barplot()
## - boxplot()
## - pairs()
## - plot()

## Remember - R is an object oriented language, functions adapt to data type.
## This means plot() is more flexible than you might think.


## =============================================================================
## TRAIN: Let's Get Graphical
##
## These examples all present data from the "train" data set.
## =============================================================================

## Scatterplot -----------------------------------------------------------------
## Today, we will treat Age as a continuous variable.
## Uses the index, the row number, as the x axis if not specified.
## Most passengers were between 20 and 40.

plot(train$age)

## Age, stratified by Passenger Class
## First Class passengers were the oldest group.
## Third Class was the youngest AND the most diverse.
plot(x=train$pclass, y=train$age)

## We can also express this with a formula.
## This is still a scatter plot, because that is the default for numerics.
plot(train$age~train$pclass)

## But, if we tell R that train$pclass is a categorical variable,
## you get a completely different (and more useful) plot.
## Again, we see steerage was the youngest AND the most diverse group.
## The box is +/- 1 standard deviation from the mean. The whiskers is 1.5 the
## interquartile range.
plot(train$age~as.factor(train$pclass))


## Barplot ---------------------------------------------------------------------
## The barplot is a good way to visualize categorical data.
## Barplots _must_ be based on a table in R.

## Table, showing the breakdown of the sex var.
table(train$sex)

## This is the barplot, based on that table.
## The output from table() is the input to barplot().
## This is an important, but abstract idea to grasp.
## Each command is simple. Together, they do something more complex.
barplot(table(train$sex))


## We can use this same pattern to see the previous plot as a proportion.
## Creates a var, p, as an intermediary.
## Small commands interact to do something complex.

## First, make a table, and then convert it into proportions.
p <- prop.table(table(train$sex))
p

## But we want percents, so we rescale our results.
p <- round(p*100,2)
p

## Draw the table.
## Again, the logic of R is to use little commands, in a sequence, to do
## something complicated. 
barplot(p)

## OR . . . . we can use plot.
## Here, plot offers us something that is similar to a barplot, albeit not as
## nice to look at.
plot(train$sex)

## Formula works too.
## Because train$sex is a character vector, R assumes it is a factor.
## R won't do this, by default, with factors coded as integers.
plot(train$age~train$sex)


## -----------------------------------------------------------------------------
## SURVIVED
## Optimistic column name. Most passengers died.
## -----------------------------------------------------------------------------

## This is a good opportunity to look at he impact of data type on the output
## created by the plot() command.
typeof(train$survived)
table(train$survived)

## Survived is an integer column, with values of 1 and 0.
## Graphically, a barplot makes the most sense. 
## So, we tell R to treat train$survived as a factor.
plot( as.factor(train$survived) )

## What percent of passengers survived in the train data set?
prop.table( table(train$survived) )

## Yikes - Can we see that visually? (YES)
barplot( prop.table( table(train$survived) ) )

## From simple to complex, by layering commands.


## -----------------------------------------------------------------------------
## PCLASS
## -----------------------------------------------------------------------------
## There were actually more first class passengers than second class.
## And lots of steerage.
plot( as.factor(train$pclass) )

## You can get the same results a different way:
## This has the advantage that you can more easily get percentages.
barplot( table(train$pclass) )
