
### Overview

This project uses K-Means-Clustering to cluster similar hieroglyphics characters. Principal components were generated, and the number of principal components that captures 95% of the variance in the data were used. The principal components were used to train the K-Means-Clustering model. The model was optimized by plotting the within cluster sum of squares of different cluster numbers.


### Data

The data set contains 4,411 hieroglyphs found in 10 different pictures derived from the book “The Pyramid of Unas” (Alexandre Piankoff, 1955). The dataset is compiled by Morris Franken, complementary to the paper titled “Automatic Egyptian Hieroglyph Recognition by Retrieving Images as Texts” (ACM Conference on Multimedia, 2013). The images were processed in a way such that it fits a 50x75 pixel dimension. Only a few of the 4,411 hieroglyphs were uploaded to this repository to not exceed the 100mb upload limit.

### Analysis

![My Image](/README_Images/cumsum_pcr)
