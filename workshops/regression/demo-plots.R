## #############################################################################
## Demo Plots
##
## - Plots to demonstrate Base R's graphics abilities.
##   http://choens.github.io/titanic/workshops/regression/import-passengers.R
## - All examples use the passengers data set.
##
## #############################################################################



## LEARNING OBJECTIVES ---------------------------------------------------------
## - R has many graphical packages.
##   - ggplot2     (publishing to, everywhere)
##   - ggvis       (publishing to web)
##   - lattice     (publishing to PDF)
##   - plotly      (publishing to web)
##   - htmlwidgets (publishing to web)
## - Today, we use Base R



## BASE R GRAPHICS -------------------------------------------------------------
## - Encourage interactive use
## - Easy to remember commands
## - Good defaults!
## - Thank You: John W. Tukey



## OPENING DISCUSSION ----------------------------------------------------------
## Plotting functions we will use today:
## - plot() You've already used this command.
## - barplot()
## - boxplot()
## - hist()



## AGE -------------------------------------------------------------------------
## Remeber:
mean(passengers$age)

## Only one variable? X axis is row number. Can look like a trend.
plot(passengers$age)

## Use sample() to avoid.
plot(sample(passengers$age))



## AGE BY PASSENGER CLASS ------------------------------------------------------
## First Class passengers were the oldest group.
## Third Class was the youngest AND the most diverse.
## X/Y Axis Order matters!
plot(x=passengers$passenger_class, y=passengers$age)



## REMEMBER FACTORS ------------------------------------------------------------
## - Superficially similar to character/string variables.
## - Tells R a variable is a categorical variable.
## - Factors have different defaults in plot()



## AGE BY PASSENGER CLASS (FACTOR) ---------------------------------------------
## - If we tell R that passengers$passenger_class is a categorical variable,
##   the scatter plot becomes a box plot!
##   - The box is +/- 1 standard deviation from the mean.
##   - The whiskers is 1.5 the interquartile range.
## - Third-class (steerage) was the youngest (and the most diverse) group.
plot(as.factor(passengers$passenger_class),
     passengers$age
    )



## BARPLOTS ---------------------------------------------------------------------
## You can't create a barplot with raw data. It needs a table.
## The barplot is a good way to visualize categorical data.

# Our passenger data has more males than females
table(passengers$sex)

# Creates a table called tbl_sex
tbl_sex <- table(passengers$sex)
tbl_sex



## PASSENGER SEX ---------------------------------------------------------------
## Input is a table object.
barplot(tbl_sex)

## Simple commands, building on one another.
barplot(table(passengers$sex))

## STOP! TEACHABLE MOMENT ------------------------------------------------------
## - SAS/SPSS: Powerful, independent commands.
## - R: Simple commands work together.
## - Both methods have advantages.
## - One reason R is so modular.

## YOUR TURN! ------------------------------------------------------------------
## Learn how to use the prop.table command.
## Use this command to build a table showing the
## proportions of males and females in passengers.
?prop.table



## YOUR TURN! ------------------------------------------------------------------
## Now use prop.table to build a proportional barplot.


## GET SOME HELP! --------------------------------------------------------------
## - Eventually, we all need som help.
## - stackoverflow.com
## - google.com
## - Let's practice finding help.



## YOUR TURN! ------------------------------------------------------------------
## - Download the exploratory-plots.R and advanced-plots.R files.
##   - https://choens.github.io/titanic/workshops/regression/exploratory-plots.R
##   - https://choens.github.io/titanic/workshops/regression/advanced-plots.R
## - Will show you more plotting and graphing commands and techniques.
## - There is sooooo much we could discuss . . . and only three hours to do so.
## - Remember, these materials are available after this workshops.
