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
      dark = NULL,
      freshTheme = "themes/company.css",
      header = bs4Dash::dashboardHeader(
        fixed = TRUE,
        skin = "light",
        status = "",
        titleWidth = 300,
        title = bs4Dash::dashboardBrand(
          title = "Demo App",
          color = "primary"
        )
      ),
      sidebar = bs4Dash::dashboardSidebar(
        width = 500,
        skin = "light",
        status = "primary",
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
          shinyCohortBuilder::cb_ui(id = "data", steps = TRUE)
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
        script = "script.js"
      )
    )
}
