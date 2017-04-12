## Passengers.R
##
## Creates the passengers.csv data used in the second TITR workshop
## from the train.csv file. It isn't the nicest script, but it gets
## the job done.

## Init ------------------------------------------------------------------------
library(dplyr)
train <- read.csv("train.csv")
names(train) <- tolower(names(train))
test <- read.csv("test.csv")
names(test) <- tolower(names(test))

## =============================================================================
## AGE IMPUTATION (Long-winded)
## We can impute age using title, often. Let's see how.
## =============================================================================

## Combine both data sets & take the average age of BOTH for each honorific ----
total <- rbind(train[ ,c("age","name")], test[ ,c("age","name")] )

## Honorifics Used Aboard Titanic-----------------------------------------------
## This separates out the known ages for all persons with these honorifics.
ages_capt     <- total$age[grepl("capt",tolower(total$name))]
ages_col      <- total$age[grepl("col",tolower(total$name))]
ages_don      <- total$age[grepl("don",tolower(total$name))]
ages_jonkheer <- total$age[grepl("jonkheer",tolower(total$name))]
ages_lady     <- total$age[grepl("lady",tolower(total$name))]
ages_mr       <- total$age[grepl("mr ",tolower(total$name))]
ages_miss     <- total$age[grepl("miss",tolower(total$name))]
ages_major    <- total$age[grepl("major",tolower(total$name))]
ages_master   <- total$age[grepl("master",tolower(total$name))]
ages_mlle     <- total$age[grepl("mlle",tolower(total$name))]
ages_mme      <- total$age[grepl("mme",tolower(total$name))]
ages_ms       <- total$age[grepl("ms",tolower(total$name))]
ages_mrs      <- total$age[grepl("mrs",tolower(total$name))]
ages_rev      <- total$age[grepl("rev",tolower(total$name))]
ages_sir      <- total$age[grepl("sir",tolower(total$name))]
ages_countess <- total$age[grepl("countess",tolower(total$name))]

## What will these save us -----------------------------------------------------
sum(is.na(ages_capt))     #  0 
sum(is.na(ages_col))      #  2
sum(is.na(ages_don))      #  2
sum(is.na(ages_jonkheer)) #  0
sum(is.na(ages_lady))     #  1
sum(is.na(ages_mr))       #  0
sum(is.na(ages_miss))     # 50
sum(is.na(ages_major))    #  0
sum(is.na(ages_master))   #  8
sum(is.na(ages_mlle))     #  0
sum(is.na(ages_mme))      #  2
sum(is.na(ages_ms))       #  6
sum(is.na(ages_mrs))      # 27
sum(is.na(ages_rev))      #  0
sum(is.na(ages_sir))      #  1
sum(is.na(ages_countess)) #  0

## Calculate the average age for each useful honorific -------------------------
mean_col    <- mean( ages_col, na.rm=TRUE)    #  2  
mean_don    <- mean( ages_don, na.rm=TRUE)    #  2  
mean_lady   <- mean( ages_lady, na.rm=TRUE)   #  1  
mean_miss   <- mean( ages_miss, na.rm=TRUE)   # 50  
mean_master <- mean( ages_master, na.rm=TRUE) #  8  
mean_mme    <- mean( ages_mme, na.rm=TRUE)    #  2  
mean_ms     <- mean( ages_ms, na.rm=TRUE)     #  6  
mean_mrs    <- mean( ages_mrs, na.rm=TRUE)    # 27  
mean_sir    <- mean( ages_sir, na.rm=TRUE)    #  1  

## Assign values back to data.frames -------------------------------------------
train$age[grepl("col",tolower(train$name)) & is.na(train$age)] <- mean_col
train$age[grepl("don",tolower(train$name)) & is.na(train$age)] <- mean_don
train$age[grepl("lady",tolower(train$name)) & is.na(train$age)] <- mean_lady
train$age[grepl("miss",tolower(train$name)) & is.na(train$age)] <- mean_miss
train$age[grepl("master",tolower(train$name)) & is.na(train$age)] <- mean_master
train$age[grepl("mme",tolower(train$name)) & is.na(train$age)] <- mean_mme
train$age[grepl("ms",tolower(train$name)) & is.na(train$age)] <- mean_ms
train$age[grepl("mrs",tolower(train$name)) & is.na(train$age)] <- mean_mrs
train$age[grepl("sir",tolower(train$name)) & is.na(train$age)] <- mean_sir


## =============================================================================
## HOW MANY NAs IN AGE?
## =============================================================================

#sum(is.na(train$age))

## We fixed a few ages.
## Let's just average it and be done.

#train$age[is.na(train$age)] <- mean(total$age, na.rm=TRUE)
#test$age[is.na(test$age)] <- mean(total$age, na.rm=TRUE)



## =============================================================================
## ID Children
## =============================================================================

train$child <- 0
train$child[train$age<18] <- 1



## =============================================================================
## Make port easier to use.
## =============================================================================

train$port <- NA
train$port[train$embarked == "C"] <- "Cherbourg, France"
train$port[train$embarked == "Q"] <- "Queenstown, England"
train$port[train$embarked == "S"] <- "Southampton, England"



## =============================================================================
## This is what we are keeping.
## =============================================================================
set.seed(1234)
passengers <-
    train %>%
    filter(!is.na(age)) %>%
    select(passenger_id = passengerid,
           survived = survived,
           passenger_class = pclass,
           passenger_name = name,
           sex = sex,
           age = age,
           child,
           n_siblings = sibsp,
           n_parents_children = parch,
           ticket = ticket,
           cost = fare,
           cabin = cabin,
           embarked_from = port
           ) %>%
    sample_n(tbl = ., size = 250, replace = FALSE)

write.csv(passengers, "passengers.csv", row.names = FALSE)

