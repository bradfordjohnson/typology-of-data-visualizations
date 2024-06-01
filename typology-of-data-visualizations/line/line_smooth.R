library(ggplot2)
library(dplyr)
library(httpgd)
library(sysfonts)
library(showtext)

showtext_auto()
font_add_google("Urbanist", family = "Urbanist")

font <- "Urbanist"
background_color <- "white"
plot_color <- "black"
line_color <- "#30394F"

x <- rnorm(100, 5, 2)
y <- rnorm(100, 5, 1.5)

data.frame(x = x, y = y) %>%
  ggplot(aes(x = x, y = y)) +
  geom_smooth(color = line_color, fill = "gray70", linewidth = .5) +
  scale_y_continuous(limits = c(0, 12), breaks = seq(0, 12, by = 2)) +
  scale_x_continuous(limits = c(0, 12), breaks = seq(0, 12, by = 2)) +
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
      size = .09,
      linetype = 3,
    ),
  )

ggsave(
  "typology-of-data-visualizations/line/line_smooth.png",
  width = 4,
  height = 4,
  units = "in",
  dpi = 300
)
