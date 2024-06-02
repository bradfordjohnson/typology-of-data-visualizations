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

y <- rbinom(17, 20, .7)
x <- 0:16

data.frame(x = x, y = y) %>%
  ggplot(aes(x = x, y = y)) +
  geom_area(fill = plot_color, color = plot_color, alpha = .5) +
  scale_y_continuous(
    expand = expansion(mult = c(0, 0)),
    limits = c(0, 22),
    breaks = seq(0, 22, by = 2)
  ) +
  scale_x_continuous(
    expand = expansion(mult = c(0, 0)),
    limits = c(0, 16),
    breaks = seq(0, 16, by = 2)
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
  )

ggsave(
  "typology-of-data-visualizations/area/1_area.png",
  width = 4,
  height = 4,
  units = "in",
  dpi = 300
)
