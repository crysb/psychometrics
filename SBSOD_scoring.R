##############################################
## Santa Barbara Sense of Direction (SBSOD) ##
##############################################
#
# Scoring script by Crystal Bae
# Last updated April 2021
#
# Citation for the SBSOD: 
# Hegarty, M., Richardson, A. E., Montello, D. R., Lovelace, K., & Subbiah, I. (2002). Development of a self-report measure of environmental spatial ability. Intelligence, 30(5), 425–447. https://doi.org/10.1016/S0160-2896(02)00116-2
#
# Questionnaire itself is available in the Hegarty et al. (2002) paper, on pages 445-446.
#
# Scoring:
# Items are scored on a Likert scale ranging from 1 to 7:
#   1 = strongly agree
#   ...
#   7 = strongly disagree
#
# All items are scored such that a higher rating indicates a better self-reported SOD
# (i.e., scoring of positively stated items should be reversed).


#########
# Step 1. Load packages

#install.packages("tidyverse") # e.g. if first time using tidyverse on your machine

library(tidyverse)
library(dplyr)
library(here)
library(data.table)


#########
# Step 2. Read in data

# If your data is in another directory, use `here` package:
#df <- read_csv(here("foldername", "filename.csv"))

df <- read_csv("Pre-Study-Questionnaire.csv") # change filename to whatever you named it

#########
# Step 3. Subset dataframe and check data

# Subset SBSOD questions and give them names 'sbsod_1' through 'sbsod_15'
setnames(df, old = c(10:24),  ## Change this based on which 15 columns of your dataframe contain SBSOD questions
         new = c('sbsod_1', 'sbsod_2', 'sbsod_3', 'sbsod_4', 'sbsod_5', 'sbsod_6', 'sbsod_7', 'sbsod_8', 'sbsod_9', 'sbsod_10', 'sbsod_11', 'sbsod_12', 'sbsod_13', 'sbsod_14', 'sbsod_15'))

# Check data for missing or impossible values
summary(df[,10:24]) # Min. should not be < 1 and Max. should not be > 7 for any question
# data_all %>% 
#   select(., contains('sbsod_')) %>% 
#   summary()


#########
# Step 4. Reverse-code questions
# Questions 1, 3, 4, 5, 7, 9, 14 need to be reverse-scored

# Reverse coding:
df$sbsod_1 <- 8-df$sbsod_1
df$sbsod_3 <- 8-df$sbsod_3
df$sbsod_4 <- 8-df$sbsod_4
df$sbsod_5 <- 8-df$sbsod_5
df$sbsod_7 <- 8-df$sbsod_7
df$sbsod_9 <- 8-df$sbsod_9
df$sbsod_14 <- 8-df$sbsod_14


#########
# Step 5. Scored SBSOD for each participant
# The final SBSOD score for each participant will be between 1 and 7

# Sum all questions and divide by # of questions (15)
# Adds SBSOD scores to existing dataframe
df <- df %>%
  mutate(sbsod = ((rowSums(select(., contains('sbsod_'))))/15))

summary(df$sbsod)


#########
# Step 6. Output to CSV
# Outputs new CSV with calculated SBSOD scores

write_csv(df, file = "output.csv", append = FALSE, col_names = TRUE)

