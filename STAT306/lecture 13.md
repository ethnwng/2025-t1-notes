[[STAT306]]

#### Partial Correlation


#### Outliers
- points that are far away from other points
- have big impact on the fitted line

outliers can be on $Y$ or on $X$, or both
- meaning the value of the $X$ can be close to the other points but its $Y$ value is really far away
- or it can be both far from its $X$ values and its $Y$ values

**studentized residuals**
is a *residual* scaled by its std. deviation
$$
r_{i} = \frac{e_{i}}{\sqrt{ Var(e_{i}) }} = \frac{e_{i}}{\sqrt{ \hat{\sigma^{2}} (1-p_{i\ i}) }}
$$
a *rule of thumb*, something is an outlier if $|r_{i}| \geq 3$

**leverage** 
$p_{i\ i}$ is sort of the distance between $\mathbf{x_{i}}$ and $\bar{\mathbf{x}}$

