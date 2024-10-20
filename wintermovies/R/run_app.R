#' Launch Shiny App for Holiday Movies
#'
#' This function launches the Shiny app included in the wintermovies package.
#'
#' @export
run_app <- function() {
  shiny::runApp(system.file("app.R", package = "wintermovies"))
}
