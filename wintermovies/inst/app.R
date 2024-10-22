library(shiny)
library(dplyr)
library(plotly)
library(wintermovies)
library(bslib)

# Load the cleaned datasets from the package

load(system.file("data", "holiday_movies.rda", package = "wintermovies"))
load(system.file("data", "cleaned_holiday_movie_genres.rda", package = "wintermovies"))

# Define UI for the Shiny app

ui <- fluidPage(
  theme = bs_theme(bootswatch = "minty"),

  tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "styles.css")),

  titlePanel("Holiday Movies Explorer"),

  sidebarLayout(
    sidebarPanel(
      selectInput("year", "Select Year", choices = sort(unique(holiday_movies$year))),
      selectInput("genre", "Select Genre", choices = unique(cleaned_holiday_movie_genres$genres)),
      p("Use the dropdown menus to filter the data by year and genre."),


      p("The table below shows holiday movies from the selected year and genre. The columns represent:"),
      tags$ul(
        tags$li("Year: The year the movie was released"),
        tags$li("Runtime Minutes: The length of the movie in minutes"),
        tags$li("Num Votes: The number of votes the movie has received on IMDb"),
        tags$li("Genre: The genre of the movie")
      )
    ),

    mainPanel(
      tableOutput("moviesTable"),

      # Provide interpretation for the outputs
      p("Interpretation: This table helps you explore the holiday movies dataset based on your selected year and genre."),

      # Static interactive Plotly bar plot for overall genre distribution
      div(class = "user-select-none_svg-container",
          plotlyOutput("genreBarPlot")
      ),
      p("This bar plot shows the count of all genres across the entire dataset.
        The bars which are highlighted (red) are the most popular genres in the
        holiday movies as users will know the popular genres.")
    )
  )
)

# Define server logic for filtering data and rendering the table and static plot
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
        year = as.integer(year),
        runtime_minutes = as.integer(runtime_minutes),
        num_votes = as.integer(num_votes)
      )
  })

  # Static Plotly bar plot showing the count of all genres across the entire dataset
  output$genreBarPlot <- renderPlotly({
    # Count the occurrences of each genre across the whole dataset
    genre_counts <- cleaned_holiday_movie_genres %>%
      count(genres) %>%
      arrange(desc(n))  # Arrange in descending order for better visualization

    # Convert genres to factor to preserve the descending order
    genre_counts$genres <- factor(genre_counts$genres, levels = genre_counts$genres)

    # Create a color vector: red for top 5 genres, blue for the rest
    colors <- ifelse(1:nrow(genre_counts) <= 5, 'red', 'steelblue')

    # Create an interactive Plotly bar plot with custom colors
    plot_ly(genre_counts, x = ~genres, y = ~n, type = 'bar', marker = list(color = colors)) %>%
      layout(
        title = "Popular Genre in Holiday Movies",
        xaxis = list(title = "Genre", tickangle = -90),
        yaxis = list(title = "Count"),
        barmode = 'stack'
      )
  })
}

# Run the Shiny app
shinyApp(ui = ui, server = server)
