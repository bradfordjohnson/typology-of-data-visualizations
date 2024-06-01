library(ggplot)
library(magick)
library(patchwork)
library(dplyr)
library(stringr)

visuals <- list.files(
  "typology-of-data-visualizations",
  pattern = "png",
  recursive = TRUE,
  full.names = TRUE
)

str_extract(visuals, "(?<=/)[^/]+(?=/)")
