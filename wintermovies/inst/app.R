library(shiny)
library(dplyr)
library(wintermovies)

# Load the cleaned datasets from the package

load(system.file("data", "holiday_movies.rda", package = "wintermovies"))
load(system.file("data", "cleaned_holiday_movie_genres.rda", package = "wintermovies"))

# Define UI for the Shiny app
ui <- fluidPage(
  titlePanel("Holiday Movies Explorer"),

  sidebarLayout(
    sidebarPanel(
      selectInput("year", "Select Year", choices = unique(holiday_movies$year)),
      selectInput("genre", "Select Genre", choices = unique(cleaned_holiday_movie_genres$genres)),
      p("Use the dropdown menus to filter the data by year and genre.")
    ),

    mainPanel(
      tableOutput("moviesTable"),
      p("Note: This table shows holiday movies released in the selected year and genre.")
    )
  ),

  tags$style(HTML("
    body {background-color: #f8f9fa;}
    .well {background-color: #e9ecef;}
    h1 {color: #0056b3;}
  "))
)

# Define server logic for filtering data and rendering the table
server <- function(input, output) {
  output$moviesTable <- renderTable({
    filtered_movies <- holiday_movies %>%
      filter(year == input$year) %>%
      semi_join(cleaned_holiday_movie_genres %>% filter(genres == input$genre), by = "tconst")
    filtered_movies
  })
}

# Run the Shiny app
shinyApp(ui = ui, server = server)
