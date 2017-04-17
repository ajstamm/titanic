## Died ~ Sex ------------------------------------------------------------------
## Creates a new variable. We don't HAVE to do this, but it is clearer, and it
## helps us plot things.
passengers$is_male <- 0
passengers$is_male[passengers$sex == "male"] <- 1

logit_sex <- glm(formula=died~is_male, family=binomial, data=passengers)
summary(logit_sex)

## Visualizing Died ~ Sex ------------------------------------------------------
par(mar=c(5.3, 5.5, 4.1, 2.1))
plot(jitter(passengers$died, .4),
     jitter(passengers$is_male, .4),
     main="Died ~ Is Male",
     xlab="Died",
     ylab="Is Male", 
     cex.lab=1.5,
     cex.axis=1.5,
     cex.main=1.5,
     cex.sub=1.5,
     cex=1.5)
curve(predict(logit_sex, data.frame(is_male=x), type="response"), add=TRUE) 
dev.copy(png, 'logistic-curve-sex.png')
dev.off()

## Died ~ Age ------------------------------------------------------------------
logit_age <- glm(formula = died ~ age, family = binomial, data = passengers)
summary(logit_age)

## Visualizing Died~Age --------------------------------------------------------
par(mar=c(5.3, 5.5, 4.1, 2.1))
plot(passengers$age,
     passengers$died,
     main="Died ~ Age",
     xlab="Age",
     ylab="Died", 
     cex.lab=1.5,
     cex.axis=1.5,
     cex.main=1.5,
     cex.sub=1.5,
     cex=1.5)
curve(predict(logit_age, data.frame(age=x), type="response"), add=TRUE) 
dev.copy(png, 'logistic-curve-age.png')
dev.off()

## GAM Model -------------------------------------------------------------------
library(gam)
par(mar=c(5.3, 5.5, 4.1, 2.1))
gam_age <- gam(died~s(age), data=passengers)
plot.gam(gam_age,
         main="Died ~ Age",
         xlab="Age",
         ylab="Died", 
         cex.lab=1.5,
         cex.axis=1.5,
         cex.main=1.5,
         cex.sub=1.5,
         cex=1.5)
dev.copy(png, 'gam-curve-age.png')
dev.off()



prop.table(table(passengers$died))
prop.table(table(passengers$died[passengers$age <= 5]))
prop.table(table(passengers$died[passengers$age > 5 & passengers$age <= 10]))
prop.table(table(passengers$died[passengers$age > 10 & passengers$age <= 15]))
prop.table(table(passengers$died[passengers$age > 15 & passengers$age <= 20]))
prop.table(table(passengers$died[passengers$age > 20 & passengers$age <= 25]))
prop.table(table(passengers$died[passengers$age > 25 & passengers$age <= 30]))
prop.table(table(passengers$died[passengers$age > 30 & passengers$age <= 35]))
prop.table(table(passengers$died[passengers$age > 35 & passengers$age <= 40]))
prop.table(table(passengers$died[passengers$age > 40 & passengers$age <= 45]))
prop.table(table(passengers$died[passengers$age > 45 & passengers$age <= 50]))
prop.table(table(passengers$died[passengers$age > 50 & passengers$age <= 55]))
prop.table(table(passengers$died[passengers$age > 55 & passengers$age <= 60]))
prop.table(table(passengers$died[passengers$age > 60 & passengers$age <= 65]))
prop.table(table(passengers$died[passengers$age > 65]))

passengers$age_group                                             <- NA
passengers$age_group[passengers$age <= 10]                       <- "00-10"
passengers$age_group[passengers$age > 10 & passengers$age <= 20] <- "11-20"
passengers$age_group[passengers$age > 20 & passengers$age <= 30] <- "21-30"
passengers$age_group[passengers$age > 30 & passengers$age <= 40] <- "31-40"
passengers$age_group[passengers$age > 40 & passengers$age <= 50] <- "41-50"
passengers$age_group[passengers$age > 50 & passengers$age <= 60] <- "51-60"
passengers$age_group[passengers$age > 60]                        <- "61+"

with(passengers,
     round(prop.table(table(age_group, died),1)*100
           ,1))

multi_tbl <- with(passengers,
                  round(prop.table(table(age_group, sex, died),1)*100,1))
## If you print multi_tbl directly, it is harder to read.
ftable(multi_tbl)


