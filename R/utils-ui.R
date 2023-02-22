show_when_filters_ready <- function(item, ns) {
  shinyGizmo::conditionalJS(
    item,
    condition = paste0("$('#", ns, "cb_container .cb_step').length > 0"),
    jsCall = shinyGizmo::jsCalls$show()
  )
}

pin_controlbar <- function(controlbar, ...) {
  controlbar[[2]] <- controlbar[[2]] %>%
    shiny::tagAppendAttributes(`data-pin` = "pin")
  return(controlbar)
}

autodisable_js_call <- shinyGizmo::jsCalls$custom(
  false = htmlwidgets::JS(
    "$(this).removeClass('control-sidebar-slide-open'); $('#controlbar-toggle').addClass('disabled-link');"
  ),
  true = htmlwidgets::JS("openControlbar()")
)

autodisable_controlbar <- function(page_body) {
  if (page_body[[2]][[1]]$name == "body") {
    page_body[[2]][[1]] <- shinyGizmo::conditionalJS(
      page_body[[2]][[1]],
      condition = "input.sidebar != 'about'",
      jsCall = autodisable_js_call
    )
  }
  return(page_body)
}
