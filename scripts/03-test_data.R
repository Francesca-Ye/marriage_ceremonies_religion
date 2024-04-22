#### Preamble ####
# Purpose: Tests on Marriage Ceremony Type
# Author: Francesca Ye
# Date: 28 March 2024
# Contact: francesca.ye@mail.utoronto.ca
# License: MIT
# Pre-requisites: Cleaned data set from `02-data_cleaning.R`
# Any other information needed? No


#### Workspace setup ####
library(tidyverse)

#### Test Same-Sex Marriage Data ####
# Check if all religious and civil ceremonies in a year add up to the stated total
totals_check_same <- raw_same_data |>
  group_by(year) |>
  summarise(civil_religious = sum(all_civil, all_religious),
            all_ceremonies = sum(all_marriages))

totals_check_same <- totals_check_same |>
  mutate(check = ifelse(civil_religious == all_ceremonies, "Yes", "No"))

print(totals_check_same)

# The "year" values are exclusively 2016-2020
raw_same_data$year |>
  unique(2016:2020)

# Annual marriage totals are integers
raw_same_data$all_marriages|>
  class() == "integer"

# Each year only appears once
raw_same_data |>
  group_by(year) |>
  summarise(count = n()) |>
  filter(count != 1)

##### Test Opposite-Sex Data ####
# Check if all religious and civil ceremonies in a year add up to the stated total
totals_check_opposite <- raw_opposite_data |>
  group_by(year) |>
  summarise(civil_religious = sum(all_civil, all_religious),
            all_ceremonies = sum(all_marriages))

totals_check_opposite <- totals_check_opposite |>
  mutate(check = ifelse(civil_religious == all_ceremonies, "Yes", "No"))

print(totals_check_opposite)

# Check if all religious ceremonies types in a year add up to the stated total
totals_check_religious <- raw_opposite_data |>
  group_by(year) |>
  summarise(religious_types = sum(coe, rc, other_christian, other_religion),
            all_ceremonies = sum(all_religious))

totals_check_religious <- totals_check_religious |>
  mutate(check = ifelse(all_ceremonies == religious_types, "Yes", "No"))

print(totals_check_religious)

# The "year" values are exclusively 1970-2020
raw_opposite_data$year |>
  unique(1970:2020)

# Annual marriage totals are integers
raw_opposite_data$all_marriages|>
  class() == "integer"

# Each year only appears once
raw_opposite_data |>
  group_by(year) |>
  summarise(count = n()) |>
  filter(count != 1)

