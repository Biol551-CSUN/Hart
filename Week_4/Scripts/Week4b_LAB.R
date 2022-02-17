################################################################
### Today we are learning tidyr with biogeochemistry data from Hawaii -- with the group
### Created by: Joynaline Hart
### Created on: 2022-02-17
###############################################################

#### Load Libraries ######
library(tidyverse)
library(here)

### Load data ######
ChemData<-read_csv(here("Week_4","Data", "chemicaldata_maunalua.csv"))
View(ChemData) #opens the data to a new window
glimpse(ChemData) #summarizes on the console

### Calculate summary statistics and export csv file #####
ChemData_clean <- ChemData %>% 
  filter (complete.cases(.)) %>% #remove all the NAs
  separate (col = Tide_time,  #choose the tide time column
            into = c ("Tide", "Time"),  #separate into two columns called Tide and Time
            sep = "_") %>% #separate by _
  pivot_longer(cols = Temp_in:percent_sgd, #the columns you want to pivot. This says select the temp to percent SGD cols
               names_to = "Variables", #the names of the new columns with all the column names
               values_to = "Values") %>% #names of the new column with all the values
  group_by (Season, Time) %>%  
  select (Variables, Values, Season, Zone, Time) %>% 
  summarise (Param_means = mean(Values, na.rm = TRUE), #get the mean
             Param_vars = var(Values, na.rm = TRUE), #get the variance
             Param_sd = sd (Values, na.rm = TRUE)) %>% #get the standard deviation
  write_csv (here("Week_4", "Output", "Week4b_Lab_Summary.csv"))

View(ChemData_clean) #View the new ChemData_Clean

## GGPLOT LINE #####
ChemData %>% #load the Dataframe
  filter (complete.cases(.)) %>% #filter the NA's row
  ggplot (aes (x = Temp_in, #setting x to Temp_in
               y = pH, #setting the y to pH
               fill = Season)) +  #filling the data by Season (Fall, Spring)
  geom_point(size = 2, alpha = 0.6, shape = 22) + #plotting it using points while giving it a shape
  labs(title = "Plotting pH by Temperature between Fall and Spring",  #setting what the title is
       x = "Temperature in Celcius degree", #setting what the x-axis is all about
       y = "pH") + #setting what the y-axis is all about
  theme(axis.text = element_text(size = 11),  #apply to every texts seen, changing size
        axis.title=element_text(size=13)) + #changing the axis title's size
  facet_grid (Zone~Site) #facetting it by Zone and Site

ggsave(here("Week_4", "Output", "Week4b_Lab_pHvsTemp.png"),  #saving the plot
       width=7, height=5)   #setting the size of the plot
