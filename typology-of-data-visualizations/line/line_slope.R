library(ggplot2)
library(dplyr)
library(tidyr)
library(httpgd)
library(sysfonts)
library(showtext)

showtext_auto()
font_add_google("Urbanist", family = "Urbanist")

font <- "Urbanist"
background_color <- "white"
plot_color <- "black"
category_colors <- c("#6ACEEB", "#30394F", "#E0B44E", "#A9336E")

id <- c("A", "B", "C", "D")
before <- c(2, 3, 4, 1.5)
after <- c(3.5, 4.5, 3, 1.75)

data.frame(id, after, before) %>%
  pivot_longer(
    cols = c("after", "before"),
    names_to = "time",
    values_to = "value"
  ) %>%
  ggplot(aes(x = time, y = value, group = id, color = factor(id))) +
  geom_line(linewidth = .4) +
  geom_point() +
  scale_y_continuous(
    expand = expansion(mult = c(0, 0)),
    limits = c(0, 5),
    breaks = seq(0, 5, by = 1)
  ) +
  scale_x_discrete(limits = c("before", "after")) +
  scale_color_manual(values = category_colors) +
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
  )

ggsave(
  "typology-of-data-visualizations/line/4_line_slope.png",
  width = 4,
  height = 4,
  units = "in",
  dpi = 300
)
