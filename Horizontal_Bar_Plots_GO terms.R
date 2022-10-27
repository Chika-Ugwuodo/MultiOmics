data <- read.csv("C:/Users/cju1004/OneDrive - University of New Hampshire/Desktop/Proteomics Data Analysis/Input Data/HC_Plank_24_S13_VS_S20_Upregul_GO.csv")

library(ggplot2)
library(tidyverse)

BLUE <- "#076fa2"
RED <- "#E3120B"
BLACK <- "#202020"
GREY <- "grey50"

data$Term <- factor(data$Term, levels = data$Term)

plt <- ggplot(data) +
  geom_col(aes(Logpvalue, Term), fill = BLUE, width = 0.4)
  

plt

plt <- plt + 
  scale_x_continuous(
    limits = c(0, 3),
    breaks = seq(0, 3, by = 1), 
    expand = expansion(add=c(0, 0.5)), # The horizontal axis does not extend to either side
    position = "top"  # Labels are located on the top
  )
plt


plt <- plt+
  scale_y_discrete(expand = expansion(add = c(0, 0.5)), limits=rev) +
  theme(
    # Set background color to white
    panel.background = element_rect(fill = "white"),
    # Set the color and the width of the grid lines for the horizontal axis
    panel.grid.major.x = element_line(color = "#A8BAC4", size = 0.3),
    # Remove tick marks by setting their length to 0
    axis.ticks.length = unit(0, "mm"),
    # Remove the title for both axes
    axis.title.y = element_blank(),
    # Only left line of the vertical axis is painted in black
    axis.line.y.left = element_line(color = "black"),
    # Remove labels from the vertical axis
    axis.text.y = element_text (size=16, color = "black"),
    # But customize labels for the horizontal axis
    axis.text.x = element_text(size = 16, color="black"))
  

plt +
  xlab(bquote(-Log[10](italic(p)-value)))+ 
  theme(axis.title.x = element_text(size=16))

