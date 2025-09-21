[[STAT306]]

#### Confidence Intervals for Expected Response

*predictions* are just the outputs of 
$$
\hat{Y} = \hat{\beta_{0}} + \hat{\beta_{1}}x
$$
for $X=x_{new}$ we call $\hat{Y_{new}}$ the *expected response*. This is because SLR is always giving the **expected/average** value never an exact

What we can do is construct an *interval* for the *expected value* of $\hat{Y}$ given $X=x_{k}$.


Finding this interval starts with calculating the distribution of $\hat{Y}$

$E[\hat{Y}]$ is easy to calculate, $Var(\hat{Y})$ is a bit harder but we end up getting
$$
\hat{Y_{new}} \sim N\left( \beta_{0}+\beta_{1}x_{new}, \sigma^{2}\left( \frac{1}{n}+\left( \frac{x_{new}-\bar{x}}{\sum (x_{i}-\bar{x})} \right) \right) \right)
$$
Then we standardize
$$
T = \frac{\hat{Y_{new}} - E[\hat{Y_{new}}]}{\sqrt{ \hat{Var}(\hat{Y_{new}}) }} \sim t_{n-2}
$$
- which is the same thing as last lecture proof for $\beta_{1}$

then solve
$$
P(-t* \leq T \leq t*)
$$
to get the interval as
$$
\hat{Y_{new}} \pm t* \sqrt{\hat{Var}(\hat{Y}_{new}) }
$$


the main idea here is that we are trying to understand the interval of confidence for *predictions* of the model

so if we choose a value of $x$ far away from all of our data points or confidence *decreases* i.e. the range of possible values gets larger
- can also be seen in the math as if you increase the distance between $x_{new}$ and $\bar{x}$ the $Var(\hat{Y}_{new})$ increases therefore making the over all CI range

#### Prediction Intervals
- the main difference between this and the before is that we are *not talking about the expected value of $Y_{new}$* we want to look at the *exact* value

a prediction $\hat{y}_{i} =\hat{\beta}_{0}+\hat{\beta}_{1}x_{i}$ for a point $x_{i}$ is a **fitted value**

