library(tidyverse)

d <- read_csv("public/data/child-pet-data.csv")

s <- d %>% spread(key = pet_species, value = pet_name)

g <- s %>% gather(key = pet_species, value = pet_name, 
                  bird:dog)

g <- g %>% filter(!is.na(pet_name))

s2 <- d %>% mutate(value = 1) %>%
  spread(key = child_sex, value = value)
