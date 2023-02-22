#' Helper function for the server-side of the app. Defines filters for the app.
#'
#' @param data_source information about data source.
#'
define_filters <- function(data_source) {
  cohortBuilder::cohort(
    data_source,
    cohortBuilder::filter(
      "discrete",
      dataset = "demographics",
      id = "gender",
      name = "Gender",
      variable = "gender"
    ),
    cohortBuilder::filter(
      "date_range",
      dataset = "demographics",
      id = "dateofdeath",
      name = "Date of death",
      variable = "dateofdeath"
    ),
    cohortBuilder::filter(
      "date_range",
      dataset = "demographics",
      id = "lastseen",
      name = "Date of last visit",
      variable = "lastseen"
    ),
    cohortBuilder::filter(
      "discrete",
      dataset = "visits",
      id = "diagnosis",
      name = "Diagnosis",
      variable = "diagnosis",
      gui_input = "vs"
    ),
    cohortBuilder::filter(
      "discrete",
      dataset = "visits",
      id = "visittype",
      name = "Type of visit",
      variable = "visittype",
      gui_input = "vs"
    ),
    cohortBuilder::filter(
      "range",
      dataset = "therapies",
      id = "linenumber",
      name = "Treatment line",
      variable = "linenumber"
    )
  )
}

data_relations <- bind_keys(
  bind_key(
    update = data_key("visits", "patientid"),
    data_key("demographics", "patientid")
  ),
  bind_key(
    update = data_key("diagnoses", "patientid"),
    data_key("demographics", "patientid")
  ),
  bind_key(
    update = data_key("therapies", "patientid"),
    data_key("demographics", "patientid")
  )
)
