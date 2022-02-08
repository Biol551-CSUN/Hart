################################################################
### This is my first ggplot2 from Week3 -- Tuesday Lab
### Created by: Joynaline Hart
### Created on: 2022-02-08
###############################################################

### Load libraries #####
library(tidyverse) #Do this every time, be sure you are in the line and hit run
library(palmerpenguins) #Calling palmerpenguins from the tidyverse -- install the palmerpenguins first

### Data analysis #####
glimpse(penguins) #visualize the data, tells you the DATA TYPES -- factors, double, integer

### ggplot line  #####
ggplot(data=penguins,                      #I am getting ready to plot the penguin data -- but idk which is which yet -- gray screen (PLOTS) in lower right
  mapping = aes(x = bill_depth_mm,         #x-axis = shows what it is set for with numbers on the x axis -- MAPPING = getting the data we need
                y = bill_length_mm,        #Y-axis = shows what it is set for
                color = species,           #randomly picks a color for the species
                shape = species            #changing the shape
               #size = boddy_mass_g,       #bigger circles relative to smaller and bigger penguins
               #alpha = flipper_length_mm  #lower alpha means lower transparent; higher alpha is higher transparency 
               ))+
  geom_point(size=2, alpha=0.5) +          #ADD + = because we add another layer -- i want it to be POINTS; instead of doing size and alpha from aes, you can set this within the geom       
    labs(title="Bill depth and length",    #ADD + = another layer -- TITLE SHOULD POP AT THE TOP -- LABS = how data looks
        subtitle = "Dimensions for Adelie, Chinstrap, Gentoo",     #Subtitle should show up below the TITLE
        x = "Bill depth (mm)", y = "Bill length (mm)",             #making the labels in x and y PRETTIER -- how we want the label to look
        color = "Species",                                         #changes from lower case 'species' to upper case 'Species'
        shape = "Species",                 #saying that the shape is Species
        caption = "Source: Palmer Station LTER/palmerpenguins package") + #bottom of the figure where the data comes from -- if the data is not yours
    scale_color_viridis_d() +              #ADD + = new layer; change the colors
    facet_grid(species~sex)                #column ~ rows within the parenthesis -- add grids on the side; '~' = species as a function of sex; two arguments AT ALL TIMES
    #facet_wrap (~species)                 #ADD + = wraps your data by species in the column area, 3 columns
    #facet_wrap (~species, ncol=2)         #ADD + = forces it to have two columns; n=1 -- put everything on top of each other
    #guides (color=FALSE)                  #ADD + = removes the legend while you set it to FALSE     
