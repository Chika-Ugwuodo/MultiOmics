library(ggplot2)
library(ggrepel)
library(dplyr)

Data <- read.csv("C:/Users/cju1004/OneDrive - University of New Hampshire/Desktop/Lipidomics Data Analysis/Plots And Input Data/Neg Mode_HC_PEL_24h_S13_vs_S20_Volcano.csv")
Data$Significant <- "Not sig"
Data$Significant[Data$LogFoldChange > 1.5 & Data$pvalue < 0.05] <- "Up" #set rule for up - add new column 'Significant'
Data$Significant[Data$LogFoldChange < -1.5 & Data$pvalue < 0.05] <- "Down" #set rule for down
ggplot(Data, aes(x = LogFoldChange, y = -log10(pvalue)))+ #x and y values in ggplot function
  geom_point(aes(color = Significant), size=4) + #add points, color by significant, set size
  theme_bw(base_size = 12) + theme(legend.position = "bottom") + #define theme of black and white, set legend position
  scale_color_manual(values = c("red", "grey", "blue"))+ #manually define color code
  geom_text_repel(
    data = subset(Data, pvalue < 0.05),
    aes(label = LipidType),
    size = 5,
    box.padding = unit(1.3, "lines"),
    point.padding = unit(0.3, "lines"), max.overlaps = getOption("ggrepel.max.overlaps", default = 20),
  )+
  theme(axis.title = element_text(size=18), 
        axis.text = element_text(size=15, face = "bold"),
        legend.text = element_text(size=15),
        legend.title = element_blank())+
  xlab(bquote(Log[2](fold-change)))+ #
  ylab(bquote(-Log[10](italic(p)-value)))+
  geom_hline(yintercept=1.30103, linetype="dashed", 
             color = "red", size=1)+
  geom_vline(xintercept=1.5, linetype="dashed", 
             color = "red", size=1)+
  geom_vline(xintercept=-1.5, linetype="dashed", 
             color = "red", size=1)+
  ggtitle("Neg Mode \nH. congolense plank 24h S13 vs S20")+
  theme(plot.title=element_text(face="italic", size=15))

