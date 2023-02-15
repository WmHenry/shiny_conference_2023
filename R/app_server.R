#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#' @noRd
app_server <- function(input, output, session) {
  data_source <- cohortBuilder::set_source(
    cohortBuilder::as.tblist(patients)
  )
  coh <- define_filters(data_source)
  shinyCohortBuilder::cb_server("data", coh, run_button = TRUE, feedback = TRUE)

  data_filtered <- eventReactive(input[["data-cb_data_updated"]], {
    coh$get_data(step_id = coh$last_step_id(), state = "post", collect = TRUE)
  })

  timelines_server("glossary")
}
