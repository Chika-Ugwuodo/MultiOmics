Data <- read.csv("C:/Users/cju1004/OneDrive - University of New Hampshire/Desktop/Lipidomics Data Analysis/Plots And Input Data/Lipidomics_Neg_Mode_Norm_HC_PCA -corrected.csv", row.names = 1)

Data.pca <- prcomp(Data[3:114], center = TRUE, scale. = TRUE)
summary(Data.pca)


library(devtools)
install_github("vqv/ggbiplot")

library(ggbiplot)
ggbiplot(Data.pca, labels=rownames(Data), var.axes = FALSE,
         obs.scale = 2, size = 15, ellipse = TRUE, circle = TRUE)+
  theme_minimal()

?ggbiplot

devtools::install_github("kassambara/factoextra")
library(factoextra)
groups <- as.factor(Data$Salinity[1:35])


fviz_pca_ind(Data.pca,
             col.ind = groups, # Color by the quality of representation
             title = "", habillage = groups,
             palette = 'uchicago',
             addEllipses = FALSE,
             labelsize = 4,
             repel = TRUE     # Avoid text overlapping
)+
  theme(legend.title=element_blank(), text = element_text(face="bold"))

# fviz_pca_var(Data.pca,
#              col.var = "contrib", # Color by contributions to the PC
#              gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
#              repel = TRUE     # Avoid text overlapping
# )
