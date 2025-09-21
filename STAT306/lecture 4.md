[[STAT306]]

review:
- inc. in sample size $n$ decreases the size of a 95% confidence interval
- confidence interval are for the *parameter* like population mean


last lecture we derived that
$$
\hat{\beta_{1}} \sim N\left( \beta_{1}, \frac{\sigma^{2}}{\sum_{i=1}^n (x_{i}-\bar{x})^2} \right) \quad \hat{\beta_{0}} \sim N\left( \beta_{0}, \sigma^{2}\left( \frac{1}{n}+\frac{\bar{x}^{2}}{\sum_{i=1}^n (x_{i}-\bar{x})^{2}} \right) \right)
$$

- but we do not know $\sigma^{2}$ so we will estimate it $\hat{\sigma}^{2}$

the estimator is given by the *residual mean square*
$$
\hat{\sigma}^{2} = \frac{\sum_{i=1}^n e_{i}^{2}}{n-2} = \frac{RSS}{n-2}
$$
- $n-2$ because we are losing *two degrees of freedom*, estimating $\beta_{1}$ and $\beta_{2}$ 
-> review what is $\sum_{i=1}^n (x_{i}-\bar{x})^2$

then we can find the *estimated standard errors* for the two estimators $\beta_{1},\beta_{2}$.
- anytime we see a $\sigma$ we use our $\hat{\sigma}$


review pt2:

**chi-square distribution**
given standard normal variables $Z_{i} \sim N(0,1)$ for $i=1,\dots,N$ which are independent, then
$$
Z_{1}^{2} + \dots + Z_{N}^{2} = \sum_{i=1}^n Z_{i}^{2} \sim \chi_{n}^{2}
$$the mean of a chi squared random variable is equal to its *degrees of freedom*

the **t distribution** is given $Z$ (defined above), $C \sim X_{d}^{2}$ then
$$
\frac{Z}{\sqrt{ \frac{C}{d} }} \sim t_{d}
$$
also using just as fact
$$
\frac{RSS}{\sigma^{2}} \sim \chi_{n-2}^{2}
$$
and is independent from $\beta_{0}$ and $\beta_{1}$

**common hypothesis test for** $\beta_{1}$
is to see if $\beta_{1}=0$ which means we are checking if the slope of the line is zero
- if it is not zero we know there *is some linear relationship between the two variables*

post lecture:
- the $t$-distribution relation of $\hat{\beta_{0}}, \hat{\beta_{1}}$ comes from the fact that if you take a standard normal variable $Z \sim N(0,1)$ divided by a Chi-squared then you have a $t$-distribution variable 
- the first step was normalizing $\hat{\beta_{1}}, \hat{\beta_{0}}$, then noticing that the denominator is just the estimated standard error, which is $\frac{RSS}{\hat{\sigma^{2}}}$ which simplifies further to get a chi-square on the bottom, and standard normal on the top
