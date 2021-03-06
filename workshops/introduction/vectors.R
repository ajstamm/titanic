## #############################################################################
## vectors.R
## #############################################################################

## VECTORS ---------------------------------------------------------------------
## - Code: vectors.R
## - Run code, learn more
## - Duration: ~45 Minutes
## - Followed by: A 5 Minute Break


## LEARNING OBJECTIVES ---------------------------------------------------------
## - What is a vector?
## - How To Make One
## - How To Delete One
## - Vector Indexing (How To Subset)
## - Work With Two Vectors



## WHAT IS A VECTOR? -----------------------------------------------------------
## - Congrats, you have already worked with Vectors
## - Understanding this is CRITICAL to becoming a useR (sic)

## This is a vector, length == 1.
captain <- "John Smith"

 ## This is a vector too, length == 5.
 age <- c(22, 38, 26, 35, 35)



## COMBINE ---------------------------------------------------------------------
## -Use the function c() to combine things
## -Works for numerics, characters, booleans, dates, etc.
## -If they aren't the same type of data, R will reduce to the lowest common denominator.
## -In practice, this is usually a character vector
## -All vectors are objects (like everything else in R)


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
## - Google: Pre-pend search query with "R"
## - Stack Overflow



## SOME FUNCTIONS --------------------------------------------------------------
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
## - plot(): You tell me
## - hist(): You tell me
## - barplot(): You tell me



## YOUR TURN! ------------------------------------------------------------------

## Take a few minutes and spend some
## time using a few of these functions.
## Remember ? to get help with how to use the function.



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



## VISUALIZE 2 VECTORS ---------------------------------------------------------
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


## ACTUAL PASSENGERS -----------------------------------------------------------
## Name	                           Age	Gender
## Mr. Owen Braund	                22	male
## Mrs. Florence Briggs Thayer	    38	female
## Miss. Laina Heikkinen	        26	female
## Mrs. Lily May Peel	            35	female
## Mr. William Allen	            35	male
## Mr. James Moran	                NA	male
## Mr. Timothy McCarthy	            54	male
## Master. Gosta Palsson	         2	male
## Mrs. Elisabeth Vilhelmina Berg	27	female
## Mrs. Adele Achem	                14	female

## STATISTICAL TESTING ----------------------------------------------------------
t.test(age[gender=="male"], age[gender=="female"])

## ONE MORE DATA TYPE ----------------------------------------------------------
## - Factor
## - Superficially, similar to a string character.
## - More efficient with memory usage.
## - More importantly, defines a variable explicitly as a categorical.

## MAKE A FACTOR ---------------------------------------------------------------
gender

as.factor(gender)

## 5 MINUTE BREAK!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
