library(ggplot2)
library(dplyr)
library(httpgd)
library(sysfonts)
library(showtext)

showtext_auto()
font_add_google("Urbanist", family = "Urbanist")

font <- "Urbanist"
background_color <- "white"
plot_color <- "gray10"

x <- rnorm(1000, 5, 1)

ggplot(, aes(x = x)) +
  geom_histogram(binwidth = .5, color = plot_color) +
  scale_y_continuous(limits = c(0, 250), breaks = seq(0, 250, by = 50)) +
  scale_x_continuous(limits = c(0, 10), breaks = seq(0, 10, by = 1)) +
  coord_cartesian(expand = FALSE) +
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
    panel.grid.major = element_line(
      color = plot_color,
      size = .1,
      linetype = 3,
    ),
  )

ggsave(
  "typology-of-data-visualizations/visuals/histogram.png",
  width = 4,
  height = 4,
  units = "in",
  dpi = 300
)
