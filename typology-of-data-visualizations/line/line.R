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

data.frame(x = 1:5, y = 1:5) %>%
  ggplot(aes(x = x, y = y)) +
  geom_line(linewidth = .55) +
  scale_y_continuous(
    expand = expansion(mult = c(0, 0)),
    limits = c(1, 5),
    breaks = seq(1, 5, by = 1)
  ) +
  scale_x_continuous(
    expand = expansion(mult = c(0, 0)),
    limits = c(1, 5),
    breaks = seq(1, 5, by = 1)
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
      size = .15,
      linetype = 3,
    ),
  )

ggsave(
  "typology-of-data-visualizations/line/1_line.png",
  width = 4,
  height = 4,
  units = "in",
  dpi = 300
)
