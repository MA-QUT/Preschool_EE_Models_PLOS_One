# Preschool energy expenditure prediction models for wrist and hip worn accelerometers

## Predict energy expenditure on new data
Free-living energy expenditure prediction models can be found in directory [models](https://github.com/MA-QUT/Preschool_EE_Models_PLOS_One/tree/master/models). The directory contains
machine learning models and sample data for a specific accelerometer placement. The directory also contains a Feature ID spreadsheet
describing the feature naming protocol used for the models and sample data.
All models provide energy expenditure predictions in 10 second windows.
The accompanying [R script](https://github.com/MA-QUT/Preschool_EE_Models_PLOS_One/blob/master/predict%20on%20new%20data.R) provides examples to implement each model.

## Manuscript data
The data used in the corresponding manuscript for the results of each model is found in directory [manuscript data](https://github.com/MA-QUT/Preschool_EE_Models_PLOS_One/tree/master/manuscript%20data)
The columns in the spreadsheets are organized as follows:  
A: subject ID  
B: root mean square error in kilocalories per minute  
C: root mean square error in METs  
D: mean absolute percent error  
E: mean bias  
F: mean percent bias  
G: model type  
  
acronyms:  
  fl: free-living  
  retrained: retrained free-living  
  lab: laboratory  
  rf: Random Forest  
  svm: Support Vector Machine  
  ann: Artificial Neural Network  
  
