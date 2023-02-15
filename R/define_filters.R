#' Helper function for the server-side of the app. Defines filters for the app.
#'
#' @param data_source information about data source.
#'
define_filters <- function(data_source) {
  cohortBuilder::cohort(
    data_source,
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
      dataset = "visit",
      id = "indication",
      name = "Indication",
      variable = "indication",
      gui_input = "vs"
    ),
    cohortBuilder::filter(
      "discrete",
      dataset = "visit",
      id = "visittype",
      name = "Type of visit",
      variable = "visittype",
      gui_input = "vs"
    ),
    cohortBuilder::filter(
      "range",
      dataset = "line_of_therapy",
      id = "linenumber",
      name = "Treatment line",
      variable = "linenumber"
    )
  )
}
