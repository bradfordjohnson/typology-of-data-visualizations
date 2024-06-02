library(here)
library(magick)

create_visualization_typology <- function(directory_list) {

  if (!is.list(directory_list)) {
    stop("directory_list must be a list")
  }

  combined_image_list <- list()

  for (directory in directory_list) {
    if (!dir.exists(file.path("typology-of-data-visualizations", directory))) {
      stop("Directory does not exist")
    }
    image_file_list <- list.files(
      file.path("typology-of-data-visualizations", directory),
      pattern = "png",
      recursive = TRUE,
      full.names = TRUE
    )
    directory_images <- lapply(image_file_list, magick::image_read)

    combined_image <- magick::image_append(
      image = magick::image_join(directory_images),
      stack = TRUE
    )

    combined_image_list[[length(combined_image_list) + 1]] <- combined_image
  }

  final_image <- magick::image_append(
    image = magick::image_join(combined_image_list),
    stack = FALSE
  )
  magick::image_write(
    final_image,
    path = file.path("typology-of-data-visualizations", "r_graph_typology.png"),
    format = "png"
  )
}

create_visualization_typology(list("line", "distribution", "bar", "point", "area"))
