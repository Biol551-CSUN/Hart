########################################
##This is a header; sandwiching comments with hashtags create a section area
##Section area is indicated by a little carrot or an arrow head pointing downwards
##Arrowheads can be minimize or maximize for that specific section ONLY
########################################

### Load Libraries #####
library (tidyverse) #libraries are installed R packages that has subdirectory; tidyverse is a package for data modeling, wrangling, and visualization
library (here)      #setting top level of project folder as 'here'; ang root kay set sa imuhang folder which is HART; timan-i

### Read in DATA #####
weightdata <-  read_csv (here("Practice","Week2P1","Data","weightdata.csv")) #this makes sense now; tungod sa here imo gi-specify ang folder kung asa jud ang data

### Data Analysis #####
head(weightdata) #make sure ang pangalan within the parenthesis is the same sa taas -- kanang pirmiro; this just PRINTS THE TOP 6 DATA
tail (weightdata) #PRINTS THE BOTTOM 6 DATA
view(weightdata) #imo ra gi-open ang FULL DATA