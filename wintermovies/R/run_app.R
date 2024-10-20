#' Run Shiny App for Holiday Movies
#'
#' This function launches the Shiny app included in the wintermovies package.
#' Which allows the users to know holiday movies.
#'
#' @export
#' @example
#' run_app()
run_app <- function() {
  shiny::runApp(system.file("app.R", package = "wintermovies"))
}
