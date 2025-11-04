[[STAT306]]

#### Confidence Intervals
*motivation:* Given a linear regression model $Y$, if someone was asking what is the *average* value for a specific value of $x$ or in other words $E[Y|x]$ which we call the *expected response*

we know that $\large\hat{Y}=x^T \hat{\beta}$

so we look solve for the sampling distribution of $Y|x$ 
$$
\begin{align}
E[x^T\hat{\beta}] = x^T\beta, \\
\end{align}
$$
and
$$
\begin{align}
Var[x^T\hat{\beta}]  & = x^T Cov(\hat{\beta}) x \\
 & = \sigma^{2}x^T(X^T X)^{-1} x
\end{align}
$$
then a confidence interval for the expected response is
$$
CI(E[Y|x], 1-\alpha) = x^T\hat{\beta} \pm t^*_{n-p-1} \cdot \sqrt{ \hat{\sigma}^{2} x^T(X^TX)^{-1}x }
$$

---
#### Prediction Interval
*motivation:* what if we have a *new* data point and we want to predict what the $Y$ will be. $x$ can be equal to another point in the dataset but the difference is we do not know its true $Y$ (?)

look at the error of the prediction we will make using $Y$
$$
Var(\hat{Y}_{new} -Y_{new}) = Var(\hat{Y}_{new}) + Var(Y_{new}) - 2Cov(\hat{Y}_{new}, Y_{new})
$$
- $Cov(\hat{Y}_{new}, Y_{new})=0$ because $\hat{Y}_{new}$ was trained using all the $x$ in the dataset but $x_{new}$ was not included in the dataset thus $Y_{new}$ is uncorrelated with the trained version.

therefore
$$
\large\begin{align}
Var(\hat{Y}_{new} -Y_{new})  & = Var(\hat{Y}_{new}) + Var(Y_{new}) - \cancel{2Cov(\hat{Y}_{new}, Y_{new})} \\
  & = Var(\hat{Y}_{new}) + Var(Y_{new}) \\
 &  = \sigma^{2}x_{new}^T(X^TX)^{-1}x_{new} + \sigma^{2} \\
 &  = \sigma^{2}(x_{new}^T (X^TX)^{-1}x_{new} + 1)
\end{align}
$$

---
#### Cook's Distance

measures how influential a point is to the line. But we do not just drop points that are influential we have to investigate or something

