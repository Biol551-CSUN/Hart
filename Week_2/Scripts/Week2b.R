################################################################
### This is my first script. I am learning how to import data
### Created by: Joynaline Hart
### Created on: 2022-02-03
###############################################################

### Load libraries #####
library(tidyverse) #Do this every time, be sure you are in the line and hit run
library(here)      #Do this every time, be sure you are in the line and hit run

### Read in data #####
WeightData <- read_csv (here("Week_2","Data","weightdata.csv"))  #Reading the weightdata while specifying its location from HART FOLDER

## Data Analysis #####
head(WeightData) #Looks at the top 6 lines of the dataframe
tail(WeightData) #Looks at the bottom 6 lines of the dataframe
View(WeightData) #Shows the whole dataset, this opens a new window
