## #############################################################################
## Import Passengers
##
## Imports the Titanic passengers data (250 rows, 13 columns).
##
## #############################################################################



## Import  Passengers Data -----------------------------------------------------
## This could be one line of code, but it would run off my slide.
## Good coding practice: Keep your code to 80 cols or less.
url <- "http://choens.github.io/titanic/public/data/passengers.csv"
passengers <- read.csv(file = url)



## Your Turn -------------------------------------------------------------------
## Did it work?

## Run each command to confirm you have imported the data correctly.
## You can record any output you would like as a comment.
dim(passengers)
names(passengers)
str(passengers)
head(passengers)
tail(passengers)
class(passengers)

## PLEASE TELL US NOW IF YOU CAN'T GET THIS CODE TO WORK!
## YOU WILL NEED THIS DATA FRAME FOR THE REST OF THE DAY.
