#' @keywords internal
"_PACKAGE"

#' @importFrom magrittr %>%
NULL

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
