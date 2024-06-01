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
category_colors <- c("#6ACEEB", "#30394F")

data.frame(
  x = c("A", "A", "B", "B", "C", "C"),
  category = c("a", "b", "a", "b", "a", "b"),
  y = c(1, 2, 3, 4, 5, 6)
) %>%
  ggplot(aes(x = x, y = y, fill = category, color = category)) +
  geom_bar(stat = "identity", width = .5, position = "dodge") +
  scale_y_continuous(
    expand = expansion(mult = c(0, 0)),
    limits = c(0, 8),
    breaks = seq(0, 8, by = 2)
  ) +
  scale_fill_manual(values = category_colors) +
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
    panel.grid.major.y = element_line(
      color = plot_color,
      size = .10,
      linetype = 3,
    ),
  )

ggsave(
  "typology-of-data-visualizations/bar/3_bar_dodged.png",
  width = 4,
  height = 4,
  units = "in",
  dpi = 300
)

data.frame(
  x = c("A", "A", "B", "B", "C", "C"),
  category = c("a", "b", "a", "b", "a", "b"),
  y = c(1, 2, 3, 4, 5, 6)
) %>%
  ggplot(aes(x = x, y = y, fill = category, color = category)) +
  geom_bar(stat = "identity", width = .75, position = "dodge2") +
  scale_y_continuous(
    expand = expansion(mult = c(0, 0)),
    limits = c(0, 8),
    breaks = seq(0, 8, by = 2)
  ) +
  scale_fill_manual(values = category_colors) +
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
    panel.grid.major.y = element_line(
      color = plot_color,
      size = .10,
      linetype = 3,
    ),
  )

ggsave(
  "typology-of-data-visualizations/bar/4_bar_dodged.png",
  width = 4,
  height = 4,
  units = "in",
  dpi = 300
)
