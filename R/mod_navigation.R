show_when_filters_ready <- function(item, ns) {
  shinyGizmo::conditionalJS(
    item,
    condition = paste0("$('#", ns, "cb_container .cb_step').length > 0"),
    jsCall = shinyGizmo::jsCalls$show()
  )
}
