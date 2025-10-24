[[STAT306]]

*review:*
- zagdat activity

simply we are redoing the entire MLR steps with a hypothesis test

#### Partial Quantities
*note:* not commonly used, good for model selection and hypothesis testing

*motivating question:*
given a SLR
$$
Y_{i} = \beta_{0}+\beta_{1}X_{i,1} + \epsilon_{i}
$$
if we bring in another variable, $X_{2}$ how can we measure the reduction in the unexplained variance

**recall:**
for an SLR $Y_{i}= \beta_{0}+\beta_{1}x_{i,1}+\epsilon_{i}$
$$
TSS = MSS + RSS
$$
where, $TSS$ is total sum of squares, $MSS$ is the model sum of squares, and $RSS$ is the residual sum of squares

if we have an MLR instead $Y_{i}= \beta_{0}+\beta_{1}x_{i,1}+\epsilon_{i} + \beta_{2}x_{i,2}$
$$
TSS = MSS_{2} + RSS_{2}
$$
**the total sum of squares is always the same** so
$$
MSS + RSS = MSS_{2} + RSS_{2}
$$
meaning: *when you add new covariates, the MSS and RSS values shift*

so the *answer to the motivating question is*
$$
RSS(Model_{1}) - RSS(Model_{2}) 
$$
explains the variance

*note:* 
- sometimes called *restricted* and *full* models 
- always compare the bigger minus smaller model (output will be positive)

the **coefficient of partial determination** is determined as
$$
\large R_{Y, X_{2};X_{1}}^2 =  \frac{MSS(X_{2}|X_{1})}{RSS(X_{1})} = \frac{RSS(X_{1})-RSS(X_{1},X_{2})}{RSS(X_{1})}
$$
it measures the proportion of reduction in unexplained variability of $Y$ gained by introducing another covariate $X_{2}$.

*note:*
$$
MSS(X_{2} | X_{1}) = MSS(X_{1},X_{2})-MSS(X_{1})
$$
