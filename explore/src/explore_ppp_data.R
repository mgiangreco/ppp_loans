# explore_ppp_data

#Load Packages ------------------------------------------------------------------------
#Add all required lists to the list.of.packages object
#missing packages will be automatically installed
list.of.packages <- c("tidyverse",
                      "tidycensus",
                      "sf",
                      "here",
                      "feather")

new.packages <-
  list.of.packages[!(list.of.packages %in% installed.packages()[, "Package"])]

if (length(new.packages))
  install.packages(new.packages)

#load all required packages
lapply(list.of.packages, require, character.only = TRUE)

options(scipen = 999)

#print working directory
here("test")


####import IL ppp data-------------------------
IL_150k_plus <- read_csv(here("import", "output", "IL_150k_plus.csv"))

IL_up_to_150k<- read_csv(here("import", "output", "IL_up_to_150k.csv"))


#### explore IL ppp data--------------------

# calculate total loans by IL zip
zip_total <- IL_up_to_150k %>%
  group_by(Zip) %>%
  summarize(sum(LoanAmount))

# calculate total loans by IL city
city_total <- IL_up_to_150k %>%
  group_by(City) %>%
  summarize(sum(LoanAmount))

View(zip_total)
