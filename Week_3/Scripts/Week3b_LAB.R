################################################################
### Today we are experimenting the graph for penguins
### Created by: Joynaline Hart
### Created on: 2022-02-10
############################################################### 

### Load libraries #####
# Always done first, and always be in the line to run the function
library (palmerpenguins)
library(tidyverse) 
library(here) 

### Load data #####
glimpse (penguins)

### GGPLOT LINE #####
plot <- ggplot(data = penguins,
        mapping =   aes(x = as_factor(year),
                        y=body_mass_g,
                        fill = species)) +
  geom_boxplot() +
      labs(title = "Species' Year vs Body mass",
           x = "Year (YYYY)",
           y = "Body Mass (g)",
           color = "Species") 

plot + theme(axis.title=element_text((size=50),
                                color = "purple"),
        panel.background=element_rect(fill="linen"))

ggsave(here("Week_3","Output","Week3b_LAB_YearvsMass.png"),
       width=7, height=5) #default is in inches
