unlink("data/patients.rda")

library(magrittr)

simul_line_base <- function(n, line_base, ...) {
  linebase <- line_base[unique(sample(1:length(line_base), length(line_base), TRUE))]
  res <- paste0(linebase, collapse = ",")
  rep(res, n)
}

calc_startend_periods <- function(n, lastseen, linenumber) {
  max_end_date <- max(as.Date(lastseen))
  min_start_date <- max_end_date - sample(365:(5*365), 1)
  dates_sample <- sort(sample(seq(min_start_date, max_end_date, by = "day"), 2 * n))

  end_dates <- dates_sample[2*(1:n)]
  start_dates <- dates_sample[-2*(1:n)]

  return(paste0(start_dates, ",", end_dates))
}

gen_visit <- function(n, startend) {
  date_ranges <- as.Date(unlist(strsplit(startend, ",")))
  min_date <- min(date_ranges)
  max_date <- max(date_ranges)
  sample(seq(min_date, max_date, by = "day"), n, TRUE)
}

DataFakeR::set_faker_opts(
  opt_default_table = DataFakeR::opt_default_table(nrows = DataFakeR::nrows_simul_ratio(0.25, 10000))
)

sch <- DataFakeR::schema_source("data-raw/schema.yml")
set.seed(123)
sch <- DataFakeR::schema_simulate(sch)

patients <- list(
  demographics = DataFakeR::schema_get_table(sch, "demographics") %>%
    dplyr::select(-dplyr::starts_with("tmp")) %>%
    dplyr::mutate(random_date = lastseen - sample(365 * 1:5, 1)),
  diagnoses = DataFakeR::schema_get_table(sch, "diagnoses") %>%
    dplyr::select(-dplyr::starts_with("tmp")) %>% dplyr::distinct(),
  visits = DataFakeR::schema_get_table(sch, "visits") %>%
    dplyr::select(-dplyr::starts_with("tmp")),
  therapies = DataFakeR::schema_get_table(sch, "therapies") %>%
    dplyr::select(-dplyr::starts_with("tmp"))
)

usethis::use_data(patients, overwrite = TRUE)
