library(ggplot2)
library(dplyr)
library(httpgd)
library(sysfonts)
library(showtext)

showtext_auto()
font_add_google("Urbanist", family = "Urbanist")

font <- "Urbanist"
background_color <- "white"
category_colors <- c("#30394F", "#6ACEEB")

y <- c(rep(rbinom(17, 10, .88), 2))
x <- c(rep(0:16, 2))
category <- rep(c("a", "b"), 17)

data.frame(x = x, y = y) %>%
  ggplot(aes(x = x, y = y)) +
  geom_area(alpha = .5, aes(color = category, fill = category)) +
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
  scale_color_manual(values = category_colors) +
  scale_fill_manual(values = category_colors) +
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
  "typology-of-data-visualizations/area/2_area_stacked.png",
  width = 4,
  height = 4,
  units = "in",
  dpi = 300
)
