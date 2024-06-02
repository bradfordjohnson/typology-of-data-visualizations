library(ggplot2)
library(dplyr)
library(httpgd)
library(sysfonts)
library(showtext)
library(scales)

showtext_auto()
font_add_google("Urbanist", family = "Urbanist")

font <- "Urbanist"
background_color <- "white"
category_colors <- c("#30394F", "#6ACEEB", "#E0B44E", "#A9336E")

y <- runif(68, 10, 100)
x <- c(rep(0:16, 4))
category <- rep(c("a", "b", "c", "d"), 17)

data.frame(x = x, y = y, category = category) %>%
  group_by(x, category) %>%
  summarise(n = sum(y)) %>%
  mutate(percentage = n / sum(n)) %>%
  ggplot(aes(x = x, y = percentage)) +
  geom_area(alpha = .5, aes(color = category, fill = category)) +
  scale_y_continuous(
    expand = expansion(mult = c(0, 0)),
    limits = c(0, 1),
    breaks = seq(0, 1, by = .5),
    labels = percent_format()
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
  "typology-of-data-visualizations/area/3_area_stacked_proportional.png",
  width = 4,
  height = 4,
  units = "in",
  dpi = 300
)
