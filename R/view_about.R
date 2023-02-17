about_item <- bs4Dash::menuItem(
  text = "About",
  tabName = "about",
  icon = shiny::icon("circle-info")
)

about_content <- bs4Dash::tabItem(
  tabName = "about",
  shiny::fluidRow(
    bs4Dash::box(
      width = 12, title = "About",
      "TODO"
    )
  )
)

