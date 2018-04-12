set.seed(26)
df=read.csv('Processed.csv')
require(caTools)
df$spl=sample.split(df,SplitRatio = 0.7)
train=subset(df,df$spl==T)
test=subset(df,df$spl==F)
train$spl=NULL
test$spl=NULL
train$Fall=NULL
test$Fall=NULL
trainX=subset(train,select = c('StandardTemperature','Humidity','Wind','Weekend','Spring','Summer','Winter'))
trainY=subset(train,select = c('Ticket1','Ticket2'))
testX=subset(test,select = c('StandardTemperature','Humidity','Wind','Weekend','Spring','Summer','Winter'))
testY=subset(test,select = c('Ticket1','Ticket2'))
library(MultivariateRandomForest)
n_tree=2
m_feature=5
min_leaf=5
trainXm=as.matrix(trainX)
trainX=matrix(trainXm,ncol=ncol(trainX),dimnames=NULL)
trainYm=as.matrix(trainY)
trainY=matrix(trainYm,ncol=ncol(trainY),dimnames=NULL)
testXm=as.matrix(testX)
testX=matrix(testXm,ncol=ncol(testX),dimnames=NULL)
testYm=as.matrix(testY)
testY=matrix(testYm,ncol=ncol(testY),dimnames=NULL)


#trainX=data.matrix(trainX,rownames.force = NA)
#trainY=data.matrix(trainY,rownames.force = NA)
#testX=data.matrix(testX,rownames.force = NA)
#testY=data.matrix(testY,rownames.force = NA)
prediction=build_forest_predict(trainX = trainX,
                                trainY = trainY,
                                n_tree = n_tree,
                                m_feature = m_feature,
                                min_leaf=min_leaf,
                                testX = testX)





library(MultivariateRandomForest)
#Input and Output Feature Matrix of random data (created using runif)
trainX11=matrix(runif(50*100),50,100)
trainY=matrix(runif(50*5),50,5)
n_tree=2
m_feature=5
min_leaf=5
testX=matrix(runif(10*100),10,100)
#Prediction size is 10 x 5, where 10 is the number
#of testing samples and 5 is the number of output features
Prediction=build_forest_predict(trainX, trainY, n_tree, m_feature, min_leaf, testX)
trainX11
