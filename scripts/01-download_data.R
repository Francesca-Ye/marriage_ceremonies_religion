#### Preamble ####
# Purpose: Download England and Wales Marriage Ceremony Data
# Author: Francesca Ye
# Date: 28 March 2024
# Contact: francesca.ye@mail.utoronto.ca
# License: MIT
# Pre-requisites: Access to the Office for National Statistics website



#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
# [...UPDATE THIS...]

#### Download data ####
# [...ADD CODE HERE TO DOWNLOAD...]



#### Save data ####
# [...UPDATE THIS...]
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(the_raw_data, "inputs/data/raw_data.csv") 

         
