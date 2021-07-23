## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(iglu)

## ---- fig.width=10, fig.height=10, out.width="600px", out.height ="500px"-----
agp(example_data_1_subject)

## -----------------------------------------------------------------------------
episode_calculation(example_data_1_subject,lv2_hypo = 70, lv1_hypo = 120, lv2_hyper = 180, dur_length = 15)

## ---- fig.width=8, fig.height=4-----------------------------------------------
epicalc_profile(example_data_1_subject)

## ----fig.width=8, fig.height=4------------------------------------------------
epicalc_profile(example_data_1_subject, lv1_hypo=100, lv2_hypo=70, lv1_hyper=120, lv2_hyper=160, color_scheme="Color Scheme 1")

