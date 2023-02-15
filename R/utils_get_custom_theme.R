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
get_custom_theme <- function(type = "bs4Dash-light-dark", font_family = "Source Sans Pro", ...) {

  output_theme <- ""

 if(type == "bs4Dash-light-dark"){
    output_theme <- fresh::create_theme(
      fresh::bs4dash_vars(
        body_color = "#3C4048",
        navbar_light_color = "#FFF",
        navbar_light_active_color = "#bec5cb",
        navbar_light_hover_color = "#bec5cb",
        navbar_dark_color = "#FFF",
        navbar_dark_active_color = "#bec5cb",
        navbar_dark_hover_color = "#bec5cb"
      ),
      fresh::bs4dash_status(primary = "#00848a",
                            info="#64aeff"),
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
      fresh::bs4dash_yiq(contrasted_threshold = 10, text_dark = "#FFF", text_light = "#272c30"),
      fresh::bs4dash_layout(
        main_bg = "#EAEAEA"),
      ...
    )

    output_theme <- paste(output_theme, ".skin-blue .main-header .navbar {background-color: #047378;}
                          .navbar-white {background-color: #047378;}
                          .navbar-gray-dark {background-color: #047378;}
                          .jumbotron {background: #ffffff8f;box-shadow: 0 0px 9px rgb(0 0 0 / 11%), 0 8px 12px rgb(0 0 0 / 8%) !important; border: 1px solid rgb(0 0 0 / 14%);}
                          .dark-mode .jumbotron {background-color: #373e44;box-shadow: 0 0px 9px rgb(0 0 0 / 18%), 0 8px 12px rgb(0 0 0 / 16%) !important;}
                          .navbar-nav .dark-theme-icon {color: #fff;}
                          .btn-light{color: #000000;} .btn-light:hover{color: #000000;}
                          .dropdown-item.active, .dropdown-item:active {background-color: #64aeff;}
                          .card.card-outline-tabs .card-header a:hover {border-top: 3px solid #047378;}
                          .dark-mode .card.card-outline-tabs .card-header a:hover {border-color: #00848a;background: #312d2d;color: #ffffff;}
                          ol, ul, dl {padding-inline-start: 40px;}
                          a {color: #1371d8;}
                          .brand-link {background-color: #00848a !important; padding-left: 15px;}
                          ")

    class(output_theme) <- c("css", "html", "character")
  }

  if(font_family %in% c("Source Sans Pro")){
    output_theme <- gsub("Source Sans Pro", font_family, output_theme)
    output_theme <- gsub("Helvetica Neue", font_family, output_theme)
  }

  output_theme
}

#' Use theme for shinydashboard/shinydashboardPlus projects. Wrapper for R fresh package
#'
#' @param theme A theme code
#'
#' @export
#'
#' @examples
#' RocheIdentity::use_theme(RocheIdentity::get_roche_theme(type = "blue", font_family = "RocheSans"))

use_theme <- function(theme) {
  fresh::use_theme(theme)
  }
