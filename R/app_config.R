#' Access files in the current app
#'
#' NOTE: If you manually change your package name in the DESCRIPTION,
#' don't forget to change it here too, and in the config file.
#' For a safer name change mechanism, use the `golem::set_golem_name()` function.
#'
#' @param ... character vectors, specifying subdirectory and file(s)
#' within your package. The default, none, returns the root of the app.
#'
#' @noRd
app_sys <- function(...) {
  system.file(..., package = "scdemo2023")
}

pin_controlbar <- function(controlbar, ...) {
  controlbar[[2]] <- controlbar[[2]] %>%
    shiny::tagAppendAttributes(`data-pin` = "pin")
  return(controlbar)
}
