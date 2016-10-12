## #############################################################################
## vectors.R
## #############################################################################

## VECTORS ---------------------------------------------------------------------
## - Code: vectors.R
## - Run code, learn more
## - Duration: ~45 Minutes
## - Followed by: A 5 Minute Break


## LEARNING OBJECTIVES ---------------------------------------------------------
## - Vectors Are Important!
## - How To Make One
## - How To Delete One
## - Vector Indexing (How To Subset)
## - Work With Two Vectors



## VECTORS ARE IMPORTANT -------------------------------------------------------
## - Congrats, you have already worked with Vectors
## - Understanding them is CRITICAL to becoming a useR (sic)

## This is a vector, length == 1.
captain <- "John Smith"

 ## This is a vector too, length == 5.
 age <- c(22, 38, 26, 35, 35)



## COMBINE ---------------------------------------------------------------------
## -Use c() to combine things
## -Works for numerics, characters, booleans, dates, etc.
## -If they aren't the same type of data, R will reduce to the lowest common denominator.
## -In practice, this is usually a character vector
## -You can treat vectors as an object and do things to it


## YOUR TURN! ------------------------------------------------------------------

## Going forward, you will want these two vectors.
age <- c(22,38,26,35,35,NA,54,2,27,14)
gender <- c("male","female","female","female","male",
            "male","male","male","female","female")

## Check that you have them with this code:
length(age)
length(gender)
    
## The answer to both length() commands should be 10


## STOP! -----------------------------------------------------------------------

## If you didn't succeed with the last slide, SAY SOMETHING!


## VISUALIZE A VECTOR ----------------------------------------------------------
## A vector is like a column in Excel

##                                   age
##                                   22
##                                   38
##                                   26
##                                   35
##                                   35
##                                   NA
##                                   54
##                                   2
##                                   27
##                                   14
##                                   NA isn't a string, it is NA


## FUNCTIONS ON A VECTOR -------------------------------------------------------
## - Some functions act on each element in the vector
## - Some functions act on the vector in total
 
## Per Item
age + 1
            
## In Total
table(gender)
            
## NA --------------------------------------------------------------------------
## - NA is the bane of our existence
## - na.rm=TRUE is our friend
## - Example: mean()
 
## This will not work.
mean(age)
            
## This works just fine.
mean(age, na.rm=TRUE)



## HELP! -----------------------------------------------------------------------
## - ?foo
## - Code Completion
## - RStudio help window
## - Stack Overflow
## - Google, etc.



## USEFUL FUNCTIONS ------------------------------------------------------------
##
## MATHEMATICAL
## - mean(): Average
## - sd(): Standard Deviation
## - var(): Variance
## - min(): Smallest
## - max(): Biggest
##
## USEFUL
## - length(): # of items
## - table(): # distinct values
## - summary(): You tell me



## YOUR TURN! ------------------------------------------------------------------

## Take a few minutes and spend some
## time using a few of these functions.



## INDEX[1] --------------------------------------------------------------------
## - AKA Subsetting / Filtering
## - Welcome to the world of square brackets
## - This part is tricky. Run this as I talk
 
## There are 10 entries in age and gender

## But maybe we only want one of them.
gender[10]

## Or maybe we only want some of them.
age[3:5]


## INDEX[2] --------------------------------------------------------------------

## There are 10 entries in age and gender

## But maybe we only want to see the males.
gender[gender == "male"]

## And you can do this across vectors.
age[gender == "male"]



## VISUALIZE A VECTOR ----------------------------------------------------------
## In this case, these vectors are in the same order . . .

##          age   gender  
##          22    male    
##          38    female  
##          26    female  
##          35    female  
##          35    male    
##                male     
##          54    male   
##           2    male    
##          27    female  
##          14    female



##INDEX[3]----------------------------------------------------------------------

## Make a new variable
age_of_men <- age[gender == "male"]

## Or use it in a function
mean( age[gender=="female"] )



## YOUR TURN! ------------------------------------------------------------------

## Using the following Boolean Object
survived <- c(FALSE,TRUE,TRUE,TRUE,FALSE,
              FALSE,FALSE,FALSE,TRUE,TRUE)

## How many men survived the sinking of the Titanic?
## How many women?


## OH YEAH, THOSE WERE REAL PASSENGERS !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


##STATISTICAL TESTING ----------------------------------------------------------

t.test(age[gender=="male"], age[gender=="female"])



## 5 MINUTE BREAK!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
