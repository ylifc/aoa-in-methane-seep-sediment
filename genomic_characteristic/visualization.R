setwd("C:/Users/Administrator/Desktop/AOA_dating/characteristic/Summary")
library("ggplot2")
wt <- read.table("Thaumarchaeota_genomic_characteristic_summary.txt",sep = "\t",header = T)
wt$Group <- factor(wt$Group, levels = c("Basal group", "Terrestrial group", 
                                        "Shallow water Part I", "Shallow water Part II", "Deep water group",
                                        "Methane group","Deep sea sediment group")) 
ggplot(wt,aes(x=factor(Group),y=C.ARSC))+geom_boxplot()+theme_classic()
ggplot(wt,aes(x=factor(Group),y=N.ARSC))+geom_boxplot()+theme_classic()
ggplot(wt,aes(x=factor(Group),y=GC...))+geom_boxplot()+theme_classic()
ggplot(wt,aes(x=factor(Group),y=coding.density))+geom_boxplot()+theme_classic()
ggplot(wt,aes(x=factor(Group),y=Pseudogenes...))+geom_boxplot()+theme_classic()