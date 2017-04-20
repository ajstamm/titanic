## #############################################################################
## logistic.R
##
## Introduces logistic regression and odds-ratios in R.
##
## #############################################################################



## PASSENGERS ------------------------------------------------------------------
## This is not a slide. This is something for you to think about.
## If you are missing the passengers data frame, run the following command:
## Use this function carefully. Make sure you trust the person who wrote the
## code you are running.
source("http://choens.github.io/titanic/workshops/regression/import-passengers.R")



## LEARNING OBJECTIVES ---------------------------------------------------------
## - Define Logistic Regression
## - Survived becomes died!
##   We will create a new column (died)
## - Logistic Regression
## - Visualizing Logistic Regression
## - Calculating Odds Ratio



## LOGISTIC REGRESSION ---------------------------------------------------------
## https://en.wikipedia.org/wiki/Logistic_regression



## SURVIVED --------------------------------------------------------------------
tbl_surv <- table(passengers$survived)
tbl_surv

100*prop.table(tbl_surv)

## The sample low-balls the death-rate.



## DIED! -----------------------------------------------------------------------
## - Need a new column; Epis are always so positive.
## - Usually discuss risk factors.
## - Easier to type died than survived.

## These two lines create a new column called "died" in the passengers data frame.
passengers$died <- 1
passengers$died[passengers$survived == 1] <- 0

## These two cols should be opposites.
## Or, you did something silly.
passengers[,c("survived", "died")]  ## Warning: The output here is . . . lengthy.

## Another approach . . . 
!passengers$survived == passengers$died



## LOGISTIC REGRESSION: CATEGORICAL ---------------------------------------------
## - Independent variable: sex
## - Dependent variable: died

## Cannot have NAs in our data.
## The logistic regression function fails on nulls.
sum(is.na(passengers$sex))
sum(is.na(passengers$died))

## I want to graph this, and I can't do what I want with a categorical.
## A numeric variable means we can plot the model.
## This will make sense in a slide or two.
passengers$is_male <- 0
passengers$is_male[passengers$sex == "male"] <- 1

## Build a logistic model. This is almost identical a linear model.
## To what extent does is_male explain our outcome, died?
logit_sex <- glm(formula=died~is_male, family=binomial, data=passengers)



## DIED~SEX --------------------------------------------------------------------
## Formula: died as a function of sex
## Sex is a statistically significant predictor of died.
## Reduces residual deviance and AIC.
summary(logit_sex)



## VISUALIZING: DIED~SEX -------------------------------------------------------
## Two steps:
## 1: Plot our dependent and independent variables
##    Jitter makes it possible to see where we have more cases, otherwise, all
##    the circles would be on top of one another and you wouldn't see anything.
plot(jitter(passengers$died, .4),
     jitter(passengers$is_male, .4))
curve(predict(logit_sex, data.frame(is_male=x), type="response"), add=TRUE) 



## LOGISTIC REGRESSION: CONTINUOUS ---------------------------------------------
## - Independent variable: age (a continuous variable)
## - Dependent variable: died

## Cannot have NAs in our data.
sum(is.na(passengers$age))
sum(is.na(passengers$died))

## To what extent does the variable age explain our outcome, died?
logit_age <- glm(formula=died~age, family=binomial, data=passengers)



## DIED ~ AGE ------------------------------------------------------------------
## - Formula: died as a function of age
## - Age is not statistically significant.
## - Almost No difference to the residual deviance & high AIC.
## - Why is this a bad model? The conventional story IS true.
summary(logit_age)



## VISUALIZING: DIED~AGE -------------------------------------------------------
## Very similar to the last plot like this we saw.
## But, this one is flat.
plot(passengers$age, passengers$died)
curve(predict(logit_age, data.frame(age=x), type="response"), add=TRUE)



## LET'S CHEAT FOR A MOMENT ----------------------------------------------------
## - GAM: Generalized Additive Model
## - Not doing these today, but you need to understand.
## - Several confounders here. What can we do?
## Shows us that the relationship between Age and Sex is complicated.
## Can we make it less complex?



## SUGGESTIONS? ----------------------------------------------------------------
## How can we use age to predict died?



## NEW FACTORS ------------------------------------------------------------------
## - First we explore. And we need new tricks.

## You've seen this:
prop.table(table(passengers$died))

## Indexing / Filtering: What percent of passengers
## five years or age or younger died?
prop.table(table(passengers$died[passengers$age <= 5]))

## Note: I'm TIRED of typing passengers.



## NEW TRICKS -----------------------------------------------------------------
## - with
## - &, |
## - round

## - Only write passengers once
## - Percentage of passengers died who are older than 5 and but younger than 11.
with(passengers,
     prop.table(table(died[age > 5 & age <= 10]))
    )

## Make the percentage easier to grok:
with(passengers,
     round(prop.table(table(died[age > 5 & age <= 10]))*100)
    )



