library(shiny)
library(dplyr)
library(plotly)
library(wintermovies)

# Load the cleaned datasets from the package

load(system.file("data", "holiday_movies.rda", package = "wintermovies"))
load(system.file("data", "cleaned_holiday_movie_genres.rda", package = "wintermovies"))

# Define UI for the Shiny app

ui <- fluidPage(
  titlePanel("Holiday Movies Explorer"),

  sidebarLayout(
    sidebarPanel(
      # Sort the years in ascending order
      selectInput("year", "Select Year", choices = sort(unique(holiday_movies$year))),
      selectInput("genre", "Select Genre", choices = unique(cleaned_holiday_movie_genres$genres)),
      p("Use the dropdown menus to filter the data by year and genre.")
    ),

    mainPanel(
      tableOutput("moviesTable"),
      p("Note: This table shows holiday movies released in the selected year and genre.")
    )
  )
)

# Define server logic for filtering data and rendering the table
server <- function(input, output) {

  # Reactive data based on selected year and genre
  filtered_movies <- reactive({
    holiday_movies %>%
      filter(year == input$year) %>%
      semi_join(cleaned_holiday_movie_genres %>% filter(genres == input$genre), by = "tconst")
  })

  # Table output showing the filtered movies
  output$moviesTable <- renderTable({
    filtered_movies() %>%
      mutate(
        year = as.integer(year),                   # Remove decimal points from year
        runtime_minutes = as.integer(runtime_minutes),  # Remove decimal points from runtime
        num_votes = as.integer(num_votes)              # Remove decimal points from num_votes
      )
  })
}

# Run the Shiny app
shinyApp(ui = ui, server = server)
