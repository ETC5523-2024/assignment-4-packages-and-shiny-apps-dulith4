library(shiny)

ui <- fluidPage(
  titlePanel("Holiday Movies Dashboard"),
  sidebarLayout(
    sidebarPanel(
      selectInput("year", "Select Year", choices = unique(holiday_movies$year)),
      selectInput("genre", "Select Genre", choices = unique(holiday_movie_genres$genres))
    ),
    mainPanel(
      tableOutput("moviesTable")
    )
  )
)

server <- function(input, output) {
  output$moviesTable <- renderTable({
    filtered_movies <- holiday_movies %>%
      filter(year == input$year) %>%
      semi_join(holiday_movie_genres %>% filter(genres == input$genre), by = "tconst")
    filtered_movies
  })
}

shinyApp(ui = ui, server = server)
