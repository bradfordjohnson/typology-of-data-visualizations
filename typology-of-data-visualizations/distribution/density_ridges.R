library(ggplot2)
library(dplyr)
library(httpgd)
library(sysfonts)
library(showtext)
library(ggridges)

showtext_auto()
font_add_google("Urbanist", family = "Urbanist")

font <- "Urbanist"
background_color <- "white"
plot_color <- "black"
category_colors <- c("#30394F", "#6ACEEB", "#E0B44E", "#A9336E")

category <- c(
  rep("A", 100),
  rep("B", 100),
  rep("C", 100),
  rep("D", 100)
)

x <- c(
  rnorm(100, 5, 1),
  rnorm(100, 6, 2),
  rnorm(100, 3, 1),
  rnorm(100, 8, 1)
)

data.frame(x = x, category = category) %>%
  ggplot(aes(x = x, y = category, fill = category)) +
  geom_density_ridges() +
  scale_fill_manual(values = category_colors) +
  scale_x_continuous(
    expand = c(0, 0),
    limits = c(0, 12),
    breaks = seq(0, 12, by = 2)
  ) +
  scale_y_discrete(expand = c(0, 0)) +
  coord_cartesian(clip = "off") +
  theme_ridges(grid = FALSE, center_axis_labels = TRUE) +
  theme_void() +
  theme(
    plot.background = element_rect(
      fill = background_color,
      color = background_color
    ),
    panel.background = element_rect(
      fill = background_color,
      color = background_color
    ),
    plot.margin = margin(1, 1, 1, 1, "cm"),
    axis.line = element_line(size = .5),
    axis.text.x = element_text(
      size = 16,
      family = font,
      face = "bold",
      color = plot_color,
      margin = margin(2, 0, 0, 0, "mm")
    ),
    axis.text.y = element_text(
      size = 16,
      family = font,
      face = "bold",
      color = plot_color,
      margin = margin(0, 2, 0, 0, "mm")
    ),
    legend.title = element_blank(),
    legend.text = element_text(
      size = 16,
      family = font,
      face = "bold",
      color = plot_color
    ),
  )

ggsave(
  "typology-of-data-visualizations/distribution/5_density_ridges.png",
  width = 4,
  height = 4,
  units = "in",
  dpi = 300
)
