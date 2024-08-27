##################################################
## Project: Workshop Slide Images
## Script purpose: Create a logo for Designing Effective Visualizations
## Date: 2024-08-27
## Author: Peter Lawson
##################################################

library(ggplot2)
library(RColorBrewer)

## Import Roboto from Google fonts
sysfonts::font_add_google(name = "Roboto", family = "roboto")
showtext::showtext_auto()

dummy_data <- data.frame(
  values = c(250, 230, 130, 325),
  labels = factor(c("Designing", "Effective", "Data", "Visualizations"),
    levels = c("Designing", "Effective", "Data", "Visualizations")
  )
)

logo <- dummy_data |> ggplot(aes(
  x = values,
  y = labels
)) +
  geom_bar(aes(fill = labels),
    stat = "identity"
  ) +
  scale_fill_brewer(palette = "Dark2") +
  theme_classic() +
  theme(
    axis.title.x = element_blank(),
    axis.text.y = element_blank(),
    axis.text.x = element_text(size = 10),
    axis.title.y = element_blank(),
    axis.ticks = element_line(colour = "grey40", linewidth = 1.1),
    axis.line = element_line(color = "grey40", linewidth = 1.1),
    legend.position = "none"
  ) +
  xlim(0, 325) +
  scale_y_discrete(limits = rev) +
  geom_text(aes(label = labels),
    size = c(10, 10, 10, 10),
    hjust = c(1.1, 1.1, 1.1, 1),
    color = "white",
    family = "roboto",
    fontface = c("plain", "bold", "plain", "plain")
  )

png("./plots/effective-vis-logo.png", width = 3, height = 6, units = "in", res = 300)
print(logo)
dev.off()
