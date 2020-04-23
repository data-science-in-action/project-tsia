library(ggplot2)
library(RColorBrewer)
library(reshape2)

setwd("C:\\Users\\ASUS\\Desktop\\data")
mydata<-read.csv("累计确诊.csv",stringsAsFactors=FALSE)
mydata$Date<-as.Date(mydata$Date)

#堆积面积图
mydata<-melt(mydata,id="Date")
ggplot(mydata, aes(x =Date, y = value,fill=variable) )+
  geom_area(position="stack",alpha=1)+ 
  geom_line(position="stack",size=0.25,color="black")+
  scale_x_date(date_labels = "%Y",date_breaks = "2 year")+
  xlab("Date")+ 
  ylab("value")+
  theme( axis.title=element_text(size=10,face="plain",color="black"),
         axis.text = element_text(size=10,face="plain",color="black"),
         legend.position = "right",
         legend.background = element_blank()) 

#时间序列峰峦图
df<-read.csv("StreamGraph_Data.csv",header=TRUE)
x<-seq(1:nrow(df))
label<-letters[1:ncol(df)]#colnames(y2)<-
colnames(df)<-c(seq(1,ncol(df),1))

# base plot
dfData2<-as.data.frame(cbind(x,df))

Order<-sort(colSums(dfData2[,2:ncol(dfData2)]),index.return=TRUE,decreasing = TRUE) 
label2<-label[Order$ix]
mydata<-melt(dfData2,id="x")
#levels(mydata$variable)[as.integer( colnames(Order))]
mydata$variable <- factor(mydata$variable, levels = levels(mydata$variable)[Order$ix])

N<-ncol(df)
Step<-1500
mydata$offest<--as.numeric(mydata$variable)*Step# adapt the 0.2 value as you need

mydata$V1_density_offest<-mydata$value+mydata$offest


ggplot(mydata, aes(x, V1_density_offest, color=variable)) + 
  #geom_linerange(aes(x, ymin=offest,ymax=V1_density_offest, color==variable),size =1.5, alpha =1) 
  geom_ribbon(aes(x, ymin=offest,ymax=V1_density_offest, fill=variable),alpha=1,colour=NA)+
  geom_line(aes(group=variable),color="black")+
  scale_y_continuous(breaks=seq(-Step,-Step*N,-Step),labels=label2)+
  #scale_fill_manual(values =COLS)+
  xlab("Time")+
  ylab("Class")+
  theme_classic()+
  theme(
    panel.background=element_rect(fill="white",colour=NA),
    panel.grid.major.x = element_line(colour = "grey80",size=.25),
    panel.grid.major.y = element_line(colour = "grey60",size=.25),
    axis.line = element_blank(),
    text=element_text(size=15),
    plot.title=element_text(size=15,hjust=.5),#family="myfont",
    legend.position="none"
  )


