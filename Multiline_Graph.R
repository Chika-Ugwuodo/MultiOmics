data <- read.csv("C:/Users/cju1004/OneDrive - University of New Hampshire/Desktop/Metabolomics Data Analysis/Metabolomics_Filters_Multi_Line_Plot.csv")

data$Sample = factor(data$Sample, levels = c("D19", "J20", "D20", "M21"),
                     labels = c("Dec-19", "July-20", "Dec-20", "May-21"))

plt <- ggplot(data, aes(Sample, Value, color = Group))+
  stat_summary(fun = mean,
               geom = "point",
               size = 4,
               alpha = 0.5)+
  stat_summary(fun = mean,
               geom = "line",
               aes(group = Group), size = 1.055,
               linetype = 4)+
  stat_summary(fun.data = mean_cl_boot,
               geom = "errorbar",
               width = .1,
               size =0.7)+
  xlab("")+
  ylab(expression("Concentration (" *mu * "M)"))

plt +
  theme(
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.background = element_blank(),
    axis.line = element_line(color = "black", size = 1),
    axis.title = element_text(size = 25, color = "black"),
    axis.text = element_text(size=20, color="black"),
    panel.border = element_rect(colour = "black", fill=NA, size=2),
    legend.key = element_rect(fill="white"),
    legend.title = element_blank(),
    legend.text = element_text(size=14)
  )

