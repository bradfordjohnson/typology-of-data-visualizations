library(ggplot2)
library(dplyr)
library(httpgd)
library(sysfonts)
library(showtext)
library(ggbump)

showtext_auto()
font_add_google("Urbanist", family = "Urbanist")

font <- "Urbanist"
background_color <- "white"
plot_color <- "black"
category_colors <- c("#30394F", "#6ACEEB", "#E0B44E", "#A9336E")

category <- c(
  "A", "A", "A", "A",
  "B", "B", "B", "B",
  "C", "C", "C", "C",
  "D", "D", "D", "D"
)

x <- rep(2021:2024, 4)

rank <- c(
  1, 3, 2, 3,
  2, 1, 1, 1,
  3, 2, 4, 4,
  4, 4, 3, 2
)

data.frame(x = x, y = rank, category = category) %>%
  ggplot(aes(x = x, y = y, color = category)) +
  geom_bump(size = .75) +
  scale_color_manual(values = category_colors) +
  scale_y_continuous(
    limits = c(1, 4),
    breaks = seq(1, 4, by = 1)
  ) +
  scale_x_continuous(
    limits = c(2021, 2024),
    breaks = seq(2021, 2024, by = 1)
  ) +
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
    legend.position = "top",
    legend.direction = "horizontal",
  )

ggsave(
  "typology-of-data-visualizations/line/5_line_bump.png",
  width = 4,
  height = 4,
  units = "in",
  dpi = 300
)
