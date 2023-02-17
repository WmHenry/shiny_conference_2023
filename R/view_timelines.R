timelines_item <- bs4Dash::menuItem(
  text = "Patients Timeline",
  tabName = "timelines",
  icon = shiny::icon("book-reader")
) %>%
  show_when_filters_ready("data-") %>%
  htmltools::tagAppendAttributes(class = "sg_hidden")

timelines_content <- bs4Dash::tabItem(
  tabName = "timelines",
  shiny::fluidRow(
    bs4Dash::box(
      width = 12, title = "Patients Timeline",
      shinyTimelines::shiny_timelines_ui("timeln")
    )
  )
)

timelines_server <- function(session, filtered_data) {
  mod_data <- reactiveValues(
    demographics = NULL, lineoftherapy = NULL,
    visits = NULL, indications = NULL,
    columns_mapping = NULL
  )

  observeEvent(filtered_data(), {
    mod_data$demographics <- filtered_data()$demographics
    mod_data$lineoftherapy <- filtered_data()$line_of_therapy
    mod_data$visits <- filtered_data()$visit
    mod_data$indications <- filtered_data()$indications
  })

  callModule(
    shinyTimelines::shiny_timelines_server,
    id = "timeln",
    session = session,
    .list = mod_data,
    extra_data = c("Extra col" = "random_date"),
    columns_mapping = data_mapping
  )
}

data_mapping <- list(
  "single_case" = list(
    "demographics" = list(
      "patientid" = "patientid",
      "dateofdeath" = "dateofdeath",
      "lastseen" = "lastseen",
      "indexdate" = "diagnosisdate"
    ),
    "lineoftherapy" = list(
      "patientid" = "patientid",
      "linename" = "linename",
      "linenumber" = "linenumber",
      "startdate" = "startdate",
      "enddate" = "enddate"
    ),
    "visits" = list(
      "patientid" = "patientid",
      "visitdate" = "visitdate",
      "visittype" = "visittype"
    )
  ),
  "multiple_case" = list(
    "demographics" = list(
      "patientid" = "patientid",
      "dateofdeath" = "dateofdeath",
      "lastseen" = "lastseen",
      "random_date"= "random_date"
    ),
    "lineoftherapy" = list(
      "patientid" = "patientid",
      "linename" = "linename",
      "linenumber" = "linenumber",
      "startdate" = "startdate",
      "enddate" = "enddate",
      "indication" = "indication"
    ),
    "visits" = list(
      "patientid" = "patientid",
      "visitdate" = "visitdate",
      "visittype" = "visittype",
      "indication" = "indication"
    ),
    "indications" = list(
      "patientid" = "patientid",
      "indication" = "indication",
      "indexdate" = "diagnosisdate"
    )
  )
)
