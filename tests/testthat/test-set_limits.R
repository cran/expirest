context("Set limits")

test_that("set_limits_succeeds", {
  tmp1 <- set_limits(rl = 103, rl_sf = 5, sl = c(95, 105), sl_sf = c(3, 4),
                     sf_option = "loose", xform = c("no", "no"),
                     shift = c(0, 0), ivl_side = "upper")
  tmp2 <- set_limits(rl = 97, rl_sf = 4, sl = c(95, 105), sl_sf = c(3, 4),
                     sf_option = "loose", xform = c("no", "no"),
                     shift = c(0, 0), ivl_side = "lower")
  tmp3 <- set_limits(rl = NA, rl_sf = 4, sl = c(95, 105), sl_sf = c(3, 4),
                     sf_option = "loose", xform = c("no", "no"),
                     shift = c(0, 0), ivl_side = "lower")

  tmp4 <- set_limits(rl = seq(from = 0.52, to = 0.48, by = -0.01),
                     rl_sf = rep(2, 5), sl = c(0.1, 0.5), sl_sf = rep(1, 2),
                     sf_option = "loose", xform = c("no", "no"),
                     shift = c(0, 0), ivl_side = "upper")
  tmp5 <- set_limits(rl = seq(from = 0.52, to = 0.48, by = -0.01),
                     rl_sf = rep(2, 5), sl = c(0.1, 0.5), sl_sf = rep(2, 2),
                     sf_option = "loose", xform = c("no", "no"),
                     shift = c(0, 0), ivl_side = "both")
  tmp6 <- set_limits(rl = seq(from = 0.12, to = 0.08, by = -0.01),
                     rl_sf = rep(4, 5), sl = c(0.1, 0.5), sl_sf = rep(3, 2),
                     sf_option = "loose", xform = c("no", "no"),
                     shift = c(0, 0), ivl_side = "lower")

  tmp7 <- set_limits(rl = 103, rl_sf = 5, sl = c(95, 105), sl_sf = c(3, 4),
                     sf_option = "tight", xform = c("no", "no"),
                     shift = c(0, 0), ivl_side = "upper")
  tmp8 <- set_limits(rl = 103, rl_sf = 5, sl = c(95, 105), sl_sf = c(3, 4),
                     sf_option = "tight", xform = c("log", "log"),
                     shift = c(1, 1), ivl_side = "upper")
  tmp9 <- set_limits(rl = 103, rl_sf = 5, sl = c(95, 105), sl_sf = c(3, 4),
                     sf_option = "tight", xform = c("sqrt", "sqrt"),
                     shift = c(0, 0), ivl_side = "upper")
  tmp10 <- set_limits(rl = 103, rl_sf = 5, sl = c(95, 105), sl_sf = c(3, 4),
                      sf_option = "tight", xform = c("sq", "sq"),
                      shift = c(0, 0), ivl_side = "upper")

  # <-><-><-><->

  expect_equivalent(tmp1[["rl.sf"]], 5)
  expect_equivalent(tmp1[["sl.sf"]], c(3, 4))
  expect_equal(tmp1[["xform"]], c("no", "no"))
  expect_equal(tmp1[["shift"]], c(0, 0))
  expect_equal(tmp1[["rl.orig"]], 103)
  expect_equal(tmp1[["rl"]], 103.004)
  expect_equal(tmp1[["sl.orig"]], c(95, 105))
  expect_equal(tmp1[["sl"]], c(94.95, 105.04))
  expect_equal(tmp2[["rl.orig"]], 97)
  expect_equal(tmp2[["rl"]], 96.995)
  expect_equal(is.na(tmp3[["rl.orig"]]), TRUE)
  expect_equal(is.na(tmp3[["rl"]]), TRUE)
  expect_equal(is.na(tmp3[["rl.trfmd"]]), TRUE)

  expect_equal(tmp4[["rl"]], c(0.524, 0.514, 0.504, 0.494, 0.484))
  expect_equal(tmp4[["sl"]], c(0.05, 0.54))
  expect_equal(tmp5[["rl"]], c(0.52, 0.51, 0.50, 0.49, 0.48))
  expect_equal(tmp5[["sl"]], c(0.095, 0.504))
  expect_equal(tmp6[["rl"]], c(0.11995, 0.10995, 0.09995, 0.089995, 0.079995))
  expect_equal(tmp6[["sl"]], c(0.0995, 0.5004))

  expect_equal(tmp7[["rl.orig"]], 103)
  expect_equal(tmp7[["rl"]], 103)
  expect_equal(tmp7[["sl.orig"]], c(95, 105))
  expect_equal(tmp7[["sl"]], c(95, 105))
  expect_equal(tmp8[["rl.trfmd"]], log(103 + 1))
  expect_equal(tmp8[["sl.trfmd"]], c(log(95 + 1), log(105 + 1)))
  expect_equal(tmp9[["rl.trfmd"]], sqrt(103))
  expect_equal(tmp9[["sl.trfmd"]], c(sqrt(95), sqrt(105)))
  expect_equal(tmp10[["rl.trfmd"]], 103^2)
  expect_equal(tmp10[["sl.trfmd"]], c(95^2, 105^2))
})

