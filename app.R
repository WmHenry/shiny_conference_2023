# Launch the ShinyApp

pkgload::load_all(export_all = FALSE, helpers = FALSE, attach_testthat = FALSE)

options("scb_render_all" = FALSE)
options("cb_active_filter" = FALSE)

scdemo2023::run_app()
