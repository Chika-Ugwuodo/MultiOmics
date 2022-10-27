data <- read.csv("C:/Users/cju1004/OneDrive - University of New Hampshire/Desktop/Metabolomics Data Analysis/Filters_Bar_Plots.csv")

library(ggplot2)
library(tidyverse)
library(grDevices)

BLUE <- "#076fa2"
RED <- "#E3120B"
BLACK <- "#202020"
GREY <- "grey50"

data$Metabolite <- factor(data$Metabolite, levels = data$Metabolite)

plt <- ggplot(data) +
  geom_col(aes(Metabolite, Mean_Filter_D19), fill = BLUE, width = 0.8)+
  geom_errorbar(aes(x=Metabolite, ymin=Mean_Filter_D19-Std_Filter_D19, ymax=Mean_Filter_D19+Std_Filter_D19), 
                width=0.4, colour=RED, alpha=0.9, size=1.3)+
  coord_flip()


plt

plt <- plt +
  scale_y_continuous(
    limits = c(0, 500),
    breaks = seq(0, 500, by = 100),
    expand = expansion(add=c(0, 10)), # The horizontal axis does not extend to either side
    )
plt


plt <- plt+
  scale_x_discrete(expand = expansion(add = c(0, 0.5)), limits=rev) +
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
  ylab("Concentration (uM)")+
  theme(axis.title.x = element_text(size=16))
