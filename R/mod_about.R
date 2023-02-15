about_item <- bs4Dash::menuItem(
  text = "About",
  tabName = "about",
  icon = shiny::icon("circle-info")
)

#' User-Interface helper function for `About` section of the application.
#'
#' @param id ID name
#' @noRd
about_ui <- function(id) {
  ns <- shiny::NS(id)

  bs4Dash::tabItem(
    tabName = id,
    shiny::fluidRow(
      bs4Dash::box(
        width = 8, title = "About",
        shiny::includeMarkdown(path = app_sys("README.md"))
      ),
      bs4Dash::box(
        width = 4,
        title = "Changelog",
        "TODO"
      )
    )
  )
}
