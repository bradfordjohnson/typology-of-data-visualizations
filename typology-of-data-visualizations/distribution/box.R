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

x <- rbinom(100, 12, .44)

ggplot(, aes(x = x)) +
  geom_boxplot(size = .25) +
  geom_jitter(size = .5, aes(y = 1)) +
  scale_x_continuous(limits = c(0, 10), breaks = seq(0, 10, by = 1)) +
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
    axis.line.x = element_line(size = .5),
    axis.text.x = element_text(
      size = 16,
      family = font,
      face = "bold",
      color = plot_color,
      margin = margin(2, 0, 0, 0, "mm")
    ),
    panel.grid.major.x = element_line(
      color = plot_color,
      size = .1,
      linetype = 3,
    ),
  )

ggsave(
  "typology-of-data-visualizations/distribution/box.png",
  width = 4,
  height = 4,
  units = "in",
  dpi = 300
)
