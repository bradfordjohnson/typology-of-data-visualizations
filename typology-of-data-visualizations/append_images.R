library(here)
library(magick)

visuals <- list.files(
  here("typology-of-data-visualizations", "bar"),
  pattern = "png",
  recursive = TRUE,
  full.names = TRUE
)

images <- image_read(visuals)

appended_image <- image_append(images, stack = TRUE)

image_write(appended_image, path = "test.png", format = "png")
