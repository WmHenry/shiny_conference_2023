#' @keywords internal
"_PACKAGE"

#' @importFrom magrittr %>%
NULL

app_sys <- function(...) {
  system.file(..., package = "scdemo2023")
}

.onLoad <- function(...) {
  shiny::addResourcePath('themes', system.file("www", package = "scdemo2023"))
}

#' Run application
#'
#' @name run_app
#' @export
run_app <- function() {
  shiny::shinyApp(
    ui = app_ui,
    server = app_server,
    options = list("launch.browser" = interactive())
  )
}
