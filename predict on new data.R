#' Make predictions on new data with the energy expenditure prediction models trained on free-living data
# install and load the following packages:
library(kernlab)
library(randomForest)
library(nnet)
library(RCurl)


# Sample Wrist dataset
wristdf<-fread(RCurl::getURLContent("https://raw.githubusercontent.com/MA-QUT/Preschool_EE_Models_PLOS_One/master/models/new_data%20wrist.csv"),
               data.table = F)

############### 1) svm wrist model
load(url("https://github.com/MA-QUT/Preschool_EE_Models_PLOS_One/raw/master/models/wrist_svm.RData"))

featurenames<-rownames(data.frame(wrist_svm$svmmodel@scaling$x.scale))

#Identify the features needed for the wrist SVM model from the dataset
test_wristsvm<-wristdf[,c(which(colnames(wristdf)%in%featurenames))]

#Normalize feature set values
test_wristsvm<-scale(test_wristsvm,center = wrist_svm$PreProcess_mean,scale = wrist_svm$PreProcess_std)

#Make predictions on new data
predict_wristsvm<-predict(wrist_svm$svmmodel,test_wristsvm)


############### 2) rf wrist model
load(url("https://github.com/MA-QUT/Preschool_EE_Models_PLOS_One/raw/master/models/wrist_rf.RData"))

featurenames<-wrist_rf$xNames

#Identify the features needed for the wrist RF model from the dataset
test_wristrf<-wristdf[,c(which(colnames(wristdf)%in%featurenames))]

predict_wristrf<-predict(wrist_rf,test_wristrf)
#################



# Samplehip dataset
hipdf<-fread(RCurl::getURLContent("https://raw.githubusercontent.com/MA-QUT/Preschool_EE_Models_PLOS_One/master/models/new_data%20hip.csv"),
               data.table = F)

############### 3) ann hip model
load(url("https://github.com/MA-QUT/Preschool_EE_Models_PLOS_One/raw/master/models/hip_ann.RData"))

featurenames<-hip_ann$coefnames

#Identify the features needed for the hip ANN model from the dataset
test_hipann<-hipdf[,c(which(colnames(hipdf)%in%featurenames))]

predict_hipann<-predict(hip_ann,test_hipann)


############### 4) rf hip model
load(url("https://github.com/MA-QUT/Preschool_EE_Models_PLOS_One/raw/master/models/hip_rf.RData"))

featurenames<-hip_rf$xNames

#Identify the features needed for the wrist RF model from the dataset
test_hiprf<-hipdf[,c(which(colnames(hipdf)%in%featurenames))]

predict_hiprf<-predict(hip_rf,test_hiprf)
#################


############## combine the observed and predicted kcals/min

kcals_min<-cbind(hipdf$kcal,
                      predict_wristsvm, predict_wristrf,
                      predict_hipann, predict_hiprf)
colnames(kcals_min)<-c("observed","wrist_svm","wrist_rf","hip_ann","hip_rf")


