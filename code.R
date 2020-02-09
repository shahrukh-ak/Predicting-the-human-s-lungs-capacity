model=lm(y~x1+x2+x3+x4+x5)
model

Call:
  lm(formula = y ~ x1 + x2 + x3 + x4 + x5)
Coefficients:
  (Intercept) x1 x2 x3 x4 x5
-7.81721 0.11927 -0.02463 0.16411


#Therefore the fitted model is:
#  Lung capacity = -7.81720523 + 0.11927217*height - 0.02462661*weight + 0.16411312*age +
#  0.07639732*barometric_pressure + 0.02021925*temperature


summary(model)$r.sq
[1] 0.87955

#The coefficient of determination is 0.87955

confint(model, level=0.9)
                  5 %       95 %
  (Intercept) -19.21319849 3.578788022
x1 0.05961491 0.178929419
x2 -0.04087617 -0.008377045
x3 0.05079086 0.277435371
x4 -0.22169633 0.374490963
x5 -0.01088270 0.051321200


#Therefore, 90% confidence intervals for 543210,,,,and
#are (-19.213, 3.579), (0.0596, 0.1789), (-0.0409, -0.0084), (0.0508, 0.2774), 
#(-0.2217, 0.3745) and (-0.0109,0.0513) respectively.


summary(model)
Call:
  lm(formula = y ~ x1 + x2 + x3 + x4 + x5)
Residuals:
  Min 1Q Median 3Q Max
-0.32133 -0.14651 -0.00255 0.14476 0.28185
Coefficients:
  Estimate Std. Error t value Pr(&gt;|t|)
(Intercept) -7.817205 6.287579 -1.243 0.24212
  x1 0.119272 0.032915 3.624 0.00466 **
  x2 -0.024627 0.008965 -2.747 0.02059 *
  x3 0.164113 0.062524 2.625 0.02539 *
  x4 0.076397 0.164469 0.465 0.65223
  x5 0.020219 0.017160 1.178 0.26597
---
#Signif. codes: 0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#Observe that the p-value for x1, x2 and x3 is less than 0.05. 
#This means height, weight, and age are significant variables at 0.05 
#level of significance.
    
    
library(car)
vif(model)


  x1        x2        x3      x4      x5
16.556835 28.582097 9.496716 1.999309 1.970648

#Note that three of the variance inflation factors 16.556835, 28.582097 and 9.496716 are fairly large
#indicating that the variance of the estimated coefficients of x1, x2 and x3 is inflated means these variables
#are correlated with at least one of the other predictors in the model.



predict(model, data.frame(x1 = 61, x2 = 105, x3 = 12, x4
                               = 30.1, x5 = 70))
1
2.556867
#Hence, the lung capacity for a 12-year-old who is 61 inches tall and weighs 105 
#pounds, at a pressure of 30.1 inches and a temperature of 70 degrees is 2.556867 liters.