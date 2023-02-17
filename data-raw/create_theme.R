unlink("inst/www/company.css")
fresh::create_theme(
  fresh::bs4dash_layout(
    main_bg = "#EAEAEA",
    control_sidebar_width = "300px"
  ),
  fresh::bs4dash_vars(
    body_color = "#3C4048", # default font color in app content
    body_overflow_y = "hidden",
    # navbar text colors
    navbar_light_color = "#fff",
    navbar_light_active_color = "#bec5cb",
    navbar_light_hover_color = "#bec5cb"
  ),
  fresh::bs4dash_status(
    primary = "#047378", # default sidebar item active background
    light = "#047378" # navbar background color
  ),
  fresh::bs4dash_sidebar_light(
    bg = "#035357", # sidebar background
    hover_bg = "#006368",  # sidebar item background on hover
    color = "#343a40",  # sidebar item text color
    hover_color = "#6c757d"  # sidebar item text color on hover
  ),
  output_file = "inst/www/company.css"
)
write(
  readLines("inst/www/custom_styles.css"),
  "inst/www/company.css",
  append = TRUE
)
