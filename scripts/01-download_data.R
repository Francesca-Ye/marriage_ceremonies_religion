#### Preamble ####
# Purpose: Download England and Wales Marriage Ceremony Data
# Author: Francesca Ye
# Date: 28 March 2024
# Contact: francesca.ye@mail.utoronto.ca
# License: MIT
# Pre-requisites: Access to the Office for National Statistics website



#### Workspace setup ####
library(readxl)
library(tidyverse)
library(readr)

#### Download data ####
# Get the Marriages in England and Wales Dataset (2020 edition)
# Code referenced from: https://piazza.com/class/lrja9wmteoj28u/post/10
download.file(url = "https://www.ons.gov.uk/file?uri=/peoplepopulationandcommunity/birthsdeathsandmarriages/marriagecohabitationandcivilpartnerships/datasets/marriagesinenglandandwales2013/2020/marriagesworkbook2020.xlsx", destfile = "~/marriage_ceremonies_religion/data/raw_data/00-marriagesworkbook2020.xlsx")

# Download ceremony statistics on opposite-sex marriages
opposite_sex_data <- read_excel("~/marriage_ceremonies_religion/data/raw_data/00-marriagesworkbook2020.xlsx", sheet = "1b")

# Download ceremony statistics on same-sex marriages
same_sex_data <- read_excel("~/marriage_ceremonies_religion/data/raw_data/00-marriagesworkbook2020.xlsx", sheet = "1c")

#### Save data ####
# Save ceremony statistics on opposite-sex marriages as a CSV
write_csv (
  x = opposite_sex_data,
  file = "~/marriage_ceremonies_religion/data/raw_data/01-raw_opposite_sex_data.csv"
)

# Sane ceremony statistics on same-sex marriages as a CSV
write_csv (
  x = same_sex_data,
  file = "~/marriage_ceremonies_religion/data/raw_data/02-raw_same_sex_data.csv"
)

         
