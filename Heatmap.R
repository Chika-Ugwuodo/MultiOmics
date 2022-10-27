data <- read.csv("C:/Users/cju1004/OneDrive - University of New Hampshire/Desktop/Proteomics Data Analysis/Input Data/HC_BF13_VS_BF20_heatmap.csv", row.names = "Protein")
data <- as.matrix(data)

library(RColorBrewer)
heatmap(data, Colv = NA, Rowv = NA, scale="column", col= colorRampPalette(brewer.pal(8, "Blues"))(50))
