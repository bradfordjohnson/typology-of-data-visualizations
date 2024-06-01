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
category_colors <- c("#6ACEEB", "#30394F")

category <- c(rep("A", 24), rep("B", 24))
x <- rep(1:24, 2)
y <- c(rnorm(24, 5, .5), rnorm(24, 3, .5))

data.frame(x = x, y = y, category = category) %>%
  ggplot(aes(x = x, y = y, color = category)) +
  geom_line(linewidth = .4) +
  scale_color_manual(values = category_colors) +
  scale_y_continuous(
    expand = expansion(mult = c(0, 0)),
    limits = c(0, 8),
    breaks = seq(0, 8, by = 2)
  ) +
  scale_x_continuous(
    expand = expansion(mult = c(0, 0)),
    limits = c(0, 24),
    breaks = seq(0, 24, by = 4)
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
    legend.title = element_blank(),
    legend.text = element_text(
      size = 16,
      family = font,
      face = "bold",
      color = plot_color
    ),
    legend.position = "top",
    legend.direction = "horizontal",
    panel.grid.major = element_line(
      color = plot_color,
      size = .15,
      linetype = 3,
    ),
  )

ggsave(
  "typology-of-data-visualizations/line/3_line_grouped.png",
  width = 4,
  height = 4,
  units = "in",
  dpi = 300
)
