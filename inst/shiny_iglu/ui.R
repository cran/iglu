
#library(shiny)
#library(DT)

shinyUI(fluidPage(

  titlePanel("Shiny iglu"),

  tabsetPanel(
    tabPanel("Data", fluid = TRUE,
             sidebarLayout(
               sidebarPanel(selectInput("demodata", label = "Select Dataset",
                                        choices = c('', `User Datafile` = 'user_data',
                                                    `Example Data` = 'example_data')),
                            conditionalPanel(
                              condition = "input.demodata == 'user_data'",
                              fileInput("datafile", "Choose a CSV File",
                                        multiple =  FALSE,
                                        accept = ".csv"),
                              selectInput("datatype",
                                          "Choose what format this .csv file is in",
                                          c("Processed" = "processed",
                                            "Dexcom" = "Dexcom",
                                            "FreeStyle Libre" = "FreeStyle Libre",
                                            "FreeStyle Libre Pro" = "Libre Pro",
                                            "ASC" = "ASC",
                                            "iPro" = "iPro"),
                                          selected = "Processed"),
                              conditionalPanel(
                                condition = "input.datatype != 'processed'",
                                textInput("subjid", "Enter subject id", value = "default"),
                              ),
                              textInput('id', 'Enter column name corresponding to subject ID', value = 'id'),
                              textInput('time', 'Enter column name corresponding to timestamp', value = 'time'),
                              textInput('gl', 'Enter column name corresponding to glucose values', value = 'gl'),
                              downloadButton("downloaddata", "Download Data"),
                              selectInput('tz', 'Select corresponding time zone', choices = c(OlsonNames()),
                                          selected = "UTC")
                            ),
               ),
               mainPanel(DT::dataTableOutput("data"))
             )),
    #full metric name and function name are added in alphabetical order
    tabPanel("Metrics", fluid = TRUE,
             sidebarLayout(
               sidebarPanel(selectInput('metric', 'Choose Metric', choices = c(`Above Percent` = 'above_percent',
                                                                               `Active Percent` = 'active_percent',
                                                                               `ADRR` = 'adrr',
                                                                               `Area Under Curve` = 'auc',
                                                                               `Below Percent` = 'below_percent',
                                                                               `COGI` = 'cogi',
                                                                               `CONGA` = 'conga',
                                                                               `CV` = 'cv_glu',
                                                                               `CV Subtypes` = 'cv_measures',
                                                                               `eA1C` = 'ea1c',
                                                                               `Episode Calculation` = 'episode_calculation',
                                                                               `GMI` = 'gmi',
                                                                               `GRI` = 'gri',
                                                                               `GRADE` = 'grade',
                                                                               `GRADE Euglycemia` = 'grade_eugly',
                                                                               `GRADE Hyperglycemia` = 'grade_hyper',
                                                                               `GRADE Hypoglycemia` = 'grade_hypo',
                                                                               `Glucose Variability Percentage` = 'gvp',
                                                                               `High Blood Glucose Index` = 'hbgi',
                                                                               `Hyperglycemia Index` = 'hyper_index',
                                                                               `Hypoglycemia Index` = 'hypo_index',
                                                                               `Index of Glycemic Control` = 'igc',
                                                                               `In Range Percent` = 'in_range_percent',
                                                                               `Interquartile Range` = 'iqr_glu',
                                                                               `J Index` = 'j_index',
                                                                               `Low Blood Glucose Index` = 'lbgi',
                                                                               `M-Value` = 'm_value',
                                                                               `MAD` = 'mad_glu',
                                                                               `MAG` = 'mag',
                                                                               `MAGE` = 'mage',
                                                                               `Mean` = 'mean_glu',
                                                                               `Median` = 'median_glu',
                                                                               `MODD` = 'modd',
                                                                               `PGS` = 'pgs',
                                                                               `Quantiles` = 'quantile_glu',
                                                                               `Range` = 'range_glu',
                                                                               `Rate of Change (ROC)` = 'roc',
                                                                               `Standard Deviation` = 'sd_glu',
                                                                               `Standard Deviation Subtypes` = 'sd_measures',
                                                                               `Standard Deviation ROC` = 'sd_roc',
                                                                               `Summary Statistics` = 'summary_glu',
                                                                               `All Metrics` = 'all_metrics'
               )),
               uiOutput("select_parameter"),
               uiOutput("help_text"),
               uiOutput("select_second_parameter"),
               uiOutput("second_parameter_helptext"),
               uiOutput("select_third_parameter"),
               uiOutput("third_parameter_helptext"),
               uiOutput("select_fourth_parameter"),
               uiOutput("fourth_parameter_helptext"),
               uiOutput("select_fifth_parameter"),
               uiOutput("fifth_parameter_helptext"),
               checkboxInput("filter_sleep_wake", "Calculate metric for sleeping/waking hours?", value = FALSE, width = NULL),
               conditionalPanel(
                 condition = "input.filter_sleep_wake",
                 numericInput("sleep_start", "Sleep start time", 0, min = 0, max = 24),
                 numericInput("sleep_end", "Sleep end time", 6, min = 0, max = 24),
                 uiOutput("sleep_wake_help"),
                 selectInput("sleep_or_wake", "Calculate for sleep, wake, or both?", choices = c("Sleep" = "sleep", "Wake" = "wake", "Both" = "both"), selected = "Sleep"))
               ),
               mainPanel(DT::dataTableOutput("metric")))
    ),

    tabPanel("Plots", fluid = TRUE,
             sidebarLayout(
               sidebarPanel(
                 radioButtons("plottype",  "Plot Type",
                              choices = c(`Time Series` = 'tsplot',
                                          `Lasagna Plot (Multiple Subject)` = 'lasagnamulti',
                                          `Lasagna Plot (Single Subject)` = 'lasagnasingle',
                                          `Rate of Change (Time Series)` = 'plot_roc',
                                          `Rate of Change (Histogram)` = 'hist_roc',
                                          `Mean Amplitude of Glycemic Excursions (MAGE)` = 'mage'
                              )),
                 uiOutput("lasagna_sidebar"),
                 uiOutput("tsplot_sidebar"),
                 uiOutput("rocplots_sidebar"),
                 uiOutput("plot_mage"),
                 downloadButton(outputId = "pdfButton", label = "PDF"),
                 downloadButton(outputId = "pngButton", label = "PNG"),
                 downloadButton(outputId = "epsButton", label = "EPS")
               ),
               mainPanel(plotOutput("plot"))
             )),

    tabPanel("AGP", fluid = TRUE,
             sidebarLayout(
               sidebarPanel(
                 uiOutput("agp_subject"),
                 uiOutput("agp_subject_help_text"),
                 uiOutput("agp_span"),
                 downloadButton(outputId = "pdfAGP", label = "pdf"),
                 downloadButton(outputId = "pngAGP", label = "png"),
                 downloadButton(outputId = "epsAGP", label = "eps")
               ),
               mainPanel(
                 fluidRow(
                   column(6, wellPanel("Glucose Statistics")),
                   column(6, wellPanel("Time in Ranges"))),
                 fluidRow(
                   column(6, DT::dataTableOutput("agp_metrics")),
                   column(6, plotOutput("plot_ranges"))
                 ),
                 fluidRow(
                   column(12, wellPanel("Ambulatory Glucose Profile (AGP)"))
                 ),
                 fluidRow(
                   column(12,  plotOutput("plot_agp"))
                 ),
                 fluidRow(
                   column(12, wellPanel("Daily Glucose Profiles"))
                 ),
                 fluidRow(
                   column(12, plotOutput("plot_daily"))
                 )
               )
             )),
    tabPanel("Episode Calculation", fluid = TRUE,
             sidebarLayout(
               sidebarPanel(
                 uiOutput("episode_subject"),
                 numericInput(inputId = "lv1hyperThreshold", label = "\nEnter a value for HyperThreshold (level1)",
                              value = 180),
                 numericInput(inputId = "lv2hyperThreshold", label = "\nEnter a value for HyperThreshold (level2)",
                              value = 250),
                 numericInput(inputId = "lv1hypoThreshold", label = "\nEnter a value for HypoThreshold (level1)",
                              value = 70),
                 numericInput(inputId = "lv2hypoThreshold", label = "\nEnter a value for HypoThreshold (level2)",
                              value = 54),
                 numericInput(inputId = "DurationLength", label = "\nEnter a value for Duration Length",
                              value = 15),
                 downloadButton(outputId = "pdfEpisode", label = "pdf"),
                 downloadButton(outputId = "pngEpisode", label = "png"),
                 downloadButton(outputId = "epsEpisode", label = "eps")
               ),
               mainPanel(
                 fluidRow(
                   column(12, wellPanel("Episode Calculation Profile (ECP)"))
                 ),

                 fluidRow(
                   column(12, plotOutput("plot_episode_calculation"))
                 )
               )
             ))
  )


))
