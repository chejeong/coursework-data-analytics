install.packages("png")
install.packages("ggplot2")
install.packages("ggfortify")
install.packages("caret")
install.packages("dplyr")
library("png")
library("ggplot2")
library("ggfortify")
library("caret")
library("dplyr")


#=============QUESTION2==========
#reading in all the images as single dataframe

setwd("/Users/CheHoon/Desktop/SP2022/DA350/Lab3/Hieroglyphics_Images")
files = list.files()
hieroglyphs <- lapply(files, function(x) readPNG(x))
imagesdf <- data.frame(do.call(rbind, lapply(hieroglyphs, function(x) t(matrix(x)))))

#we export the dataframe as csv, to save computation time
write.csv(imagesdf, "/Users/CheHoon/Desktop/SP2022/DA350/Lab3/images.csv")

imagesdf <- read.csv("/Users/CheHoon/Desktop/SP2022/DA350/Lab3/images.csv")


View(hieroglyphs)

#=============QUESTION3==========

#we compress the data using PCA.
images.pca = prcomp(imagesdf[,], scale.=TRUE)

##Plotting proportion of variance explained
pca_var = images.pca$sdev^2
prop_varex <- pca_var/sum(pca_var) #Proportion of variance
plot(cumsum(prop_varex),type='b', main = "Cumulative Proportion of Variance") #Cumulative proportion of variance
cumsum(prop_varex)

#557 Number of Principal Components explains 95% of the variance in the data

#=============QUESTION4==========

clusterNum <- 200

clusterModels <- sapply(1:clusterNum, function(i) kmeans(images.pca$x[,1:557],i))
wcs <- sapply(1:clusterNum, function(i) sum(clusterModels[,i]$tot.withinss))

plot(1:clusterNum, wcs, type="b", xlab="Number of Clusters",
     ylab="Within Cluster Sum of Squares")


#=============QUESTION5==========

#Plot within-cluster distances as a function of cluster size
wss <- sapply(1:1000, function(k) kmeans(images.pca$x[,1:557], 25, nstart=1)$tot.withinss)
hist(wss, breaks = 50)


myCluster <- kmeans(images.pca$x[,1:557], 25, nstart=100)

#=============QUESTION6==========

finalCluster <- myCluster$cluster
setwd("/Users/CheHoon/Desktop/SP2022/DA350/Lab3/clusters")

for (k in 1:25) {
  dir.create(paste("Cluster", k, sep=""))  
}

for (i in 1:4410) {
  clusterNum = finalCluster[i]
  setwd(paste("/Users/CheHoon/Desktop/SP2022/DA350/Lab3/clusters/Cluster",clusterNum,sep = ""))
  writePNG(hieroglyphs[[i]], files[i])
}


#=============QUESTION7==========

setwd("/Users/CheHoon/Desktop/SP2022/DA350/Lab3/Predictions")
files_predict = list.files()
hieroglyphs_predict <- lapply(files_predict, function(x) readPNG(x))
predictions_df <- data.frame(do.call(rbind, lapply(hieroglyphs_predict, function(x) t(matrix(x)))))


predictCluster <- function(imagesCopy, predictions_df){
  
  predictionList <- numeric(nrow(predictions_df))
  imagesCopy$cluster <- myCluster$cluster
  imageCenter <- as.data.frame(imagesCopy %>% group_by(cluster) %>% summarise_all("mean"))
  imageCenter <- subset(imageCenter, select = -c(cluster))
  
  
  distanceList <- numeric(25)
  for (i in 1:10) {
    
    for (j in 1:25) {
      
      mySum = 0
      
      for (k in 1:3750) {
        
        mySum = mySum + (imageCenter[j,k]-predictions_df[i,k])^2
        
      }
      
      distanceList[j] = sqrt(mySum)
      
    }
    print(paste("Prediction image number : ", i, sep=""))
    minVal = min(distanceList)
    predictionCluster = which(distanceList == minVal)
    print(paste("Cluster : ", predictionCluster, sep=""))
    predictionList[i] = predictionCluster
  }
  
  return(predictionList)
  
}

answer <- predictCluster(imagesCopy, predictions_df)






