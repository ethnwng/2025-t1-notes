[[STAT306]]

#### Count Data
The *response variable* represents a countable number

examples:
- number of awards earned by students (covariates: grade, average, class size)
- number of of attendees at an outdoor event (covariates: registration fees, weather, avg temp)

 one approach is that we could just do what we normally do and fit a line
 $$
Y_{i} = \beta_{0}+\beta_{1}x_{i}+\epsilon_{i}
$$
but then we are assuming
- $Y$ is a normally distributed r.v with mean $\beta_{0}+\beta_{1}\bar{x}$ and variance $\sigma^{2}$
- but our response variable is always $\geq 0$ and is countable where here we are saying $Y$ can be negative or some infinite number

the solution here is to instead assume that $Y$ follows a *poisson distribution*

*aside:* $Y \in \{ 0,1,2,\dots \}$ follows a poisson distribution with rate $\lambda >0$ if its pmf is 
$$
P(Y=y) = e^{-\lambda} \frac{\lambda^y}{y!}
$$
with the property
$$
E[Y] = Var(Y) = \lambda
$$
since our line models the expectation of $Y$ we have that
$$
E[Y |x_{i}] = \lambda_{i} = \beta_{0}+\beta_{1}x_{i}
$$
one problem with this is that $\lambda_{i}$ can be negative if we model it this way, so we instead say
$$
\log\lambda_{i} = \beta_{0}+\beta_{1}x_{i} \implies \lambda_{i} = e^{\beta_{0}+\beta_{1}x_{i}}
$$

**model fitting**
a fitted model optimizes the function
$$
\hat{\beta} = \text{ arg max} \sum_{i=1}^n y_{i}\beta^Tx_{i} - \exp(\beta^T x_{i})
$$
in $R$ we can just call `glm(y ~ x, family = 'poisson', data = data)` 

**interpretation**
just note that we are looking at things as *log rate* since we are modelling $\log\lambda$

we say for a new ship the expected number of incidents is $exp(\beta_0)$ is this sort of equivalent to saying that at the minimum we expect 5 incidents for every ship?


**Wald Test**
*motivaiton:* we want to understand how good our estimates are

for large $n$:
$$
W_{j}= \frac{\hat{\beta_{j}} - \beta_{j}}{\hat{SE}(\hat{\beta_{j}})} \sim N(0,1)
$$
and then the interval is always
$$
CI(\beta_{j}, 1-\alpha) = \hat{\beta_{j}} \pm z^*_{1-\frac{\alpha}{2}} \hat{SE}(\hat{\beta_{j}})
$$

and then we can use hypothesis testing

