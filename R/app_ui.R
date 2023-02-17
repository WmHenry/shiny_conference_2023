#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  autodisable_controlbar(
    bs4Dash::dashboardPage(
      title = "Shiny Conference 2023",
      skin = "light",
      freshTheme = get_custom_theme(
        type = "bs4Dash-light-dark",
        fresh::bs4dash_layout(
          control_sidebar_width = "700px"
        )
      ),
      dark = NULL,
      header = bs4Dash::dashboardHeader(
        fixed = TRUE,
        titleWidth = 300,
        title = bs4Dash::dashboardBrand(
          title = "Demo App"
        )
      ),
      sidebar = bs4Dash::dashboardSidebar(
        width = 500,
        skin = "dark",
        bs4Dash::sidebarMenu(
          id = "sidebar",
          about_item,
          timelines_item
        )
      ),
      body = bs4Dash::dashboardBody(
        bs4Dash::tabItems(
          about_content,
          timelines_content
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
      )
    )
  ) %>%
    htmltools::attachDependencies(
      htmltools::htmlDependency(
        name = "scdemo2023",
        version = utils::packageVersion("scdemo2023"),
        package = "scdemo2023",
        src = "www",
        script = "script.js"#,
        # stylesheet = "styles.css"
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
