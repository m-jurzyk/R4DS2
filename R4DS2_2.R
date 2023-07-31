## New R for Data Science (2e) Exercise book 


#1  Introduction ---- 

# R Packages

###1.4.3 The tidyverse ----

library(tidyverse)


###1.4.4 Other packages ----
#install.packages(
  c("arrow", "babynames", "curl", "duckdb", "gapminder", 
    "ggrepel", "ggridges", "ggthemes", "hexbin", "janitor", "Lahman", 
    "leaflet", "maps", "nycflights13", "openxlsx", "palmerpenguins", 
    "repurrrsive", "tidymodels", "writexl")
)

# 2.1 Introduction ---- 

library(palmerpenguins)
library(ggthemes)
library(dplyr)

##2.2 First steps----

palmerpenguins::penguins

glimpse(penguins)

ggplot(data=penguins, mapping=aes(x=flipper_length_mm,y=body_mass_g))+
  geom_point(mapping = aes(color=species, shape= species))+
  geom_smooth(method = "lm")+
  labs(
    title = "Body mass and flipper length",
    subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
    x = "Flipper length (mm)", y = "Body mass (g)",
    color = "Species", shape = "Species"
  ) +
  scale_color_colorblind()

###2.25 Exercises  ---- 

#1 How many rows are in penguins? How many columns?

nrow(penguins) #344
ncol(penguins) #8

#2 What does the bill_depth_mm variable in the penguins data frame describe?
#Read the help for ?penguins to find out.

help("penguins")

#  bill_depth_mm variable a number denoting bill depth (millimeters)

#3 Make a scatterplot of bill_depth_mm vs. bill_length_mm. That is, make a scatterplot with bill_depth_mm on 
#the y-axis and bill_length_mm on the x-axis. 
#Describe the relationship between these two variables.


ggplot(data=penguins, mapping=aes(y=bill_depth_mm,x= bill_length_mm))+
  geom_point(mapping = aes(color=species, shape= species))+
  geom_smooth(method = "lm")


#4 Why does the following give an error and how would you fix it?

ggplot(data = penguins,mapping=aes(y=bill_depth_mm,x= bill_length_mm)) + 
  geom_point(na.rm = TRUE)

# 8

ggplot(data=penguins, mapping=aes(x=flipper_length_mm,y=body_mass_g))+
  geom_point(mapping = aes(color=bill_depth_mm))+
  geom_smooth()

# 9 

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = island)
) +
  geom_point() +
  geom_smooth(se = FALSE)


# 10 The same 


##2.3 ggplot2 calls ----

penguins %>% 
  ggplot(aes(x = flipper_length_mm, y = body_mass_g)) + 
  geom_point()


##2.4 Visualizing distributions ----

ggplot(penguins, aes(x = species)) +
  geom_bar() # Geom BAR

ggplot(penguins, aes(x = fct_infreq(species))) +
  geom_bar()

ggplot(penguins, aes(x = body_mass_g)) +
  geom_histogram(binwidth = 200) # Histogram

ggplot(penguins, aes(x = body_mass_g)) +
  geom_density()


##2.5  Visualizing relationships ----


ggplot(penguins, aes(x = species, y = body_mass_g)) +
  geom_boxplot()

ggplot(penguins, aes(x = body_mass_g, color = species, fill=species)) +
  geom_density(alpha=0.5)


ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar()

ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar(position = "fill")


# Facet wrap function - mapping island on a diffrent graph

ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(aes(color = species, shape = species)) +
  facet_wrap(~island)

###2.55 Exercises ----

#1 The mpg data frame that is bundled with the ggplot2 package
#contains 234 observations collected by the US Environmental
#Protection Agency on 38 car models.
#Which variables in mpg are categorical? 
#Which variables are numerical? (Hint: Type ?mpg to read the documentation for the dataset.)
#How can you see this information when you run mpg?

?mpg


#2Make a scatterplot of hwy vs. displ using the mpg data frame.
#Next, map a third, numerical variable to color, then size, 
#then both color and size, then shape.
#How do these aesthetics behave differently for categorical vs. numerical variables?



mpg %>% ggplot(mapping=aes(x=displ,y=hwy, color=cyl, size= trans))+
  geom_point()


#6
ggplot(data = penguins, mapping = aes(
    x = bill_length_mm, y = bill_depth_mm, 
    color = species, shape = species
  )
) +
  geom_point()

#3  Workflow: basics ----

# Basic math operations 
sin(pi/2)

2*4

x <- 3*4
x

# C vector 

primes <- c(2, 3, 5, 7, 11, 13)

primes*2

# Sequences 

seq(from=1, to=10)

seq(1:10)

seq(1,10)


###3.5 Exercises----

#1

my_variable <- 10
my_varıable

# variable - i - without dot 

my_variable <- 10
my_variable

#2 libary(tidyverse)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x=displ, y = hwy))

