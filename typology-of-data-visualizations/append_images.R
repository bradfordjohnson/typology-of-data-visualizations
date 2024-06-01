library(here)
library(magick)

bars <- list.files(
  here("typology-of-data-visualizations", "bar"),
  pattern = "png",
  recursive = TRUE,
  full.names = TRUE
)

lines <- list.files(
  here("typology-of-data-visualizations", "line"),
  pattern = "png",
  recursive = TRUE,
  full.names = TRUE
)

dist <- list.files(
  here("typology-of-data-visualizations", "distribution"),
  pattern = "png",
  recursive = TRUE,
  full.names = TRUE
)

point <- list.files(
  here("typology-of-data-visualizations", "point"),
  pattern = "png",
  recursive = TRUE,
  full.names = TRUE
)

bars_img <- image_read(bars)
lines_img <- image_read(lines)
dist_img <- image_read(dist)
point_img <- image_read(point)

img1 <- image_append(bars_img, stack = FALSE)
img2 <- image_append(lines_img, stack = FALSE)
img3 <- image_append(dist_img, stack = FALSE)
img4 <- image_append(point_img, stack = FALSE)

appended_image <- image_append(c(img1, img2, img3, img4), stack = TRUE)

image_write(appended_image, path = here("typology-of-data-visualizations", "test.png"), format = "png")
