Should I pretend to love, or just like, this wine from Portugal?
========================================================
author: Catherine Pargeter
date: September, 2014

Why Fake it?
========================================================

How many times have you been out with colleagues and "Know-it-All" Joe asks about your wine. "Can you taste the hints of Alaskan salmon with a touch of of parsnip?"  

Or you go to a wine tasting with a certain someone you want to impress and they ask "Well, which of the 37 wines that we tried today did you like the best?".

No body likes to look like a fool, so here is a way to fake your way through these awkward conversations.  

All you need is a quick chemical analysis of the wine, or use the information on the bottle along with the preset median values.  By putting those values into the tool, this will give you a prediction of whether the wine is terrible, medium, or the best wine you have ever drank!


How it works
========================================================
right: 68%
Using data from red and white wine from Portugal, the model takes the following characteristics into account:

  - fixed.acidity
  - volatile.acidity
  - citric.acid
  - residual.sugar
  - chlorides
  - free.sulfur.dioxide
  
  ***

Data from:  P. Cortez, A. Cerdeira, F. Almeida, T. Matos and J. Reis. Modeling wine preferences by data mining from physicochemical properties. In Decision Support Systems, Elsevier, 47(4):547-553, 2009. Via UCI Machine Learning Repository 
 - total.sulfur.dioxide
 - density
 - pH
 - sulphates
 - alcohol


Model Accuracy, Specificity and Sensitivity
========================================================
Red Wine
Accuracy: 0.8893528

```
       Sensitivity Specificity
Poor          0.00        1.00
Medium        0.96        0.45
Good          0.48        0.96
```

White Wine
Accuracy: 0.8679374

```
       Sensitivity Specificity
Poor          0.00        1.00
Medium        0.95        0.57
Good          0.58        0.95
```


========================================================

<h1> So try it out by clicking  <a href = "https://cpargeter.shinyapps.io/Project/">here</a> next time you need to impress</h1>