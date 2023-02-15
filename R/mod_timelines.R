timelines_item <- bs4Dash::menuItem(
  text = "Glossary",
  tabName = "glossary",
  icon = shiny::icon("book-reader")
)

#' User-Interface helper function for `Glossary` section of the application.
#'
#' @importFrom utils read.csv
#' @param id ID name
#' @noRd
timelines_ui <- function(id) {
  ns <- shiny::NS(id)

  bs4Dash::tabItem(
    tabName = id,
    shiny::fluidRow(
      bs4Dash::box(
        width = 12, title = "Glossary",
        shiny::tableOutput(ns("glossary_output"))
      )
    )
  )
}

#' Server helper function for `Glossary` section of the application.
#' @param id ID name
#' @noRd
timelines_server <- function(id) {
  shiny::moduleServer(
    id,
    function(input, output, session) {}
  )
}
