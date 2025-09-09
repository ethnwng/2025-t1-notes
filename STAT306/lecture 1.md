[[STAT306]]



difference from 340 are using different models
- 340 - model for *predictions*
- 306 - model for *explanation*


### relationships of two variables 
a variable has a *deterministic relationship* if it directly tells you the value of another variable
- if you have the radius $r$ of a circle, you also have the area $A$

a variable has a *stochastic relationship* if the outcome is *uncertain* based on the input
- uncertainty caused by other unmeasured variables not being considered or externalities 
- ex: estimating the weight of two people based on their height

a way to handle the uncertainty of stochastic variables (in linear regression atleast) is to include a **random error term** $(\epsilon)$ 

ex:
$$
Weight = B_{0} + B_{1} \times Height+\epsilon
$$
- two people with the same height now might not have the same weight (which is what we want)

##### terminology
$Y$ is the *response variable*
- output variable
- dependent variable (unused)
$x/X$ is the *predictor variable*
- features
- input
- covariate
- regressor
- independent var.


### simple linear regression

all errors $\epsilon_{i}$ will have the *same variance*

