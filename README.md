# Hart
**BIOL551:** Computer Modeling - _Spring 2022 CSUN_  
**Created by:** Joynaline Hart - _student_  
**Class's repository:** [Spring-2022](https://github.com/Biol551-CSUN/Spring-2022)  
**Description:** In here, weekly projects will be committed with the **three subfolders (Data, Output, Scripts)**. For the **Practice folder**, this is my own area to repeat the stuffs I learned in class. It may contain my dialect. :thinking:  

**Professor:** [Dr. Nyssa Silbiger](https://github.com/njsilbiger)  
**Teaching Assistant:** [Danielle Barnas](https://github.com/dbarnas)  

# TABLE OF CONTENTS
1. [2022-01-27(th) - what is data](#week1a)
2. [2022-02-01(t) - test respository](#week2a)  
   [2022-02-03(th) - first script](#week2b) :hibiscus:
3. [2022-02-09(t) - first ggplot2](#week3a)  
   [2022-02-11(th) - ggplot2 with the group)](#week3b)
4. [2022-02-15(t) - thepipe, dplyr](#week4a)


# FOLDERS
**1. NA** <a name = "week1a"></a>
| Data | Output  | Scripts |
| ---- |---------| ------- |
| NA   | NA      | NA      |

|Installed  | Functions | Git Commands |
|:---------:|:---------:|:------------:|
|NA         |NA         |NA        | 

**Summary:** T = Introduction to R and Rstudio. TH = Introduction to reproducible and transparent data science


**2. Week_2** <a name = "week2a"></a> <a name = "week2b"></a>
| Data | Output  | Scripts |
| ---- |---------| ------- |
| NA   | NA      | NA      |
|[weightdata.csv](https://github.com/Biol551-CSUN/Hart/blob/main/Week_2/Data/weightdata.csv)| NA |[Week2b.R](https://github.com/Biol551-CSUN/Hart/blob/main/Week_2/Scripts/Week2b.R)|

|Installed  | Functions |  Git Commands |
|:---------|:---------|------------|
|NA         |NA         |`git pull` `git add -a -m ""` `git commit` `git push`|
|`git` `install.packaghes("PackageName")` `install.packages("here")` `install.packaghes("tidyverse")`| `here::here()` `library()` `head(WeightData)` `tail(WeightData` `View(WeightData)`|NA|

**Summary:** T = Introduction to making a repository was initialized (set to public and checked the 'Add READMNE file'). The code was copied to RStudio (New Project/Version Control/Git). TH = The **_Output folder_** was created but was not seen when pushed. In short, **no data means no folder**. The .csv file contain a **wide data** and not the long data. 
> **Class's activity/tasks**  
>> 1. Push the Week_2 folder with your first script and associated data onto your personal GitHub repository
>> 2. Complete the [Online Markdown Tutorial](https://www.markdowntutorial.com/)
>> 3. Edit your readme file to say something useful about your repository

**3. Week_3** <a name = "week3a"></a> <a name = "week3b"></a>
| Data | Output  | Scripts |
| :----: |:---------:| :-------: |
| `install.packages("palmerpenguins")`| NA | [Week3a.R](https://github.com/Biol551-CSUN/Hart/blob/main/Week_3/Scripts/Week_3a.R)|
| NA |   [YearvsMass](https://github.com/Biol551-CSUN/Hart/blob/main/Week_3/Output/Week3b_LAB_YearvsMass.png)   | [Week3b_LAB.R](https://github.com/Biol551-CSUN/Hart/blob/main/Week_3/Scripts/Week3b_LAB.R)     |

|Installed  | Functions | 
|:---------|:---------|
|NA|`ggplot()` `geom_point()` `aes()` `glimpse(penguins)` `geom_jitter()` `labs()` `facet_grid(~)` `facet_wrap(~)` `guides(color=FALSE)` | 
|`install.packages("praise")` `install.packages('devtools')` `coord_xxx()` `devtools::install_github("dill/beyonce")` `install.packages("ggthemes")`|`geom_smooth()` `library(praise)` `praise()` `scale_xx_xxx()` `library(beyonce)` `library(ggthemes)`|

**Summary:**
> **Class's activity/tasks** 
>> * **Tuesday:** I did my first ggplot2 ([Weel3a.R](https://github.com/Biol551-CSUN/Hart/blob/main/Week_3/Scripts/Week_3a.R)). This was not graded, but it was a good way to practice the PACP.  
>> _(Note to self: pull ka always sa folder kung asa nimo ganahan i-add. Sunod, adto kas Week3 folder nimo para ma push ang tanan. Question = will that also push this script? No kay lahi ang name)_
>> * **Thursday:** ggplot2 with the group (graded)

**4. Week_4** <a name = "week4a"></a>
| Data | Output  | Scripts |
| ---- |---------| ------- |
|      | [Week4a_LAB_Output](https://github.com/Biol551-CSUN/Hart/blob/main/Week_4/Output/Week4_Penguiun_Bodymass_vs_Island.png)| [Week4a_LAB.R](https://github.com/Biol551-CSUN/Hart/blob/main/Week_4/Scripts/Week4a_LAB.R)|
| | | |
| |[Week4_TidyTuesday](https://github.com/Biol551-CSUN/Hart/blob/main/tidytuesday/Week4_Tidy/Output/Week4_tidytuesday_Bee_colony.png)|[Week4_tidytuesday.R](https://github.com/Biol551-CSUN/Hart/blob/main/tidytuesday/Week4_Tidy/Scripts/Week4_tidytuesday.R) |

|Installed | Functions | 
|:---------|:---------|
| |`filter()` `mutate()` `ifelse()` `%>%` `select()` `summarise()` `group_by()` `drop_na()`|

**Summary:** 
> **Class's activity/tasks**
>> * **Tuesday:** As a group, we used "the pipe" to mutate and filter the data.

**5. Week_5**
| Data | Output  | Scripts |Installed  | Functions | 
| ---- |---------| ------- |:---------:|:---------:|
|      |      | ||| 

**Summary:**
