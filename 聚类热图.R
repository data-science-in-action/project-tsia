#热力
mydata<-read.csv( file.choose())
colnames(mydata) <- c( '亚洲', '欧洲','北美洲', '南美洲','大洋洲','非洲')
matrix <- cor (mydata[1:6])
library(pheatmap)
pheatmap(matrix)
library(pheatmap)
pheatmap(matrix,display_numbers=T)
pheatmap(matrix,display_numbers=T,color=colorRampPalette(rev(c("red","white","blue")))(102)) 



library(vegan)
library(permute)
library(gplots)
library(lattice)
setwd("C:/Users/nan/Desktop/疫情")
dataset <- read.table('热力聚类治愈.txt',header = TRUE, row.names = 1)
exp_ds = dataset[c(1:35),c(1:6)]

continent=c('亚洲', '欧洲','北美洲', '南美洲','大洋洲','非洲')
annotation_c <- data.frame(continent)
rownames(annotation_c) <- colnames(exp_ds)

pheatmap(exp_ds, #表达数据
         cluster_rows = T,#行聚类
         cluster_cols = T,#列聚类
         annotation_col =annotation_c, #样本分类数据
         annotation_legend=TRUE, # 显示样本分类
         show_rownames = T,# 显示行名
         show_colnames = T,# 显示列名
         scale = "row", #对行标准化
         color =colorRampPalette(c("#8854d0", "#ffffff","#fa8231"))(100) # 热图基准颜色
)

pheatmap(exp_ds, 
         show_rownames = T,
         show_colnames = T,
         scale = "row", 
         color =colorRampPalette(c("#8854d0", "#ffffff","pink"))(100),
         display_numbers = T, # 显示数值
         fontsize_number = 8, # 设置字体大小
         number_color = '#4a4a4a', #设置颜色
         number_format = '%.2f' # 设置显示格式
)
