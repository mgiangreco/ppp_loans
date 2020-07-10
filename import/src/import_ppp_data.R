# import PPP data

#Load Packages ------------------------------------------------------------------------
#Add all required lists to the list.of.packages object
#missing packages will be automatically installed
list.of.packages <- c("tidyverse",
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

#### import------------

# source for ppp data: https://home.treasury.gov/policy-issues/cares-act/assistance-for-small-businesses/sba-paycheck-protection-program-loan-level-data

# import IL up to 150k loans
IL_up_to_150k <- read_csv(here("import",
                               "input",
                               "All Data by State_070620",
                               "Illinois",
                               "foia_up_to_150k_IL.csv"))

#### NOTE on 150k plus data
# after import, I had to compress original 150k_plus data file from repo because it is too big to upload to github. 
# push request was rejected by github because it was >100mb
# that is why i left this code commented below. IL 150k plus data can be accessed in the /import/output folder or by extracting the compressed file

# # import 150k plus file for all states, filtering for IL
# IL_150k_plus <- read_csv(here("import",
#                               "input",
#                               "All Data by State_070620",
#                               "150k plus",
#                               "foia_150k_plus.csv")) %>%                      
#                   filter(State == "IL")


#### export IL data
write.csv(IL_150k_plus,here("import", "output", "IL_150k_plus.csv"), row.names = F)

write.csv(IL_up_to_150k,here("import", "output", "IL_up_to_150k.csv"), row.names = F)
