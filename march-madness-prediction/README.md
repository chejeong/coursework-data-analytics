# March Madness Prediction

### Overview

This project predicts the NCAA Division 1 Basketball March Madness tournament using the Random Forest algorithm.

The 2003 - 2017 seasons will be used as training sets, 2018-2021 seasons (except 2020 covid break) for the testing set, and the 2022 season will be used to test the machine learning model. Details of the data are described below.

<br/>

### Data

|File Name|Description|
|--|--|
|MNCAATourneyDetailedResults.csv|file with outcome statistics for the March Madness games from 2003 to 2021 (except 2020)|
|MNCAATourneySeeds.csv|show how the tournament games are conducted|
|MNCAATourneySlots.csv|show how the tournament games are conducted|
|MRegularSeasonDetailedResults.csv|contains the game results and stats for main season games.|
|MTeams.csv||


<br/>

### Files

|File Name|Description|
|--|--|
|Data|folder that contains datasets used in this project|
|march-madness.Rmd|R markdown file that contains code|

<br/>

### Analysis

The higher level overview of the code is as follows:

- Find each team's average stats for each season, which will be used as predictors in our model
- Join average stat data with tournament outcome data
- Build a logsitic regression model for use as basline model for comparison
- Build a Decision Tree model and evaluate its performance
- Build a Random Forest model and evaluate its performance
- Score the prediction of Random Forest Model using the March Madness Bracket scoring system.

<br/>


<img src="README_Images/image.png" width = 600>


### Acknowledgements

This lab was designed by Dr. Bonifonte of Denison University who has provided the necessary materials and data.
