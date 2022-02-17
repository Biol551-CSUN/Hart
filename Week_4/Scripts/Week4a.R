################################################################
### Today we are learning dplyr package
### Created by: Joynaline Hart
### Created on: 2022-02-15
###############################################################

#### Load Libraries ######
library(palmerpenguins)
library(tidyverse)
library(here)

### Load data ######
# The data is part of the package and is called penguins
glimpse(penguins)
head(penguins)

### Filter data #####
filter(.data = penguins,
       sex == "female")

#extract penguins measured in year 2008; body mass greater than 5000
filter(.data = penguins,
       sex == "female",
       year == 2008,        #character needs quote; if number, ang quotes mo work or wala
       body_mass_g > 5000)

# comma same ras "and"
filter(.data = penguins,
       sex == "female" &
       year == 2008)

#extract penguins either 2008 or 2009, not island Dream, species Adelie and Gentoo
filter(.data = penguins, 
       year == 2008 | year == 2009)
filter(.data = penguins,
       island != "Dream")
#filter(.data = penguins, species == "Adelie" | species == "Gentoo")
filter(.data = penguins,
       species %in% c("Adelie", "Gentoo")) #species within the vector: Adelie, Gentoo



### Mutate data -- changing the dataframe #####
data2 <- mutate(.data = penguins,
                body_mass_kg = body_mass_g/1000)
view(data2)

#changing multiple columns
data2 <- mutate(.data = penguins, 
                body_mass_kg = body_mass_g/1000,
                bill_length_depth = bill_length_mm/bill_depth_mm)
view(data2)

#mutate with ifelse
data2 <- mutate(.data = penguins,
                after_2008 = ifelse(year>2008, "After 2008", "Before 2008"))
view(data2) #always check data

#mutate to create new column to add flipper length and body mass together
#mutate to create new column where body mass greater 4000 is big and everything else is small
data2 <- mutate (.data = penguins,
                 flipper_length = flipper_length_mm + body_mass_g,
                 big = ifelse(body_mass_g > 4000, "big", "small"))
view(data2)



## The pipe %>% #####
penguins %>% #use penguin dataframe; this will be lost because there was no object it is saved on
  filter (sex == "female") %>% #select females
  mutate (log_mass = log(body_mass_g)) %>% #calculate log biomass 
  select (Species = species, Island = island, Sex = sex, log_mass) #select specific columns; rename columns; rename function to rename and just pipe to



## Summarize different things #####
penguins %>% 
  summarise(mean_flipper = mean(flipper_length_mm, na.rm=TRUE))

#multiple parameters, pile on
penguins %>% 
  summarise(mean_flipper = mean(flipper_length_mm, na.rm=TRUE),
            min_flipper = min(flipper_length_mm, na.rm=TRUE))



##Group_by function -- summarize by certain groups
penguins %>% 
  group_by (island, species) %>% 
  summarise(mean_flipper = mean(flipper_length_mm, na.rm=TRUE),
            min_flipper = max(flipper_length_mm, na.rm=TRUE))


##Remove NAs #####
penguins %>% 
  drop_na(sex) %>% 
  group_by (island, sex) %>% 
  summarise(mean_flipper = mean(flipper_length_mm, na.rm=TRUE),
            min_flipper = max(flipper_length_mm, na.rm=TRUE))


## GGPLOT ######
penguins %>%
  drop_na(sex) %>%
  ggplot(aes(x = sex, y = flipper_length_mm)) +
  geom_boxplot()