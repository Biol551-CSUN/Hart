################################################################
### Today we are going to practice date and time -- with the group
### Created by: Joynaline Hart
### Created on: 2022-02-24
###############################################################


#### Load Libraries ######
library(tidyverse)
library(here)
library(lubridate)


### Load data ######
CondData <- read_csv (here("Week_5", "Data", "CondData.csv")) #read the conductivity data
DepthData <- read_csv (here("Week_5", "Data", "DepthData.csv")) #read the depth data

View(CondData) #viewing the conductivity data
View(DepthData) #viewing the depth data

## CODING AREA #####
  ##NOTE: do entire thing using pipes; comment; save output, data and scripts appropriately
  ##Step1: convert date columns appropriately
CondData <- read_csv (here("Week_5", "Data", "CondData.csv")) %>% #read the conductivity data
  mutate (datetime = mdy_hms(depth)) %>% #changing a column -- mutate; within the function is how you're mutating it
  drop_na() %>% #removes the NA
  select(!depth) %>%  #removing the depth column
  ##Step2: round conductivity data to the nearest 10 seconds so it matches with the depth data
  ##notes -- round_date(column, "10 seconds")?
  mutate(datetime = round_date(datetime, "10 seconds"))

view(CondData) #read the top 6 of the data

DepthData <- read_csv (here("Week_5", "Data", "DepthData.csv")) %>% #read the depth data
  mutate (datetime = ymd_hms(date)) %>% #changing a column -- mutate; within the function is how you're mutating it
  select(!date) %>%  #removing the date column
  ##Step2: round conductivity data to the nearest 10 seconds so it matches with the depth data
  ##notes -- round_date(column, "10 seconds")?
  mutate(datetime = round_date(datetime, "10 seconds"))

view(DepthData) #read the top 6 of the data

##Step3: join the two dataframes together; no NAs; ONLY exact matches between the two dataframes are kept
##notes -- semi_join(x,y)?
CombData <- inner_join (CondData, DepthData) %>% #inner_join keeps every data and does not retain NAs
  ##Step4: take average of date, depth, temperature, and salinity by minute 
    ##Hint: make a new column where the hours and minutes are extracted
    ##notes -- extracted meaning select()?; average by minute meaning group_by(minute)?
    ##notes -- average meaning summarise(object=avg(date, na.rm=FALSE)...)
  select (datetime, Depth, Temp = TempInSitu, Salin = SalinityInSitu_1pCal) %>% #selecting specific table and changing some names
  group_by(Hours = hour(datetime), Minutes = minute(datetime)) %>% #grouping by Hours and Minutes by using the function hour() and minute() without s
  summarise (Dateavg = mean(datetime, na.rm=TRUE), #taking the date average
             Depthavg = mean(Depth, na.rm=TRUE), #taking the depth average
             Tempavg = mean(Temp, na.rm=TRUE), #taking the temperature average
             Salavg = mean(Salin, na.rm=TRUE)) %>% #taking the salinity average
  write_csv (here("Week_5", "Output", "Week5b_Lab_Summary.csv")) #saving the result in a csv file

view (CombData) #viewing how the data looks like 


  ##Step5: make plot using the averaged data
    ##notes -- ggplot?; save?
CombData %>% #calling out the CombData dataframe
  ggplot (aes(x=Depthavg, #setting the x axis to be depth average
              y=Salavg)) + #setting the y axis to be saline average
  geom_violin(alpha = 0.2, #setting the transparency
              fill = "brown",) + #filling the violin plot with color brown
  geom_boxplot(alpha = 0.3, #setting the transparency
               fill = "yellow") + #filling the boxplot with color yellow
  geom_point(color = "darkred", #outlining the points with color dark red
             shape = 22) + #setting the points in a shape of a square
  coord_flip() + #flipping the coordinates
  theme_bw() + #setting the theme to be black and white
  facet_grid (~Hours, scale = "free") + #wrapping 
  labs(title="Plot of saline average by depth average", #giving a title to the plot
       subtitle="Highlighting each hour from 9AM-13PM",
       x="Depth Average", #giving a definition for the x-axis
       y = "Saline Average (salinity in situ)") + #giving a definition for the y-axis
  theme(strip.text = element_text(color = "brown", #manipulating how the strip text's color 
                                  hjust = 0.5, #adjusting the strip text's distance -- setting it to center
                                  size = 15),  #setting the size 
        text = element_text (family = "serif", #changing the font to serif
                             size = 14), #setting the size to be 14
        plot.subtitle = element_text(color="black", #plot subtitle's color is changed
                                     size = 12)) #size is change to 11 which is lower than the plot title 

ggsave(here("Week_5", "Output", "Week5b_DepthavgvsSalineAvg.png"), #saving the plot
       width=20, height=7) #setting the size of my plot
