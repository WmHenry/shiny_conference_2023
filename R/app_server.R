#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#' @importFrom cohortBuilder bind_keys bind_key data_key
#' @noRd
app_server <- function(input, output, session) {
  data_source <- cohortBuilder::set_source(
    cohortBuilder::as.tblist(patients),
    binding_keys = data_relations
  )
  coh <- define_filters(data_source)
  shinyCohortBuilder::cb_server("data", coh, run_button = TRUE, feedback = TRUE)

  data_filtered <- eventReactive(input[["data-cb_data_updated"]], {
    coh$get_data(step_id = coh$last_step_id(), state = "post", collect = TRUE)
  })

  timelines_server(session, data_filtered)
}
