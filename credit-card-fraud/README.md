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


| Model Description                                                           | Accuracy| Sensitivity| Specificity|
|-----------------------------------------------------------------------------|---------|------------|------------|
| three hidden layers, 5-5-5 nodes, all linear, downsampling                  |  0.9992 |   0.8928   |    0.9971  |
| three hidden layers, 5-5-5 nodes, all linear, upsampling                    |  0.9449 |   0.9100   |    0.9908  |
| three hidden layers, 5-5-5 nodes, all linear, ROSE sampling                 |  0.9304 |   0.8666   |    0.9942  |
| three hidden layers, 5-5-5 nodes, all linear, SMOTE sampling                |  0.9119 |   0.9722   |    0.8517  |
| five hidden layers, 5-5-5-5-5 nodes, all linear, downsampling               |  0.9522 |   0.9043   |    1.0000  |
| five hidden layers, 5-5-5-5-5 nodes, all linear, upsampling                 |  0.9516 |   0.9128   |    0.9903  |
| five hidden layers, 5-5-5-5-5 nodes, all linear, ROSE sampling              |  0.9308 |   0.8668   |    0.9948  |
| five hidden layers, 5-5-5-5-5 nodes, all linear, SMOTE sampling             |  0.9103 |   0.9726   |    0.8481  |
| three hidden layers, 7-5-3 nodes, all linear, downsampling                  |  0.9478 |   0.8957   |    1.0000  |
| three hidden layers, 7-5-3 nodes, all linear, upsampling                    |  0.9514 |   0.9128   |    0.9900  |
| three hidden layers, 7-5-3 nodes, all linear, ROSE sampling                 |  0.9271 |   0.8589   |    0.9952  |
| three hidden layers, 7-5-3 nodes, all linear, SMOTE sampling                |  0.9108 |   0.9747   |    0.8470  |
| three hidden layers, 19-14-7 nodes, all linear, downsampling                |  0.9391 |   0.9159   |    0.9623  |
| three hidden layers, 19-14-7 nodes, all linear, upsampling                  |  0.9513 |   0.9129   |    0.9897  |
| three hidden layers, 19-14-7 nodes, all linear, ROSE sampling               |  0.9302 |   0.8650   |    0.9952  |
| three hidden layers, 19-14-7 nodes, all linear, SMOTE sampling              |  0.9061 |   0.9750   |    0.8373  |
| three hidden layers, 19-19-19 nodes, all linear, downsampling               |  0.9464 |   0.9217   |    0.9710  |
| three hidden layers, 19-19-19 nodes, all linear, upsampling                 |  0.9509 |   0.9102   |    0.9916  |
| three hidden layers, 19-19-19 nodes, all linear, ROSE sampling              |  0.9283 |   0.8617   |    0.9948  |
| three hidden layers, 19-19-19 nodes, all linear, SMOTE sampling             |  0.9064 |   0.9732   |    0.8398  |
| three hidden layers, 19-14-7 nodes, linear-softmax-relu, downsampling       |  0.9246 |   0.8609   |    0.9884  |
| three hidden layers, 19-14-7 nodes, linear-softmax-relu, upsampling         |  0.9964 |   0.9941   |    0.9987  |
| three hidden layers, 19-14-7 nodes, linear-softmax-relu, ROSE sampling      |  0.9937 |   0.9901   |    0.9974  |
| three hidden layers, 19-14-7 nodes, linear-softmax-relu, SMOTE sampling     |  0.9804 |   1.0000   |    0.9607  |
| three hidden layers, 19-14-7 nodes, tanh-softmax-relu, downsampling         |  0.8928 |   0.8203   |    0.9652  |
| three hidden layers, 19-14-7 nodes, tanh-softmax-relu, upsampling           |  0.9982 |   0.9971   |    0.9992  |
| three hidden layers, 19-14-7 nodes, tanh-softmax-relu, ROSE sampling        |  0.9928 |   0.9882   |    0.9974  |
| three hidden layers, 19-14-7 nodes, tanh-softmax-relu, SMOTE sampling       |  0.9833 |   1.0000   |    0.9667  |


**Observations**

The process of deciding the final model is as follows. The number of hidden layers was increased to 5 from 3, to observe if it creates significant increase in model performance. However, it did not result in a significant increase in accuracy or kappa value, so 3 hidden layers was chosen. The number of nodes in each hidden layer was then explored. The number of nodes in each layer was gradually increased to observe its effect. Specifically, from 5-5-5, the hidden layers combination explored were 7-5-3, 19-14-7, and 19-19-19. Although increasing the number of nodes generally increased performance, increasing to 19-19-19 did not improve the model, so 19-14-7 was chosen. Then the activation function was explored, in which the combination of linear-softmax-relu was used, which showed an improvement from the three linear layers. Then, the tanh-softmax-relu combination showed a slight increase, so it was used as the combination for the final model. Comparing the types of dataset, the modified dataset outperformed the unmodified dataset. Specifically, downscaling performed really well when experimenting with the 7-5-3-1 layer combination, and and 5 layers combination. However, the ROSE sampling performed most consistently well throughout the experimentation, so it was chosen for the final model.



**Final Model**

*Layers of 19(tanh)-14(softmax)-7(relu) with ROSE sampling.*

The accuracy is 0.9992, and the Kappa value is 0.7781. It means that 99.92% of the transactions’ outcomes are predicted accurately, and that the final model performs much better than when guessing at random (moderately similar to perfect model).

The sensitivity is 0.789116, and the specificity is 0.99959. In other words, given that the transaction is fraudulent, we predict the transaction correctly as fraudulent 78.9117 percent of the time (true positive rate). Moreover, given that the transaction is valid, we correctly predict it as valid 99.959 percent of the time (true negative rate)



**Optimum Cutoff**

We loop through different *delta* values to find the optimum cutoff. The optimum cutoff is: 0.9520256
Details of code is provided in the markdown file.



<br/>




### Acknowledgements

This lab was designed by Dr. Bonifonte of Denison University who has provided the necessary materials and data.
