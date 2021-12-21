## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(iglu)

## ----mage example, message = FALSE, warning=FALSE-----------------------------
# load package and example data
library(iglu)
# mage calculation using default parameters
mage(example_data_5_subject)
# Adjust default window sizes in mage calculation
mage(example_data_5_subject, short_ma = 3, long_ma = 30)

## ----figure 1, fig.height=5, fig.width=7--------------------------------------
# subset data to better see identified peaks and nadirs
fig1data <- example_data_1_subject[1:200, ]
# plot using mage function with plot = TRUE and show_ma = TRUE 
mage(fig1data, plot = TRUE, show_ma = TRUE, title = "Glucose Trace - Subject 1")

## ----figure 2, fig.width=7, fig.height=5--------------------------------------
# subset data to better show gaps
fig2data <- example_data_1_subject[200:400, ]
# plot using mage function with plot = TRUE
mage(fig2data, plot = TRUE, title = "Glucose Trace with Gaps - Subject 1")

## ---- echo=FALSE, fig.width=10, fig.height=7, out.width="700px", out.height ="400px"----
knitr::include_graphics("mage_figures/Figure3_heatmap_percent_error.png")

## ---- echo=FALSE, fig.width=10, fig.height=7, out.width="700px", out.height ="400px"----
knitr::include_graphics("mage_figures/Figure4_boxplots.png")

