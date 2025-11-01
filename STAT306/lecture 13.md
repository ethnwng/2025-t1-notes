[[STAT306]]

#### Partial Correlation


#### Outliers
- points that are far away from other points
- have big impact on the fitted line

outliers can be on $Y$ or on $X$, or both
- meaning the value of the $X$ can be close to the other points but its $Y$ value is really far away
- or it can be both far from its $X$ values and its $Y$ values

*recall:*
that $\mathbf{P}$ is the projection matrix defined
$$
\mathbf{P} = \mathbf{X(X^T X)^{-1}X^T}
$$
and the residual $\mathbf{e}$ is
$$
\mathbf{e} = (\mathbf{I-P})\mathbf{Y}
$$
with $\mathbf{\hat{Y}} = \mathbf{PY}$

which means

$$
\begin{align}
\mathbf{Cov(e)} =(\mathbf{I-P})\mathbf{Cov(Y)}(\mathbf{I-P})^T = \sigma^{2}(\mathbf{I-P})
\end{align}
$$
meaning
$$
\begin{align}
 & Var(e_{i}) = \sigma^{2}(1-p_{ii}) \\
 & Cov(e_{i},e_{j}) = \sigma^{2}(0-p_{ij}) = -\sigma^{2}p_{ij}
\end{align}
$$
the thing to note is that the variances are *not constant*, this is because they all must sum to $1$ therefore there is a shifting relationship between them

**studentized residuals**
is a *residual* scaled by its std. deviation
$$
r_{i} = \frac{e_{i}}{\sqrt{ Var(e_{i}) }} = \frac{e_{i}}{\sqrt{ \hat{\sigma^{2}} (1-p_{i\ i}) }}
$$
a *rule of thumb*, something is an outlier if $|r_{i}| \geq 3$

- pretty much use on points to see if a point is an outlier or not

**leverage** 
- $p_{i\ i}$ is sort of the distance between $\mathbf{x_{i}}$ and $\bar{\mathbf{x}}$
- a larger $p_{i i }$ indicates that $\mathbf{x_{i}}$ is *far* from the mean $\mathbf{\bar{x}}$
we call $p_{ii}$ the *leverage* for the $ith$ case ($x_{i},y_{i}$)
- larger leverage means more *potential* to affect the line

something to do with variances but we have
$$
Var(e_{i}) = \sigma^{2}(1-p_{ii})
$$
- from lecture, $p_{ii}$ is always $\leq 1$ and $\geq0$
- as $p_{ii}$ gets larger, the variance of that specific residual goes to zero
what this means is if $p_{ii}$ is $1$ then the residual is zero and the line *must pass through* the point meaning the point has *infinite leverage*

**properties**
- average leverage is given by $\large \frac{p+1}{n}$
rule of thumb:
- if a point's leverage is higher than $\large \frac{2(p+1)}{n}$ then it is considered *high leverage*

*note:*
- for some reason *outliers on $Y$* tend to have higher leverage than outliers on $Y$
- everything here is *potential* and not a forsure reaction

**influential points**
- if we remove a point or add a point that causes changes to the fitted line then it is *influential*

we use *Cook's Distance* to check if a point is influential.
$$
D_{i} = \frac{1}{(p+1)^{2}\hat{\sigma^{2}}} \large \sum_{j=1}^n (\hat{y_{j}} - \hat{y_{j(i)}})^{2}
$$
the $\large \sum_{j=1}^n(\hat{y_{j}} - \hat{y_{j(i)}})^{2}$ is comparing the difference between the two lines, *one* with the point of interest included and the other without.
- the $\hat{y_{j(i)}}$ is the model that does not have the $ith$ observation (the point of interest)

can also write *Cook's Distance* using only leverage $p_{ii}$ instead of $\hat{y}$ (which requires us to fit models over and over)
$$
D_{i} = \frac{e_{i}^{2}}{(p+1)\hat{\sigma^{2}}}\left[ \frac{p_{ii}}{(1-p_{ii})^{2}} \right] 
$$
**what do we do with outliers?**
- we shouldnt just delete them if they are not errors
- make two models, one with the outliers and one without


