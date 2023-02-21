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
      h2("Components used:"),
      tags$ul(
        tags$li(
          tags$a(href = "https://github.com/openpharma/DataFakeR/","DataFakeR"),
          tags$span(" - generating sample patients data")
        ),
        tags$li(
          tags$a(href = "https://github.com/r-world-devs/cohortBuilder", "cohortBuilder"),
          tags$span(" and "),
          tags$a(href = "https://github.com/r-world-devs/shinyCohortBuilder","shinyCohortBuilder"),
          tags$span(" - data filtering module")
        ),
        tags$li(
          tags$a(href = "https://github.com/r-world-devs/shinyTimelines", "shinyTimelines"),
          tags$span(" - analytical module for presenting patients treatment timeline"),
        ),
        tags$li(
          tags$a(href = "https://github.com/dreamRs/bs4Dash", "bs4Dash"),
          tags$span(" and "),
          tags$a(href = "https://github.com/dreamRs/fresh", "fresh"),
          tags$span(" - application layout and styling")
        )
      )
    )
  )
)

