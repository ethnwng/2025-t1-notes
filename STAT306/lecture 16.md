[[MATH360]]

##### Transformations
If your model is bad
- there is heteroscedasticity in the residuals
- cant find a linear relationship

you can perform *variance transformations* on the response variable. Common ones
$$
\begin{align}
Y^*  & = \sqrt{ Y } \\
Y^*  & = \log(Y)
\end{align}
$$
- $\log(Y)$ becomes unstable if $Y$ takes values close to $0$ so we prefer to use $\sqrt{ Y }$ more often.
- these transformations require that $Y>0$, you could use $sign(Y)\sqrt{ |Y| }$ for negative values

*how do we interpret*
- when we transform a variable, we need to inverse transform the confidence intervals for the expected response and the prediction intervals.

for $\log(Y)$ its not that bad since 
$$\text{if } PI(\log(Y), 95\%) = [I, K] \implies PI(Y, 95\%) = [e^I, e^K]$$
the coefficients are also interpreted on the new scale

##### Interaction terms with two numerical
before the interaction terms were with boolean covariates (sex, species, etc). 

And what happened was the depending on the level of the covariate you would get a line with different *slope and intercept*. You can also have interaction terms with two numerical values, let $X_{1},X_{2}$ be numerical covariates, then
$$
Y = \beta_{0} + \beta_{1}X_{1} +\beta_{2}X_{2} + \beta_{3}X_{1}X_{2}
$$
but since the variables are numerical the slopes for $X_{1}$ and $X_{2}$ is not always constant
$$
\begin{align}
Y = \beta_{0}+(\beta_{1}+\beta_{3}X_{2})X_{1} + \beta_{2}X_{2} \\ \\

Y = \beta_{0}+\beta_{1}X_{1} + (\beta_{2}+\beta_{3}X_{1})X_{2} 
\end{align}
$$
so how do we interpret? well 
$$
\begin{align}
\frac{\partial Y}{\partial x_{1}} = \beta_{1} + \beta_{3}x_{2} \\ \\

\frac{\partial Y}{\partial x_{2}} = \beta_{2} + \beta_{3}x_{1} 
\end{align}
$$

so the effect of $x_{1}$ or $x_{2}$ is different for different values of $x_{1}$ and $x_{2}$

##### Logistic Regression
The response variable $Y$ is now *binary*

*motivation ex:* if $Y$ is a binary response variable then
$$
Y = \beta_{0} + \beta_{1}x_{1} + \epsilon
$$
and
$$
E[Y|X=x] = \beta_{0}+\beta_{1}x
$$
but since $Y$ is
$$
Y = \begin{cases}
1 \text{ if } case \\
0 \text{ else}
\end{cases}
$$
then $Y$ is a bernoulli $p$ random variable, and $E[Y]$ for when $Y$ is bernoulli is $p$. thus
$$
\beta_{0}+\beta_{1}x_{i} = E[Y] = p_{i}
$$
but our line goes from $(-\infty, \infty)$ and $p_{i}$ is a probability which means it must range from $0$ to $1$ (probabilities are never greater than $1$ and are always positive)

so what we do instead is say that the line $\beta_{0}+\beta_{1}x_{i}$ models the log of $\frac{p_{i}}{1-p_{i}}$ or
$$
\beta_{0}+\beta_{1}x_{i} = \log\left( \frac{p_{i}}{1-p_{i}} \right)
$$
this log function is called the *log odds* or *logit*, this can be rewritten as
$$
\beta_{0}+\beta_{1}x_{i} = \log\left( \frac{p_{i}}{1-p_{i}} \right) \implies \frac{p_{i}}{1-p_{i}} = \exp(\beta_{0}+\beta_{1}x_{i})
$$
and now $\large\frac{p_{i}}{1-p_{i}}$ is called the *odds*. 
- odds close to zero are low chance of success and vice versa

we can further simplify the formula above to get
$$
p_{i} = \frac{e^{\beta_{0}+\beta_{1}x_{i}}}{1-e^{\beta_{0}+\beta_{1}x_{i}}}
$$
which kinda looks like
$$
f(x) = \frac{e^x}{1-e^{x}}
$$
these are called *logistic functions*, which are always between $0$ and $1$ and so now we can say that we are modelling the probability $p_{i}$ for $Y$

- to fit a logistic function we use the *method of maximum likelihood* not covered in the course but is the value $\mathbf{b}$ that minimizes
$$
\sum_{i=1}^N \log(1+e^{\mathbf{x_{i}^T \beta}}) - y_{i}\mathbf{x_{i}^T b}
$$
- requires a computer to do it

in `R` you call `glim(response ~ covariate, family = 'binomial', data=df` 

in general *logit* is hard to interpret, its the log of a ratio of the $p$ 