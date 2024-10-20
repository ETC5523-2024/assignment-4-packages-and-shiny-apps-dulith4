library(readr)
library(dplyr)
library(tidyr)

# Read the data
holiday_movies <- read_csv("data-raw/holiday_movies.csv")
holiday_movie_genres <- read_csv("data-raw/holiday_movies_genres.csv")

# Remove irrelevant genres
irrelevant_genres <- c("Music", "Talk-Show", "News", "Reality-TV", "Sport")
cleaned_holiday_movie_genres <- holiday_movie_genres %>%
  filter(!genres %in% irrelevant_genres)

# Convert holiday columns to integer for analysis
holiday_movies <- holiday_movies %>%
  mutate(across(c(christmas, hanukkah, kwanzaa), as.integer))



save(holiday_movies, file = "C:/Users/hansa/Downloads/assignment-4-packages-and-shiny-apps-dulith4/wintermovies/data/holiday_movies.rda")
save(cleaned_holiday_movie_genres, file = "C:/Users/hansa/Downloads/assignment-4-packages-and-shiny-apps-dulith4/wintermovies/data/cleaned_holiday_movie_genres.rda")



