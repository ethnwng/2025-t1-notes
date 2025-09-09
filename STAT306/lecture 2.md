[[STAT306]]
### Simple Linear Regression
The *means* of $Y$ is *linearly related* to $x$
- $Y$ is the response variable for some explanatory variable $x$
- We assume $x$ is fixed throughout 

The **model** that relates $X$ and $Y$ is the equation
$$
Y_{i} = \beta_{0} + \beta_{1}x_{i} + \epsilon_{i}
$$
where
- $Y_{i}$ is the response value for the $i$-th sample
- $x_{i}$ is the value of the explanatory variable for the $i$-th sample 
- $\beta_{0},\beta_{1}$ are parameters, $B_{0}$ is the intercept, $B_{1}$
- $\epsilon_{i}$ is the random error term

**more on error term**
$\epsilon_{i}$ is a *random variable* therefore it has
- a distribution
	- assumed to be normal
- a mean
	- assumed to be $0$ i.e $E[\epsilon_{i}] = 0$
- a variance
	- unknown and denoted $\sigma^{2}$ i.e $Var(\epsilon_{i}) =\sigma^{2}$

##### The output
The output of the model is a *probability distribution of the possible output values*

For the height ~ weight relationship model; for a person $1.63m$ tall, the output is the *probability of all weights for a person $1.63m$ tall*


##### Model as Conditional Expectation

In general:
$$
E[Y| X=x] = B_{0} + B_{1}x
$$
The regression line is just the conditional average of $Y$ for a given $X=x$
$$
Y_{i} = B_{0}+B_{1}x_{i}+\epsilon_{i}
$$

For each $x_{i}$ there is a $Y_{i}$ with a *probability distribution*, the **line** takes the **mean values** of each $Y_{i}$ 
![[Pasted image 20250908105820.png]]

##### Interpretation

$B_{1}$ is the *slope estimator*; it says an *increase* in 1 unit of $X$ is associated with an expected increase of $B_{1}$ units in $Y$
- but we cannot use this as *causation*

$B_{0}$ is the *intercept estimator*; it is the average value of $Y$ when $X=0$ 

##### Predictions
should make predictions *inside* the range of data trained

- sometimes the linear relationship only lasts ins in a certain range

when we get $\hat{\beta_{1}}$ and $\hat{\beta_{0}}$ (the estimators found using RSS) they become *statistics* therefore there is now
- sampling distributions
- 
