############
# MDS plot #
############
r<-read.csv('mds_genetic_distance.csv',head=T); row.names(r)<-as.character(r[,1]); r<-r[,-1]

dist<-dist(r) # here select simple euclidean distance

# MDS method
library(vegan)
mds<-metaMDS(dist,distance='euclidean')
x<-mds$points[,1]
y<-mds$points[,2]
plot(x,y,xlab="MDS1",ylab="MDS2",main=paste("MDS ",'stress=',signif(mds$stress,3),sep=''),type="n")
text(x,y,labels=row.names(r),cex=0.8)

############
# PCA plot #
############
r<-read.csv('pca_frequncies.csv',head=T)

pca<-r[,-1]

library(ggbiplot)
fit <- princomp(pca, cor=TRUE)
ggbiplot(fit, labels=r[,1], scale=0.01, labels.size=2)
