# Start by making an "ordinary shelf life estimation" (osle).
res1 <-
  expirest_osle(data = exp1[exp1$Batch %in% c("b2", "b5", "b7"), ],
                response_vbl = "Potency", time_vbl = "Month",
                batch_vbl = "Batch", sl = 95, sl_sf = 3,
                srch_range = c(0, 500), sf_option = "loose")

# Pass the 'expirest_osle' object on to the plot_expirest_osle() function.
# This function does not produce any output. It returns a 'plot_expirest_osle'
# object that is essentially an 'expirest_osle' object augmented by a 'ggplot'
# object.
gg1 <- plot_expirest_osle(
  model = res1, response_vbl_unit = "%", x_range = NULL, y_range = c(93, 105),
  mtbs = "verified", plot_option = "full", ci_app = "line")
\dontrun{
  gg1

  # Since the element gg1$Graph is a 'ggplot' object it can be used for further
  # manipulation by aid of 'ggplot2' functions.
  if (requireNamespace("ggplot2")) {
    library(ggplot2)

    gg1$Graph + labs(title = "Ordinary Shelf Life Estimation (OSLE)",
                     x = "Time [months]", y = "Potency [% LC]") +
      scale_x_continuous(limits = c(-1, 31), breaks = seq(0, 30, 6))
  }
}

# Repeat this for a different intercept / different slope (dids) model.
res2 <-
  expirest_osle(data = exp1[exp1$Batch %in% c("b4", "b5", "b8"), ],
                response_vbl = "Potency", time_vbl = "Month",
                batch_vbl = "Batch", sl = 95, sl_sf = 3,
                srch_range = c(0, 500), sf_option = "loose")

gg2 <- plot_expirest_osle(
  model = res2, response_vbl_unit = "%", x_range = c(0, 43),
  y_range = c(83, 107), mtbs = "verified", plot_option = "full",
  ci_app = "ribbon")
\dontrun{
  gg2
}

# In case of different intercept / different slope models, individually fit
# linear models are shown by default, i.e. with the 'mtbs' parameter set
# as "verified". To get the different intercept / different slope model
# displayed where the mean square error is pooled across batches, i.e. the
# dids.pmse model, the 'mtbs' parameter has to be set accordingly.

gg3 <- plot_expirest_osle(
  model = res2, response_vbl_unit = "%", x_range = c(0, 43),
  y_range = c(83, 107), mtbs = "dids.pmse", plot_option = "full",
  ci_app = "ribbon")
\dontrun{
  gg3
}