### Multicollinearity
*motivation:* what happens if we have a simple model, and then decide to add a new covariate but that covariate is highly correlated to our first covariate?
$$
Y = \beta_{0}+\beta_{1}X_{1}+\epsilon \to Y = \beta_{0}+\beta_{1}X_{1} + \beta_{2}\left( \frac{X_{1}}{1000} \right)
$$
- say the case above comes from changing the units of $X_{1}$

the issue with this is you just end up getting infinite lines that look the same but formed differently.


$\star$ alot of this section talks about what happens when two covariates have perfect correlation $Cor(X_{1},X_{2})=1,-1$
- this causes instability in the $\beta$ estimates, 
**important for final**:
- even though the estimators $\mathbf{\hat{\beta}}$ become unstable when there is multicollinearity, the *line* itself is not

*motivating problem:* when we are interpreting linear models, we say *keep every other covariate constant and just change one of them*
- but this is an unrealistic scenario since what if the variables are highly correlated

**iclicker**
q: if you have a model with $X_{1}$ and $X_{2}$ if $RSS(X_{2})=400$ and $RSS(X_{1}|X_{2})=5$ how much does the model improve?
a: the *difference* in the $RSS$ of each model describes how much the model has improved by, so $400-5=395$ which is pretty similar to the original model $RSS$. Meaning the model has not improved that much given we include $X_{1}$.

q: does this mean $X_{1}$ and $X_{2}$ are collinear?
a: its an indicator of it as a *possibility* but we cannot conclude that it does. its equally possible that $X_{1}$ just has nothing to do with $Y$

**activity review**
- had 3 variables $X_{1},X_{2},X_{3}$, fitted *four* models
	- only using $X_{1}$
	- only using $X_{2}$
	- using $X_{1}$ and $X_{2}$
	- using $X_{1},X_{2},$ and $X_{3}$
for each model we are looking at the std. error and P-value
- Low P-value and std error are good things
- want the p-value for each coefficient to be lower than the significance level
	- if it is we can say that that *variable is significant* to the model

*results:*
the model which included all variables had increased the standard error in each learned coefficient $\beta_{i}$ and the P values all increased

**indicator of multicollinearity**
- when the p-values for each coefficient are not significant $\gg\alpha$ but the $R$ squared scores are very high.
	- this is saying that the *model is explaining alot but none of the coefficients are significant*

**how to detect collinearity**
- look at the correlation matrix of the covariates (easy to do (?))
	- but what if $X_{1}$ and $X_3$ dont have high correlation and $X_{2}$ and $X_{3}$ also dont have high correlation but $X_{3}=\alpha X_{1}+\delta X_{2}+\gamma$? then $X_{3}$ is highly correlated to the pair $X_{1}$ and $X_{2}$ but the matrix only compares pairwise
	- the above issue is the problem with using just the matrix

another method is using **VIF** the variance inflation factor quantifies how much the variance of an estimated regression coeff. is inflated by multicollinearity

how to calculate for a predictor $X_{k}$
- regress $X_{k}$ on all the other covariates
- obtain the $R^{2}$ of the model
- compute the $VIF$ 
$$
VIF(\hat{B_{k}}) = \frac{1}{1-R^{2}_{\large x_{k} \sim x_{-k}}}
$$
- the bottom $R^{2}$ term is the *r squared score when you use $X_{k}$ as the response variable and everything else as the covariates*
	- instead of regressing on $Y$ we do it on $X_{k}$

- its roughly the proportion of the new variance of the complex model over the variance of the simple version

the last bullet point pretty much is saying if you have a *full model* one that includes $X_{1}, X_{2}, X_{3},\dots$ and a *simple* model one that just includes one of the $X_{i}$'s you can get the $VIF$ by just taking the ratio of the standard error of the coefficients. so for the full model $\hat{B_{i}}^{full}$ and $\hat{B_{i}}^{simple}$
$$
\frac{Var(\hat{B_{i}}^{full})}{Var(\hat{B_{i}}^{simple})}
$$
the *rule of thumb* is that if $VIF$ is > 5 or 10 then you know its collinear.

*how do we deal with collinear variables once we have identified them?*
- drop them from the model 
- we do this because we have shown that the variable is not important to the model at all


