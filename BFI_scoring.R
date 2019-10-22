##############################################
##   Big Five Personality Inventory (BFI)   ##
##############################################
#
# Scoring script by Crystal Bae
# Last updated October 2019


#########
# Step 1. Load the tidyverse
# Note: install.packages("tidyverse") if first time using tidyverse on your machine

library(tidyverse)


#########
# Step 2. Read in data

# If your data is in another directory:
# setwd("R:/users/cbae/DATA STORAGE/BigFiveInventory")

df <- read_csv("Pre-Study-Questionnaire.csv") ## Point to your file


#########
# Step 3. Subset dataframe

# Subset basic demographics
PID <- df[,3]
date <- df[,4]
sex <- df[,8]
age <- df[,9]

# Extract the columns that contain your BFI question BFI:
BFI <- df[,26:69]

# Check your data
summary(BFI)
# Should have 44 variables, 1 for each question of the BFI
# Each question should have a min of at least 1, and a max no larger than 5

BF01 <- BFI[,1]
BF02 <- BFI[,2]
BF03 <- BFI[,3]
BF04 <- BFI[,4]
BF05 <- BFI[,5]
BF06 <- BFI[,6]
BF07 <- BFI[,7]
BF08 <- BFI[,8]
BF09 <- BFI[,9]
BF10 <- BFI[,10]
BF11 <- BFI[,11]
BF12 <- BFI[,12]
BF13 <- BFI[,13]
BF14 <- BFI[,14]
BF15 <- BFI[,15]
BF16 <- BFI[,16]
BF17 <- BFI[,17]
BF18 <- BFI[,18]
BF19 <- BFI[,19]
BF20 <- BFI[,20]
BF21 <- BFI[,21]
BF22 <- BFI[,22]
BF23 <- BFI[,23]
BF24 <- BFI[,24]
BF25 <- BFI[,25]
BF26 <- BFI[,26]
BF27 <- BFI[,27]
BF28 <- BFI[,28]
BF29 <- BFI[,29]
BF30 <- BFI[,30]
BF31 <- BFI[,31]
BF32 <- BFI[,32]
BF33 <- BFI[,33]
BF34 <- BFI[,34]
BF35 <- BFI[,35]
BF36 <- BFI[,36]
BF37 <- BFI[,37]
BF38 <- BFI[,38]
BF39 <- BFI[,39]
BF40 <- BFI[,40]
BF41 <- BFI[,41]
BF42 <- BFI[,42]
BF43 <- BFI[,43]
BF44 <- BFI[,44]


#########
# Step 4. Reverse code appropriate questions

## Reverse-code Q #s: 
# 2, 6, 8, 9, 12, 18,
# 21, 23, 24, 27, 31, 34,
# 35, 37, 41, 43
BF02 <- 6-BF02
BF06 <- 6-BF06
BF08 <- 6-BF08
BF09 <- 6-BF09
BF12 <- 6-BF12
BF18 <- 6-BF18
BF21 <- 6-BF21
BF23 <- 6-BF23
BF24 <- 6-BF24
BF27 <- 6-BF27
BF31 <- 6-BF31
BF34 <- 6-BF34
BF35 <- 6-BF35
BF37 <- 6-BF37
BF41 <- 6-BF41
BF43 <- 6-BF43


#########
# Step 5. Score each of the five BFI domains

# Extraversion: 1, 6R, 11, 16, 21R, 26, 31R, 36
BFI_ext <- (BF01+BF06+BF11+BF16+BF21+BF26+BF31+BF36)/8

# Agreeableness: 2R, 7, 12R, 17, 22, 27R, 32, 37R, 42
BFI_agr <- (BF02+BF07+BF12+BF17+BF22+BF27+BF32+BF37+BF42)/9

# Conscientiousness: 3, 8R, 13, 18R, 23R, 28, 33, 38, 43R
BFI_con <- (BF03+BF08+BF13+BF18+BF23+BF28+BF33+BF38+BF43)/9

# Neuroticism: 4, 9R, 14, 19, 24R, 29, 34R, 39
BFI_neu <- (BF04+BF09+BF14+BF19+BF24+BF29+BF34+BF39)/8

# Openness: 5, 10, 15, 20, 25, 30, 35R, 40, 41R, 44
BFI_ope <- (BF05+BF10+BF15+BF20+BF25+BF30+BF35+BF40+BF41+BF44)/10


#########
# Step 6. Output to CSV
# Outputs a CSV table with PID and BFI dimensions

output <- data.frame(PID[], BFI_agr[], BFI_con[], BFI_ext[], BFI_neu[], BFI_ope[])
colnames(output) <- c("PID", "BFI_agr", "BFI_con", "BFI_ext", "BFI_neu", "BFI_ope")

# Write to CSV
# path = filename to be written
write_csv(output, path = "output_BFI.csv", append = FALSE, col_names = TRUE) 

