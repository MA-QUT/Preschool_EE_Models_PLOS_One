# Preschool energy expenditure prediction models for wrist and hip worn accelerometers

## Predict energy expenditure on new data
free-living energy expenditure prediction models can be found in directory models/. Each file contains a
machine learning model for a specific accelerometer placement.
All models provide energy expenditure predictions in 10 second windows.
R script "predict on new data" provides examples to implement each model

## Manuscript data
The data used in the accompanying manuscript for each model is found in directory figur1/
Columns are organized as follows: /newline
1) A: subject ID
2) B: root mean square error in kilocalories per minute
3) C: root mean square error in METs
D: mean absolute percent error  
E: observed energy expenditure  
F: mean bias
G: mean percent bias
F: model type
acronyms: 
  fl: free-living
