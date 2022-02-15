################################################################
### Today we are learning dplyr package -- with the group
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

### Calculate the mean and variance of body mass by species, island, sex without NAs #####
penguins_meanvar <- penguins %>% #calling out penguin dataframe
                      group_by (species, island, sex) %>% #selecting certain columns
                      drop_na(species) %>% #removing NAs from species
                      drop_na(island) %>% #removing NAs from island
                      drop_na(sex) %>% #removing NAs from sex
                      summarise(mean_body_mass = mean(body_mass_g, na.rm=TRUE), #calculating mean from body mass
                      variance_body_mass = var(body_mass_g, na.rm=TRUE)) #calculating variance from body mass
view(penguins_meanvar)

### Filter out male penguins #####
penguins %>% #calling out penguin dataframe
  filter (sex=="female") %>%  #filtering female and leaving male
  mutate (log_mass = log(body_mass_g)) %>% #calculating for logmass
  select (Species = species, Island = island, Sex = sex, log_mass) %>% #selecting only certain columns; changing s to S and so on
  ggplot (aes(x=Island, #setting x equal to Island
              y=log_mass, #setting y equal to log mass
              fill = Species)) + #coloring the Species
  geom_bar(stat="identity") + #making a bar graph
  coord_flip() + #flipping the coordinate
  theme(axis.text = element_text(size = 11,  #apply to every texts seen
                                 color = "black", 
                                 face = "bold"),
        axis.line = element_line(color = "darkblue", #specific for axis line 
                                 size = 1,
                                 linetype = "solid"),
        plot.title = element_text(color = "darkred", #changing the plot title's color and adjusting its placement
                                  hjust = 0.5),
        plot.subtitle = element_text(color="black",  #changing the subtitle's color and adjusting its placement; changed size and bolded it
                                     size = 11, 
                                     face = "bold", 
                                     hjust = 0.5),
        axis.title=element_text(size=15,            #changing the axis title's color and bolding it
                                color = "darkred"),
        panel.background=element_rect(fill="linen")) + #changing the background to linen
  labs(title = "Penguins' Body Mass from different Islands",  #setting what the title is
       subtitle = "Analyzing body mass of each species present", #setting what the subtitle says
       x = "Island", #setting what the x-axis is all about
       y = "Log(10) body mass (g)") #setting what the y-axis is all about

ggsave(here("Week_4", "Output", "Week4_Penguiun_Bodymass_vs_Island.png"),  #saving the plot
       width=7, height=5)   #setting the size of the plot
