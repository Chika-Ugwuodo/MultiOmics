data = read.csv("C:/Users/cju1004/OneDrive - University of New Hampshire/Desktop/Proteomics Data Analysis/Input Data/HC_Plank_24_Salinity_Effect_EutJ.csv")

data$Salinity <- as.factor(data$Salinity)
library(ggplot2)
library(hrbrthemes)
#install.packages("ggprism")
library(ggprism)
#install.packages("rstatix") #Install the rstatix library

library(rstatix) #This library makes it possible to compute anova and Tukey's posthoc
#test for pairwise comparison
stat.test <- aov(EutJ~Salinity, data=data) %>% #compute anova and feed into...
  tukey_hsd() #use output from above to compute tukey's posthoc paiwise test

stat.test[,'p.adj']=round(stat.test[,'p.adj'],3) #control the number of decimal places of pvalues in stat.test

p <- ggplot(data, aes(x=Salinity, y=EutJ), alpha=0.5)+
  geom_boxplot(width=0.2, aes(fill=Salinity))+
  geom_point(shape=16, size=4, alpha=1)+
  scale_fill_brewer(palette = "RdYlGn")+ #Spectral palette for 7% Salinity, no argument for mixed
  theme_classic()+
  ylab("Normalized abundance")+
  xlab("Salinity (%NaCl)")+
  theme(axis.text=element_text(size=30,face="bold"), axis.title=element_text(size=30),
        legend.position="none")+
  stat_boxplot(geom="errorbar", width=0.1)+
  stat_summary(fun=mean, geom="point", shape=18, size=4, color="deeppink4")
#stat_summary(fun=mean, geom="line", linetype="dashed", aes(group=1))
p

library(ggpubr)
p2 <- p + add_pvalue (stat.test, label = "p.adj", y.position = c(40, 47, 40), label.size=10)+
  stat_compare_means(method="anova", label.x=1, label.y=52, size=9, 
                     aes(label = sprintf("Anova, p = %5.3f", as.numeric(..p.format..))))

#p2 <- p + stat_compare_means(method="t.test", label.x=0.7, label.y = 33, size=10) #- for t-test
#use the stat_pvalue_manual function to add results from Tukey's test to the plot
#This doesn't work unless the fill argument is inside the geom_boxplot() function

p2

p2 + scale_y_continuous(limits=c(0, 55), breaks=seq(0,100,10))+
  theme(axis.ticks.length=unit(-0.15, "cm"))



