#### Preamble ####
# Purpose: Simulation for Marriage Ceremony Type
# Author: Francesca Ye
# Date: 28 March 2024
# Contact: francesca.ye@mail.utoronto.ca
# License: MIT
# Pre-requisites:None
# Any other information needed? No


#### Workspace setup ####
library(tidyverse)
library(tibble)
library(raster)

#### Simulate data ####
set.seed(777)

simulated_marriage_ceremony_data <-
  tibble(
    "Year" = 2016:2020,
    "Civil" = sample(
      x = c(0:250000),
      size = 5,
      replace = TRUE
    ), 
    "CoE" = sample(
      x = c(0:250000),
      size = 5,
      replace = TRUE
    ), 
    "Catholic" = sample(
      x = c(0:250000),
      size = 5,
      replace = TRUE
    ),
    "Other_Christian" = sample(
      x = c(0:250000),
      size = 5,
      replace = TRUE
    ),
    "Other" = sample(
      x = c(0:250000),
      size = 5,
      replace = TRUE
    )
  )

simulated_marriage_ceremony_data <- 
  simulated_marriage_ceremony_data %>%
  # Code referenced from: https://www.rdocumentation.org/packages/raster/versions/3.6-23/topics/rowSums
  mutate(Total_Ceremonies = rowSums(select(., -Year)))

print(simulated_marriage_ceremony_data)

