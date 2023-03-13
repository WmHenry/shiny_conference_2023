#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#' @importFrom cohortBuilder bind_keys bind_key data_key
#' @noRd
app_server <- function(input, output, session) {
  data_source <- cohortBuilder::set_source(
    cohortBuilder::as.tblist(patients),
    binding_keys = data_relations,
    source_code = quote({
      library(dplyr)
      binding_keys <- cohortBuilder::bind_keys(
        cohortBuilder::bind_key(
          update = cohortBuilder::data_key("diagnoses", "patientid"),
          cohortBuilder::data_key("demographics", "patientid")
        ),
        cohortBuilder::bind_key(
          update = cohortBuilder::data_key("visits", "patientid"),
          cohortBuilder::data_key("diagnoses", "patientid")
        ),
        cohortBuilder::bind_key(
          update = cohortBuilder::data_key("therapies", "patientid"),
          cohortBuilder::data_key("visits", "patientid")
        )
      )
      source <- list(dtconn = cohortBuilder::as.tblist(patients))
    })
  )
  coh <- define_filters(data_source)
  shinyCohortBuilder::cb_server(
    "data", coh, run_button = "global", feedback = TRUE,
    include_methods = c(".pre_filtering", ".run_binding"),
    include_action = c("pre_filtering", "run_binding")
  )

  data_filtered <- eventReactive(input[["data-cb_data_updated"]], {
    coh$get_data(step_id = coh$last_step_id(), state = "post", collect = TRUE)
  })

  timelines_server(session, data_filtered)
}
