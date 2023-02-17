#' Get custom CSS theme for shinydashboard/shinydashboardPlus projects
#'
#' @param type A type of theme to get. Available options: "shinydashboard-blue", "shinydashboard-blue-light", "bs4Dash-light-dark"
#' @param font_family Font family. Available options: "RocheSans", "RocheSansCondensed", "RocheSerif", "Source Sans Pro"
#' @param ... Arguments to be passed through to [fresh::create_theme()].
#'   These can be used to set the width, height, color, etc.
#' @return Code of custom CSS theme
#'
#' @export
#'
#' @examples
#' RocheIdentity::get_roche_theme()
#' RocheIdentity::get_roche_theme(type = "bs4Dash-light-dark", font_family = "Source Sans Pro")
get_custom_theme <- function() {

  output_theme <- fresh::create_theme(
    fresh::bs4dash_layout(
      main_bg = "#EAEAEA",
      control_sidebar_width = "350px"
    ),
    fresh::bs4dash_vars(
      body_color = "#3C4048",
      body_overflow_y = "hidden",
      navbar_light_color = "#FFF",
      navbar_light_active_color = "#bec5cb",
      navbar_light_hover_color = "#bec5cb",
      navbar_dark_color = "#FFF",
      navbar_dark_active_color = "#bec5cb",
      navbar_dark_hover_color = "#bec5cb"
    ),
    fresh::bs4dash_status(
      primary = "#00848a",
      info = "#64aeff"
    ),
    fresh::bs4dash_sidebar_light(
      bg = "#ffffff",
      color = "#000000",
      hover_color = "#000000"
    ),
    fresh::bs4dash_sidebar_dark(
      bg = "#035357",
      color = "#FFF",
      hover_color = "#FFF"
    ),
    fresh::bs4dash_yiq(contrasted_threshold = 10, text_dark = "#FFF", text_light = "#272c30")
  )

  theme_file <- includeCSS("inst/www/output_theme.css")
  output_theme <- paste(output_theme, theme_file)

  class(output_theme) <- c("css", "html", "character")
  output_theme <- gsub("Source Sans Pro", "Source Sans Pro", output_theme)

  output_theme
}
