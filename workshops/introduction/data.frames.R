## #############################################################################
## Data.Frames.R
## #############################################################################



## Data.Frames -----------------------------------------------------------------
## Run code, learn more
## ~45 Minutes
## Some time at the end?
## Good Bye



## Learning Objectives ---------------------------------------------------------
## What is a data.frame?
## Creation
## Visualization
## Import CSV data
## Indexing
## Deletion



## Data.Frames -----------------------------------------------------------------
## - N dimensional object
##   - Usually 2-dimensional.
##   - Normal people call this a table.
## - All entries in a column have the same class (data type)
## - Rows can have entries of difference classes
## - A single data.frame is easier to manage than a collection of vectors.
## - Relationship between the entries is made explicit



## Creation --------------------------------------------------------------------
## First we need some vectors
age <- c(22,38,26,35,35,NA,54,2,27,14)
gender <- c("male","female","female","female","male","male","male","male","female","female")
survived <- c(FALSE,TRUE,TRUE,TRUE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE)



## Creation --------------------------------------------------------------------
## Then we put them together
passengers <- data.frame(age, gender, survived)

## Yeah, the capital V is important. Dunno why.
View(passengers)



## Those numbers on the left, row numbers.
## All R objects must fit into memory.



## Your Turn! ------------------------------------------------------------------
## What does this tell us?
dim(passengers)



## Import CSV data -------------------------------------------------------------
## We don't have to make everything.
## We can import data, from CSV, Excel, Databases, etc.
## Today, we only care about CSV.

## Import data from CSV.
## This WILL overwrite the data.frame we made a few minutes ago!
url <- "http://choens.github.io/titanic/public/data/passengers.csv"
passengers <- read.csv(url)



## Your Turn! ------------------------------------------------------------------
## Spend some quality time with the following commands.
## ?foo is a great way to read the documentation.
dim(passengers)
names(passengers)
summary(passengers)
str(passengers)
View(passengers)
head(passengers)
tail(passengers)

## Let us know if you need help



## Reuse What You Know! --------------------------------------------------------
## R is Object Oriented (OO); functions adapt to the data type.
## New data types often work with old commands.
## Both of the following code segments work.

## Here, head() returns the first few items from the vector "survived".
survived <- c(FALSE,TRUE,TRUE,TRUE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE)
head(survived)

## Here, head() returns the first few rows of the data.frame passengers.
head(passengers)

## One command, but different types of returns, depending on data type.



## Indexing --------------------------------------------------------------------
## Back to the land of square brackets
## Critical: passengers[ROW,COLUMN]

## Returns one row by row #.
passengers[10, ]

## Returns one column by column name.
passengers[ ,"age"]



## Another Way To Index --------------------------------------------------------
## There is an easier way to refer to a single column
## A single column IS a Vector.
passengers$age



## Your Turn! ------------------------------------------------------------------
## Create a new data.frame called "children".
## Children must be younger than 18.



## Your Turn! ------------------------------------------------------------------
## What does ls() do?
ls()



## Your Turn! ------------------------------------------------------------------
## Were men and women equally likely to survive the Titanic?
## chisq.test() is the command to run the Chi Squared Test.
## table() can be used with 2 vectors! Try table(foo$bar, foo$baz).
## Don't worry about calculating the percents. We'll do that together.
## You can use a calculator or Excel. I won't tell anyone.



## TABULAR MARGINS AND PERCENTS ------------------------------------------------
## In these commands 1 ALWAYS means "over rows" and 2 ALWAYS means "over columns"

## MARGINS
## Margins are what other tools call Totals.
margin.table( table(passengers$sex, passengers$survived), margin=2)
            
## MARGINS
## At least they didn't invent a new term for proportion.
prop.table( table(passengers$sex,



## Deletion --------------------------------------------------------------------
## This is thankfully EASY
## Make it all go away
rm(children)


## Your Turn! ------------------------------------------------------------------
## Were children more likely to survive the Titanic?
## chisq.test() is the command to run the Chi Squared Test



## That's All Folks! -----------------------------------------------------------
