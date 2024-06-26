#### Preamble ####
# Purpose: Cleaning Marriage Ceremony Data
# Author: Francesca Ye
# Date: 28 March 2024
# Contact: francesca.ye@mail.utoronto.ca
# License: MIT
# Pre-requisites: Access to the raw data file `01-raw_opposite_sex_data.CSV`and `raw_same_sex_data.CSV`

#### Workspace setup ####
library(tidyverse)
library(janitor)
library(arrow)
library(naniar)

#### Clean data ####

## Opposite-sex cleaning
# Load data and skip rows with introduction notes
raw_opposite_data <- read_csv("~/marriage_ceremonies_religion/data/raw_data/01-raw_opposite_sex_data.CSV", skip = 5)
raw_opposite_data <- clean_names(raw_opposite_data)

# Select only rows for 1970 to 2020
# Referenced function structure from https://www.statology.org/r-remove-rows-from-data-frame-condition
raw_opposite_data <- subset(raw_opposite_data, (source_office_for_national_statistics %in% c(1970:2020)))

# Remove columns not necessary for analysis 
raw_opposite_data <- subset(raw_opposite_data, select = -c(na_7))

# Rename columns
colnames(raw_opposite_data) <- c("year", "all_marriages", "all_civil", "approved_civil", "all_religious", "coe", "rc", "other_christian", "other_religion")

# Remove blank values
# Code referenced from: https://stackoverflow.com/questions/32683599/r-ifelse-to-replace-values-in-a-column
raw_opposite_data$other_religion <-
  ifelse(raw_opposite_data$other_religion == "[x]", 0, raw_opposite_data$other_religion)

raw_opposite_data$approved_civil <-
  ifelse(raw_opposite_data$approved_civil == "[z]", 0, raw_opposite_data$approved_civil)

# All values to numeric 
#Code referenced from: https://stackoverflow.com/questions/26391921/how-to-convert-entire-dataframe-to-numeric-while-preserving-decimals
raw_opposite_data[] <- lapply(raw_opposite_data, type.convert, as.is = TRUE)


## Same-sex cleaning
raw_same_data <- read_csv("~/marriage_ceremonies_religion/data/raw_data/02-raw_same_sex_data.CSV", skip = 5)
raw_same_data <- clean_names(raw_same_data)

# Select only rows from 2016 to 2020
# Referenced function structure from https://www.statology.org/r-remove-rows-from-data-frame-condition
raw_same_data <- subset(raw_same_data, (year %in% c(2016:2020)))

# Rename columns
colnames(raw_same_data) <- c("year", "all_marriages", "male", "female", "all_civil", "approved_civil", "all_religious")

# All values to numeric 
# Code referenced from: https://stackoverflow.com/questions/26391921/how-to-convert-entire-dataframe-to-numeric-while-preserving-decimals
raw_same_data[] <- lapply(raw_same_data, type.convert, as.is = TRUE)

#### Save data ####

## Opposite-sex
#Code referenced from: https://tellingstorieswithdata.com/29-activities.html#store-and-share
write_parquet(x = raw_opposite_data,
              sink = "~/marriage_ceremonies_religion/data/analysis_data/00-cleaned_opposite_sex_data.parquet")

write_csv(x = raw_opposite_data,
          file = "~/marriage_ceremonies_religion/data/analysis_data/02-cleaned_opposite_sex_data.csv")

## Same-sex
#Code referenced from: https://tellingstorieswithdata.com/29-activities.html#store-and-share
write_parquet(x = raw_same_data,
              sink = "~/marriage_ceremonies_religion/data/analysis_data/01-cleaned_same_sex_data.parquet")

write_csv(x = raw_same_data,
          file = "~/marriage_ceremonies_religion/data/analysis_data/03-cleaned_same_sex_data.csv")