test_that("set_limits_fails", {
  expect_error(
    set_limits(rl = "rl", rl_sf = 3, sl = c(95.0, 105.0), sl_sf = c(3, 3),
               sf_option = "loose", xform = c("no", "no"), shift = c(0, 0),
               ivl_side = "lower"),
    "rl must be a numeric")
  expect_error(
    set_limits(rl = 97.0, rl_sf = "3", sl = c(95.0, 105.0), sl_sf = c(3, 3),
               sf_option = "loose", xform = c("no", "no"), shift = c(0, 0),
               ivl_side = "lower"),
    "rl_sf must be a positive integer")
  expect_error(
    set_limits(rl = 97.0, rl_sf = -3, sl = c(95.0, 105.0), sl_sf = c(3, 3),
               sf_option = "loose", xform = c("no", "no"), shift = c(0, 0),
               ivl_side = "lower"),
    "rl_sf must be a positive integer")
  expect_error(
    set_limits(rl = 97.0, rl_sf = c(3, 3), sl = c(95.0, 105.0), sl_sf = c(3, 3),
               sf_option = "loose", xform = c("no", "no"), shift = c(0, 0),
               ivl_side = "lower"),
    "rl_sf must be a positive integer")
  expect_error(
    set_limits(rl = 97.0, rl_sf = 3.3, sl = c(95.0, 105.0), sl_sf = c(3, 3),
               sf_option = "loose", xform = c("no", "no"), shift = c(0, 0),
               ivl_side = "lower"),
    "rl_sf must be a positive integer")
  expect_error(
    set_limits(rl = 97.0, rl_sf = 3, sl = "sl", sl_sf = c(3, 3),
               sf_option = "loose", xform = c("no", "no"), shift = c(0, 0),
               ivl_side = "lower"),
    "sl must be a numeric")
  expect_error(
    set_limits(rl = 97.0, rl_sf = 3, sl = c(95.0, 97.0, 105.0), sl_sf = c(3, 3),
               sf_option = "loose", xform = c("no", "no"), shift = c(0, 0),
               ivl_side = "lower"),
    "sl must be a numeric value or vector of length 1 or 2")
  expect_error(
    set_limits(rl = 97.0, rl_sf = 3, sl = c(105.0, 95.0), sl_sf = c(3, 3),
               sf_option = "loose", xform = c("no", "no"), shift = c(0, 0),
               ivl_side = "lower"),
    "sl must be of the form")
  expect_error(
    set_limits(rl = 97.0, rl_sf = 3, sl = c(95.0, 105.0), sl_sf = "3",
               sf_option = "loose", xform = c("no", "no"),
               shift = c(0, 0), ivl_side = "lower"),
    "sl_sf must be a positive integer")
  expect_error(
    set_limits(rl = 97.0, rl_sf = 3, sl = c(95.0, 105.0), sl_sf = c(3, -3),
               sf_option = "loose", xform = c("no", "no"), shift = c(0, 0),
               ivl_side = "lower"),
    "sl_sf must be a positive integer")
  expect_error(
    set_limits(rl = 97.0, rl_sf = 3, sl = c(95.0, 105.0), sl_sf = 3,
               sf_option = "loose", xform = c("no", "no"), shift = c(0, 0),
               ivl_side = "lower"),
    "sl_sf must be a positive integer")
  expect_error(
    set_limits(rl = 97.0, rl_sf = 3, sl = c(95.0, 105.0), sl_sf = c(3.3, 3),
               sf_option = "loose", xform = c("no", "no"), shift = c(0, 0),
               ivl_side = "lower"),
    "sl_sf must be a positive integer")
  expect_error(
    set_limits(rl = 97.0, rl_sf = 3, sl = c(95.0, 105.0), sl_sf = c(3, 3),
               sf_option = "strict", xform = c("no", "no"), shift = c(0, 0),
               ivl_side = "lower"),
    "specify sf_option either as \"tight\" or \"loose\"")
  expect_error(
    set_limits(rl = 97.0, rl_sf = 3, sl = c(95.0, 105.0), sl_sf = c(3, 3),
               sf_option = "tight", xform = "no", shift = c(0, 0),
               ivl_side = "lower"),
    "specify xform appropriately")
  expect_error(
    set_limits(rl = 97.0, rl_sf = 3, sl = c(95.0, 105.0), sl_sf = c(3, 3),
               sf_option = "tight", xform = c("no", "yes"), shift = c(0, 0),
               ivl_side = "lower"),
    "specify xform appropriately")
  expect_error(
    set_limits(rl = 97.0, rl_sf = 3, sl = c(95.0, 105.0), sl_sf = c(3, 3),
               sf_option = "tight", xform = c("no", "no"), shift = "no",
               ivl_side = "lower"),
    "shift must be a numeric vector of length 2")
  expect_error(
    set_limits(rl = 97.0, rl_sf = 3, sl = c(95.0, 105.0), sl_sf = c(3, 3),
               sf_option = "tight", xform = c("no", "no"), shift = 1,
               ivl_side = "lower"),
    "shift must be a numeric vector of length 2")
  expect_error(
    set_limits(rl = 97.0, rl_sf = 3, sl = c(95.0, 105.0), sl_sf = c(3, 3),
               sf_option = "tight", xform = c("no", "no"), shift = c(0, 0),
               ivl_side = "middle"),
    "specify ivl_side either as \"lower\", \"upper\" or \"both\"")
  expect_error(
    set_limits(rl = 97.0, rl_sf = 3, sl = 95, sl_sf = 3,
               sf_option = "tight", xform = c("no", "no"), shift = c(0, 0),
               ivl_side = "both"),
    "Please provide a specification with two sides.")
})
