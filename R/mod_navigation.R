show_when_filters_ready <- function(item, ns) {
  shinyGizmo::conditionalJS(
    item,
    condition = paste0("$('#", ns, "cb_container .cb_step').length > 0"),
    jsCall = shinyGizmo::jsCalls$show()
  )
}

#' @noRd
undecorate_logo <- function(logo_brand) {
  logo_brand$children[[1]]$attribs$class <- "brand-image"
  return(logo_brand)
}
