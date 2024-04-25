# Analysis and Comparative Study of Marriage Ceremony Type (Civil and Religious) for Opposite-Sex (1970 to 2020) and Same-Sex (2016 to 2020) Couples

## Overview

This paper investigates the annual number of marriage conducted in England and Wales based on ceremony type recorded the by the Office of National Statistics. Based on the data set, these trends between 1970 to 2020 were analyzed for opposite-sex couples and between 2016 to 2020 for same-sex couples.

## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from the Office for National Statistics.
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `other` contains relevant literature, details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.
-   `shiny_app/app.R` contains the code to run a Shiny App that allows for an interactive view of the cleaned data sets used in the paper.

## How to Run
- Run `scripts/01-download_data.R` to download raw data
- Run `scripts/02-clean_data.R to` generate cleaned data
- Run `paper/paper.qmd` to generate the PDF of the paper

## Statement on LLM usage

No aspects of the code were written with the use of LLMs. All references used for the code are cited in the specific files or in the paper. 
