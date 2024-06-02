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

y <- rnorm(50, 10, 4)

ggplot(, aes(x = 0, y = y)) +
  geom_violin(size = .4, width = .7) +
  xlim(-1, 1) +
  scale_y_continuous(limits = c(0, 20), breaks = seq(0, 20, by = 2)) +
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
    axis.line.y = element_line(size = .5),
    axis.text.y = element_text(
      size = 16,
      family = font,
      face = "bold",
      color = plot_color,
      margin = margin(0, 2, 0, 0, "mm")
    ),
  )

ggsave(
  "typology-of-data-visualizations/distribution/2_violin.png",
  width = 4,
  height = 4,
  units = "in",
  dpi = 300
)
