#### Preamble ####
# Purpose: Marriage Ceremony Data Viewer for Opposite and Same-Sex Couples in England and Wales
# Author: Francesca Ye
# Date: 24 March 2024
# Contact: francesca.ye@mail.utoronto.ca
# License: MIT
# Pre-requisites: Cleaned data sets from `02-data_cleaning.R`(02-cleaned_opposite_sex_data.csv and 03-cleaned_same_sex_data.csv)
# Any other information needed? No

### Work space set up
library(shiny)
library(readr)
library(DT)

# Code structure referenced from: https://shiny.posit.co/r/articles/start/basics/

# Create UI object
# Code referenced from: https://shiny.posit.co/r/reference/shiny/0.14.2/fluidpage
ui <- fluidPage(
  
  # App title
  titlePanel("Marriage Ceremony Data Viewer for Opposite and Same-Sex Couples in England and Wales"),
  htmlOutput("body_text"),
  
  # Input sidebar
  sidebarLayout(
    sidebarPanel(
      # Select data set
      selectInput("dataset",
                  "Choose dataset to view:",
                  choices = c("Opposite-Sex", "Same-Sex")),
      
      # Select number of rows to view
      numericInput("obs", "Number of observations to view:", min = 1, value = 10)
    ),
    
    # Output main panel
    mainPanel(
      # Table with requested number of observations
      DTOutput("view")
    )
  )
)

# Define server logic to summarize and view selected dataset
server <- function(input, output) {
  
  # Render the body text
  output$body_text <- renderUI({
    HTML("<p> Data taken from the 2020 edition of the Marriages in England and Wales workbook from the Office of National Statistics.</p>")
  })
  
  # Read the selected dataset and rename columns
  # Code referenced from: https://forum.posit.co/t/changing-datasets-based-on-select-input-in-r-shiny/67891
  dataset <- reactive({
    if (input$dataset == "Opposite-Sex") {
      data <- read_csv("~/marriage_ceremonies_religion/data/analysis_data/02-cleaned_opposite_sex_data.csv")
      if (is.data.frame(data)) {
        # Code referenced from: https://stackoverflow.com/questions/72339815/change-the-name-of-the-column-of-the-dataset-within-the-shiny
        colnames(data) <- c("Year", "All Marriages", "All Civil", "Approved Civil", "All Religious", "Church of England", "Roman Catholic", "Other Christian", "Other Religion")
      }
      return(data)
    } else {
      data <- read_csv("~/marriage_ceremonies_religion/data/analysis_data/03-cleaned_same_sex_data.csv")
      if (is.data.frame(data)) {
        colnames(data) <- c("Year", "All Marriages", "Male", "Female", "All Civil", "Approved Civil", "All Religious")
      }
      return(data)
    }
  })
  
  # Render table with requested number of observations
  # Code referenced from: https://rstudio.github.io/DT/010-style.html
  output$view <- renderDT({
    datatable(head(dataset(), n = input$obs), 
              options = list(pageLength = 10)) %>%
      formatStyle(columns = colnames(dataset()), 
                  fontWeight = "bold", 
                  fontSize = "12px", 
                  textAlign = "center")
  })
}

# Run application
shinyApp(ui, server)
