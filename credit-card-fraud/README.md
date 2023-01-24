# Credit Card Fraud Detection

### Overview

This project uses Neural Networks to detect credit card fraud. We explore different methods to handle class imbalance, because there are significantly more valid transactions than fraudulent ones - upsampling, downsampling, SMOTE, and ROSE. 

<br/>

### Data

|File Name|Description|
|--|--|
|creditcard.csv|dataset with 28 columns of Principal Components and binary variable indicating fraudulent transactions|


<br/>

### Files

|File Name|Description|
|--|--|
|Data|folder that contains datasets used in this project|
|credit-card-fraud.Rmd|R markdown file with code for project|

<br/>

### Analysis

The higher level overview of the code is as follows:

- Scale the dataset
- Perform train-test-split
- Build baseline neural network using `Keras` through `Tensorflow` with 1 hidden layer, 5 nodes, and linear activation functions
- Fix for class imbalance using upsampling, downsampling, ROSE, and SMOTE. 
- We explore various number and types of layers, nodes, and activation functions. We observe the performance of each.
- We answer hypothetical business questions using our best model.

<br/>

**Confusion Matrix**

*Baseline Model*
- 5 nodes
- 1 hidden layer
- linear activation function

|                   |Reference Negative|Reference Positive|
|-------------------|------------------|------------------|
|Prediction Negative|      198957      |         119      |
|Prediction Positive|        63        |         226      |

- Sensitivity : 0.655072        
- Specificity : 0.999683 

**Experimentation**

We experiment with different layers, sampling methods, nodes, activation functions. Results are shown below.
Detailed confusion matrix can be viewed through the code file.


| Model Description                  | Accuracy| Sensitivity| Specificity|
|------------------------------------|---------|------------|------------|
| three hidden layers, downsampling  |  0.9992 |   0.8928   |    0.9971  |
| three hidden layers, upsampling    |  0.9449 |   0.9100   |    0.9908  |
| three hidden layers, ROSE sampling |  0.9304 |   0.8666   |    0.9942  |
| three hidden layers, SMOTE sampling|  0.9119 |   0.9722   |    0.8517  |
| five hidden layers, downsampling   |   |      |      |
| five hidden layers, upsampling     |   |      |      |
| five hidden layers, ROSE sampling  |   |      |      |
| five hidden layers, SMOTE sampling |   |      |      |





<img src="README_Images/image.png" width = 600>




<br/>




### Acknowledgements

This lab was designed by Dr. Bonifonte of Denison University who has provided the necessary materials and data.
