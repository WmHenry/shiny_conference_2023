#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  autodisable_controlbar(
    bs4Dash::dashboardPage(
      title = "shinyRochePortfolio",
      skin = "light",
      dark = NULL,
      bs4Dash::dashboardHeader(
        fixed = TRUE,
        titleWidth = 200,
        title = "App"
      ),
      bs4Dash::dashboardSidebar(
        width = 300,
        bs4Dash::sidebarMenu(
          id = "sidebar",
          about_item,
          timelines_item %>%
            show_when_filters_ready("data-") %>%
            htmltools::tagAppendAttributes(class = "sg_hidden")
        )
      ),
      controlbar = pin_controlbar(
        bs4Dash::dashboardControlbar(
          id = "controlbar",
          collapsed = TRUE,
          overlay = FALSE,
          skin = "light",
          width = 300,
          shinyCohortBuilder::cb_ui(id = "data", steps = FALSE)
        )
      ),
      bs4Dash::dashboardBody(
        bs4Dash::tabItems(
          about_ui("about"),
          timelines_ui("glossary")
        )
      )
    )
  ) %>%
    htmltools::attachDependencies(
      htmltools::htmlDependency(
        name = "scdemo2023",
        version = utils::packageVersion("scdemo2023"),
        package = "scdemo2023",
        src = "www",
        script = "script.js",
        stylesheet = "styles.css"
      )
    )
}

autodisable_js_call <- shinyGizmo::jsCalls$custom(
  false = htmlwidgets::JS(
    "$(this).removeClass('control-sidebar-slide-open'); $('#controlbar-toggle').addClass('disabled-link');"
  ),
  true = htmlwidgets::JS("openControlbar()")
)
autodisable_controlbar <- function(page_body) {
  if (page_body[[2]][[1]]$name == "body") {
    page_body[[2]][[1]] <- shinyGizmo::conditionalJS(
      page_body[[2]][[1]],
      condition = "input.sidebar != 'about'",
      jsCall = autodisable_js_call
    )
  }
  return(page_body)
}
