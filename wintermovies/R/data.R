#' Holiday Movies Dataset
#'
#' A dataset containing holiday-related movies from 1929 to 2023. The data includes movie titles, genres, IMDb ratings, and holiday types (Christmas, Hanukkah, Kwanzaa).
#'
#' @format A data frame with x rows and y variables:
#' \describe{
#'   \item{tconst}{Unique identifier for the movie (character)}
#'   \item{primary_title}{Popular title of the movie (character)}
#'   \item{year}{Year the movie was released (numeric)}
#'   \item{genres}{Comma-separated list of genres (character)}
#'   \item{christmas}{1 if the movie relates to Christmas, 0 otherwise (integer)}
#'   \item{hanukkah}{1 if the movie relates to Hanukkah, 0 otherwise (integer)}
#'   \item{kwanzaa}{1 if the movie relates to Kwanzaa, 0 otherwise (integer)}
#'   \item{average_rating}{IMDb average rating (numeric)}
#'   \item{num_votes}{Number of votes received on IMDb (numeric)}
#' }
#' @source The data was obtained from the TidyTuesday project. TidyTuesday is a weekly data project.
#' \url{https://github.com/rfordatascience/tidytuesday/tree/master/data/2023/2023-12-12}
"holiday_movies"

#' Holiday Movie Genres Dataset
#'
#' A dataset containing genres associated with holiday movies, where each movie may have multiple genres listed in separate rows. Irrelevant genres like "Music", "Talk-Show", "News" have been removed.
#'
#' @format A data frame with x rows and 2 variables:
#' \describe{
#'   \item{tconst}{Unique identifier for the movie (character)}
#'   \item{genres}{Genres associated with the movie (character)}
#' }
#' @source The data was obtained from the TidyTuesday project. TidyTuesday is a weekly data project.
#' \url{https://github.com/rfordatascience/tidytuesday/tree/master/data/2023/2023-12-12}
"cleaned_holiday_movie_genres"
