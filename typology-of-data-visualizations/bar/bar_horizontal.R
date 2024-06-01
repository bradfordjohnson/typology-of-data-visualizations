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

data.frame(
  x = c("A", "B", "C", "D", "E"),
  y = c(1, 2, 3, 4, 5)
) %>%
  ggplot(aes(x = x, y = y)) +
  geom_bar(stat = "identity", fill = plot_color) +
  scale_y_continuous(expand = expansion(mult = c(0, 0))) +
  coord_flip() +
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
    panel.grid.major.x = element_line(
      color = plot_color,
      size = .10,
      linetype = 3,
    ),
  )

ggsave(
  "typology-of-data-visualizations/bar/bar_horizontal.png",
  width = 4,
  height = 4,
  units = "in",
  dpi = 300
)
