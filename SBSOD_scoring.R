##############################################
## Santa Barbara Sense of Direction (SBSOD) ##
##############################################
#
# Scoring script by Crystal Bae
# Last updated October 2019
#
# Citation for SBSOD: 
# Hegarty, M., Richardson, A. E., Montello, D. R., Lovelace, K., & Subbiah, I. (2002). Development of a self-report measure of environmental spatial ability. Intelligence, 30(5), 425–447. https://doi.org/10.1016/S0160-2896(02)00116-2
#
# Questionnaire itself is also available in the Hegarty et al. (2002) paper, on pages 445-446.
#
# Notes:
# ------
# Items are scored on a Likert scale ranging from 1 to 7:
#   1 = strongly agree
#   ...
#   7 = strongly disagree
#
# All items are scored such that a higher rating indicates a better self-reported SOD
# (i.e., scoring of positively stated items should be reversed).


#########
# Step 1. Load the tidyverse
# Note: install.packages("tidyverse") if first time using tidyverse on your machine

library(tidyverse)


#########
# Step 2. Read in data

# If your data is in another directory:
# setwd("R:/users/cbae/DATA STORAGE/BigFiveInventory")

df <- read_csv("Pre-Study-Questionnaire.csv") ## Change filename to whatever you named it


#########
# Step 3. Subset dataframe

# Subset basic demographics
PID <- df[,3]
date <- df[,4]
sex <- df[,8]
age <- df[,9]

# Subset SBSOD questions:
SODall <- df[,10:24] ## Change this based on which columns of your dataframe contain SBSOD questions, 1 - 15

# Check data for missing / impossible values
summary(SODall) # Min. should not be < 1 and Max. should not be > 7 for any question

# Assign each SBSOD question

SOD01 <- SODall[,1]
SOD02 <- SODall[,2]
SOD03 <- SODall[,3]
SOD04 <- SODall[,4]
SOD05 <- SODall[,5]
SOD06 <- SODall[,6]
SOD07 <- SODall[,7]
SOD08 <- SODall[,8]
SOD09 <- SODall[,9]
SOD10 <- SODall[,10]
SOD11 <- SODall[,11]
SOD12 <- SODall[,12]
SOD13 <- SODall[,13]
SOD14 <- SODall[,14]
SOD15 <- SODall[,15]


#########
# Step 4. Reverse-coded questions
# Questions 1, 3, 4, 5, 7, 9, 14 need to be reverse-scored

# Reverse coding:
SOD01 <- 8-SOD01
SOD03 <- 8-SOD03
SOD04 <- 8-SOD04
SOD05 <- 8-SOD05
SOD07 <- 8-SOD07
SOD09 <- 8-SOD09
SOD14 <- 8-SOD14


#########
# Step 5. Scored SBSOD for each participant
# The final SBSOD score for each participant will be between 1 and 7
# NOTE: Give this a proper header row!

SBSOD <- (SOD01+SOD02+SOD03+SOD04+SOD05+SOD06+SOD07+SOD08+SOD09+
            SOD10+SOD11+SOD12+SOD13+SOD14+SOD15)/15

summary(SBSOD)


#########
# Step 6. Output to CSV
# Outputs a CSV table with PID and SBSOD

output <- data.frame(PID[], SBSOD[])

write_csv(output, path = "output_SBSOD.csv", append = FALSE, col_names = TRUE) # path is filename to be written

