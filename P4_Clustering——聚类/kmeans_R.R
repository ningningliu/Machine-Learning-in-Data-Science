# K-Means Clustering

# import the mall dataset
dataset<- read.csv('Mall_Customers.csv')
X<- dataset[4:5]

# uing the elbow method to find the optimal number of clusters
set.seed(6)
wcss <- vector( ) # initialise empty vector
for (i in 1:10) 
  wcss[i]<-sum(kmeans(X,i)$withinss) # withiness gives vector of within-cluster sum of squares
plot(1:10, wcss, type ='b', main =paste('Cluster of clients'), xlab ='Number of clusters', ylab ='WCSS')

# applying k-means to the mall dataset
set.seed(29)
kmeans <- kmeans(X, 5, iter.max = 300, nstart = 10)

# visulising the clusters
library(cluster)
clusplot(X,
         kmeans$cluster,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels= 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Cluster of clients'),
         xlab= 'Annual Income',
         ylab = 'Spending Score (1-100)')











