library(ggplot2)
library(dplyr)
library(httpgd)
library(sysfonts)
library(showtext)
library(ggside)

showtext_auto()
font_add_google("Urbanist", family = "Urbanist")

font <- "Urbanist"
background_color <- "white"
plot_color <- "black"

category_colors <- c("#6ACEEB", "#30394F", "#E0B44E")

ggplot(iris, aes(Sepal.Width, Sepal.Length, fill = Species)) +
  geom_point(size = .50, aes(color = Species)) +
  geom_xsidedensity(alpha = .3, position = "stack") +
  geom_ysideboxplot(
    aes(x = Species),
    orientation = "x",
    alpha = .5,
    size = .3,
    width = 0.5
  ) +
  scale_ysidex_discrete(guide = guide_axis(angle = 90)) +
  scale_fill_manual(values = category_colors) +
  scale_color_manual(values = category_colors) +
  scale_y_continuous(limits = c(3, 8), breaks = seq(3, 8, by = 2)) +
  scale_x_continuous(limits = c(1, 5), breaks = seq(1, 5, by = 1)) +
  coord_cartesian(expand = FALSE) +
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
    legend.position="none",
    ggside.panel.scale = .3,
    ggside.panel.border = element_blank(),
    ggside.panel.grid = element_blank(),
    ggside.panel.background = element_blank()
  )

ggsave(
  "typology-of-data-visualizations/point/3_scatter_side_density.png",
  width = 4,
  height = 4,
  units = "in",
  dpi = 300
)
