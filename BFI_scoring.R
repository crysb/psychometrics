### Scoring the Big Five Personality Inventory

## BFI Questions
# For the columns that contain your BFI question responses:
BF01 <- responses[,26]
BF02 <- responses[,27]
BF03 <- responses[,28]
BF04 <- responses[,29]
BF05 <- responses[,30]
BF06 <- responses[,31]
BF07 <- responses[,32]
BF08 <- responses[,33]
BF09 <- responses[,34]
BF10 <- responses[,35]
BF11 <- responses[,36]
BF12 <- responses[,37]
BF13 <- responses[,38]
BF14 <- responses[,39]
BF15 <- responses[,40]
BF16 <- responses[,41]
BF17 <- responses[,42]
BF18 <- responses[,43]
BF19 <- responses[,44]
BF20 <- responses[,45]
BF21 <- responses[,46]
BF22 <- responses[,47]
BF23 <- responses[,48]
BF24 <- responses[,49]
BF25 <- responses[,50]
BF26 <- responses[,51]
BF27 <- responses[,52]
BF28 <- responses[,53]
BF29 <- responses[,54]
BF30 <- responses[,55]
BF31 <- responses[,56]
BF32 <- responses[,57]
BF33 <- responses[,58]
BF34 <- responses[,59]
BF35 <- responses[,60]
BF36 <- responses[,61]
BF37 <- responses[,62]
BF38 <- responses[,63]
BF39 <- responses[,64]
BF40 <- responses[,65]
BF41 <- responses[,66]
BF42 <- responses[,67]
BF43 <- responses[,68]
BF44 <- responses[,69]

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

## Scoring BFI domains

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