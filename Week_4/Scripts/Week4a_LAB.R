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
penguins %>% 
  filter (sex=="female") %>% 
  mutate (log_mass = log(body_mass_g)) %>% 
  select (Species = species, Island = island, Sex = sex, log_mass) %>% 
  ggplot (aes(x=Island, 
              y=log_mass,
              fill = Species)) +
  geom_bar(stat="identity") +
  coord_flip() +
  theme(axis.text = element_text(size = 11, 
                                 color = "black", 
                                 face = "bold"),
        axis.line = element_line(color = "darkblue",
                                 size = 1,
                                 linetype = "solid"),
        plot.title = element_text(color = "darkred", 
                                  hjust = 0.5),
        plot.subtitle = element_text(color="black", 
                                     size = 11, 
                                     face = "bold", 
                                     hjust = 0.5),
        axis.title=element_text(size=15,
                                color = "darkred",
                                face = "bold"),
        panel.background=element_rect(fill="linen")) +
  labs(title = "Penguins' Body Mass from different Islands",
       subtitle = "Analyzing body mass of each species present",
       x = "Island", 
       y = "Log(10) body mass (g)")

ggsave(here("Week_4", "Output", "Week4_Penguiun_Bodymass_vs_Island.png"),
       width=7, height=5)
