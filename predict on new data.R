rm(list=ls())

#' Make predictions on new data
# install and load the following packages:
library(kernlab)
library(randomForest)
library(nnet)


# Wrist dataset
wristdf<-fread("C:/Users/mha88/Desktop/QUT/Completed Manuscripts/preschool EE/manuscript/Submission/resubmission 1/Github/new_data wrist.csv",
               data.table = F)

############### 1) svm wrist model
load("C:/Users/mha88/Desktop/QUT/Completed Manuscripts/preschool EE/manuscript/Submission/resubmission 1/Github/wrist_svm.RData")

a<-rownames(data.frame(wrist_svm$svmmodel@scaling$x.scale))

#Identify the features needed for the wrist SVM model from the dataset
test_wristsvm<-wristdf[,c(which(colnames(wristdf)%in%a))]

#Normalize feature set values
test_wristsvm<-scale(test_wristsvm,center = wrist_svm$PreProcess_mean,scale = wrist_svm$PreProcess_std)

#Make predictions on new data
predict_wristsvm<-predict(wrist_svm$svmmodel,test_wristsvm)


############### 2) rf wrist model
load("C:/Users/mha88/Desktop/QUT/Completed Manuscripts/preschool EE/manuscript/Submission/resubmission 1/Github/wrist_rf.RData")

a<-wrist_rf$xNames

#Identify the features needed for the wrist RF model from the dataset
test_wristrf<-wristdf[,c(which(colnames(wristdf)%in%a))]

predict_wristrf<-predict(wrist_rf,test_wristrf)
#################

# hip dataset
hipdf<-fread("C:/Users/mha88/Desktop/QUT/Completed Manuscripts/preschool EE/manuscript/Submission/resubmission 1/Github/new_data hip.csv",
               data.table = F)

############### 3) ann hip model
load("C:/Users/mha88/Desktop/QUT/Completed Manuscripts/preschool EE/manuscript/Submission/resubmission 1/Github/hip_ann.RData")
a<-hip_ann$coefnames

#Identify the features needed for the hip ANN model from the dataset
test_hipann<-hipdf[,c(which(colnames(hipdf)%in%a))]

predict_hipann<-predict(hip_ann,test_hipann)


############### 4) rf hip model
load("C:/Users/mha88/Desktop/QUT/Completed Manuscripts/preschool EE/manuscript/Submission/resubmission 1/Github/hip_rf.RData")

a<-hip_rf$xNames

#Identify the features needed for the wrist RF model from the dataset
test_hiprf<-hipdf[,c(which(colnames(hipdf)%in%a))]

predict_hiprf<-predict(hip_rf,test_hiprf)
#################


plot(NA,ylim=range(0,6),xlim=range(0,6),ylab="predicted",xlab="observed")

points(wristdf$kcal,predict_wristsvm,pch=15,col='orange')
points(wristdf$kcal,predict_wristrf,pch=15,col='blue')

points(hipdf$kcal,predict_hipann,pch=16,col='green')
points(hipdf$kcal,predict_hiprf,pch=16,col='red')

abline(0,1)