## AGE GROUPS, NOT AGE ---------------------------------------------------------
## Let's create a new factor:
## The assignment operators are aligned, because it makes the code easier
## to read. It is NOT required. It is a style thing. And, I'm stylish.
passengers$age_group                                             <- NA
passengers$age_group[passengers$age <= 10]                       <- "00-10"
passengers$age_group[passengers$age > 10 & passengers$age <= 20] <- "11-20"
passengers$age_group[passengers$age > 20 & passengers$age <= 30] <- "21-30"
passengers$age_group[passengers$age > 30 & passengers$age <= 40] <- "31-40"
passengers$age_group[passengers$age > 40 & passengers$age <= 50] <- "41-50"
passengers$age_group[passengers$age > 50 & passengers$age <= 60] <- "51-60"
passengers$age_group[passengers$age > 60]                        <- "61+"
passengers$age_group <- as.factor(passengers$age_group)


## COMPLEX TABLES --------------------------------------------------------------
## This should be familiar by now:
with(passengers,
     round(prop.table(table(age_group, died),1)*100,1))

## But this is nice!
multi_tbl <- with(passengers,
                  round(prop.table(table(age_group, sex, died),1)*100,1))
ftable(multi_tbl)



## YOUR TURN! ----------------------------------------------------------------
## Is age_group a statistically significant predictor of died?
## No peeking!







































## DIED~AGE_GROUP IS BETTER ----------------------------------------------------
logit_age <- glm(formula=died~age_group, family=binomial, data=passengers)
summary(logit_age)

## Tweak these groups to reduce the residuals further.##But don't overfit.</span></p>



## YOUR TURN! -------------------------------------------------------------------
## - There are two logistic regression models below.
## - One model is definitely better than the other. Why?
logit_complex <- glm(formula = died ~ age_group+is_male, family = binomial, data = passengers)
summary(logit_complex)

logit_complex <- glm(formula = died ~ age_group*is_male, family = binomial, data = passengers)
summary(logit_complex)



## ODDS RATIO ------------------------------------------------------------------
## - This is for the epidemiologists.
## - No Base R function to calculate odds ratio.
## - But, it isn't hard to calculate it.



## ODDS RATIO (OR) -------------------------------------------------------------
## - Quantifies how strongly the presence or absence of property A is associated
##   with the presence or absence of property B in a given population.
## - Today, we want to know how being male is associated with dying.
## - I am focusing on the Odds Ratio and not Risk Ratio because of the
##   relationship between OR and logistic regression.



## OR: FIRST STEPS -------------------------------------------------------------
## - Need the odds of dying for two different groups.
## - We need a 2x2 table: died x is_male
## - This table is backwards from how this is usually shown in text books.
## - Could invert the table, or just do the math right.

## Remember: Rows (died), Columns (is_male)
t_male <- with(passengers,
               table(died, is_male, dnn=c("died","is_male"))
              )
t_male



## The ODDS OF DYING: ----------------------------------------------------------
## MAN:  110/33
## WOMAN: 30/77
## The ratio of these two odds:
## - (110/33) / (30/77) or . . .
## - (110*77) / (33*30)
## - The Odds Ratio in our sample is 8.5555555555...6
## That is quite a risk factor.



## YOUR TURN! ------------------------------------------------------------------
## Can you figure out how to do that with R?
## It is just some fancy indexing trickery.
## No peeking!







































    


## OR: ALBEGRAIC METHOD --------------------------------------------------------
## Remember:
t_male

   is_male
died   0   1
   0  77  33
   1  30 110

## Thus, our solution . . . 
## Remember, you can use R like a giant calculator:
(t_male[2,2] * t_male[1,1]) / (t_male[2,1]*t_male[1,2])
[1] 8.555556

## This does not come with confidence intervals.



## POP QUIZ! -------------------------------------------------------------------
## What is the relationship between the OR and logistic regression?
## - log(Odds Ratio) == coefficient from the logit model.
##   Which means . . .
## - The exp(coeffient) == the OR.
## - If you can build the logit model, the OR is one step away.



## DERIVING FROM LOGIT MODEL----------------------------------------------------
## How does this help us?
names(summary(logit_sex))



## DERIVING OR FROM LOGIT MODEL ------------------------------------------------
## This is one way o do it.
## ## Step 1: Access the model coefficients:
summary(logit_sex)$coefficients

## Step 2: Calculate the exponent of the coefficients:
exp( summary(logit_sex)$coefficients )




## DERIVING FROM LOGIT MODEL ---------------------------------------------------
## This is another way to do it.
##
## Step 1: Access the model coefficients:
logit_sex_coef <- summary(logit_sex)$coefficients

## Step 2: Calculate the exponent of the coefficients:
exp( logit_sex_coef )

             Estimate Std. Error      z value Pr(>|z|)
(Intercept) 0.3896104   1.240137 1.252897e-02 1.000012
is_male     8.5555556   1.340134 1.528397e+03 1.000000



## NEXT WEEK's R WORKSHOP ------------------------------------------------------
## - What holds you back from using R?
## - Next week, complete a project!
## - This includes:
##   + Download data from OpenData NY
##   + Explore the data
##   + Build a reproducible report (HTML/Word)
##   + Discuss advanced topics like reproducible research, automation, etc.



## YOUR TURN! ------------------------------------------------------------------
## What else can you add to the regression models we have disussed?
