[[STAT306]]

##### Intervals for MLR

*Motivation:*
- similar to SLR we have to *estimate* our $\beta_{i}$ because it is impossible to find the exact value
- so we have $\hat{\beta_{i}}$ which changes based on the *sample*
- thus we have to figure out the *sampling distribution*

*pre-info:*
a *random vector* is a vector of the form
$$
\mathbf{y} = \begin{bmatrix}
y_{1} \\
y_{2} \\
\vdots \\
y_{n}
\end{bmatrix}
$$
where each $y_{1},y_{2},\dots,y_{n}$ are random variables. The expected value of the vector is given by
$$
E[\mathbf{y}] = \begin{bmatrix}
E[y_{1}] \\
E[y_{2}] \\
\vdots \\
E[y_{n}]
\end{bmatrix}
$$
the covariance matrix $\Sigma_{\mathbf{Y}}$ is calculated by
$$
\Sigma_{\mathbf{Y}} = \begin{bmatrix}
Cov(y_{1},y_{1})  & Cov(y_{1},y_{2}) & \dots &  Cov(y_{1}, y_{n}) \\ 
Cov(y_{2},y_{1})  & Cov(y_{2},y_{2}) & \dots &  Cov(y_{2}, y_{n}) \\

\vdots & \vdots & \ddots & \vdots \\
Cov(y_{n}, y_{1}) &  Cov(y_{n},y_{2}) & \dots & Cov(y_{n},y_{n})
\end{bmatrix}
$$
where along the diagonal $Cov(y_{i},y_{i})= Var(y_{i})$

*some properties of the covariance matrix* $\Sigma$
- always symmetric
- always positive semi definite $\mathbf{x}^T \Sigma \mathbf{x} >0$ for any vector $\mathbf{x}$
- if the components of the random vector are independent then $\Sigma$ is a diagonal matrix
- if $\mathbf{A}$ is a constant matrix and $\mathbf{Y}$ is a random vector then 
$$
Cov(\mathbf{AY}) = \mathbf{A}\Sigma_{\mathbf{Y}}\mathbf{A}^T
$$
and
$$
Var(\mathbf{A+Y}) = Var(\mathbf{Y}) = \Sigma_{\mathbf{Y}}
$$

so what are we doing here:

we are looking at the *sampling distribution* of the things that change for our model.

Start with $\epsilon$.

$$
E[\vec{\epsilon}] = \begin{bmatrix}
E[e_{1}] \\ 
E[e_{2}] \\
\vdots \\
E[e_{n}]
\end{bmatrix} = \begin{bmatrix}
0 \\
0 \\
\vdots \\
0
\end{bmatrix} = \mathbf{0}
$$
$$
\begin{align}
Var(\vec{e}) = \Sigma_{\vec{\epsilon}}  & = \begin{bmatrix}
Cov(\epsilon_{1},\epsilon_{1})  & Cov(\epsilon_{1}, \epsilon_{2})  & \dots & Cov(\epsilon_{1}, \epsilon_{n}) \\
Cov(\epsilon_{2}, \epsilon_{1}) & Cov(\epsilon_{2},\epsilon_{2})  & \dots & Cov(\epsilon_{2},\epsilon_{n}) \\
\vdots & \vdots & \ddots & \vdots \\
Cov(\epsilon_{n},\epsilon_{1})  & Cov(\epsilon_{n},\epsilon_{2})  &  \dots  &  Cov(\epsilon_{n}, \epsilon_{n})
\end{bmatrix}  \\ \\

 & = \begin{bmatrix}
Var(\mathbf\epsilon_{1})  & 0 & \dots & 0 \\
0 & Var(\epsilon_{2}) & \dots & 0 \\
\vdots & \vdots & \ddots & \vdots \\
0 & 0 & \dots & Var(\epsilon_{n})
\end{bmatrix} \to Cov(\epsilon_{i}, \epsilon_{j}) = 0, \text{ for } i\neq j \text{ and } Cov(\epsilon_{i}, \epsilon_{i}) = Var(\epsilon_{i}) \\ \\
 & = \begin{bmatrix}
\sigma^{2} & 0 & 0 & \dots & 0 \\
 0 & \sigma^{2} & 0 & \dots & 0 \\
\vdots & \vdots & \vdots & \ddots & \vdots \\
0 & 0 & 0 & \dots & \sigma^{2}
\end{bmatrix} = \sigma^{2} \mathbf{I}_{n}
\end{align}
$$

Now lets do the same thing for the estimator $\underline{\hat{\beta}}$ (vector)

$$
E[\underline{\hat{\beta}}] = E[(\mathbf{X^T X})^{-1} \mathbf{X^T Y}]
$$
now the design matrices consist of all constants therefore we can just take them out.
$$
\begin{align}
 & = (\mathbf{X^T X})^{-1} \mathbf{X^T} E[\mathbf{Y}]  \\
 & = (\mathbf{X^T X})^{-1} \mathbf{X^T X} \vec{\beta} \leftarrow \text{ from } E[\mathbf{Y}] = \mathbf{X} \vec{\beta} \\
 & E[\underline{\hat{\beta}}]=\vec{\beta}
\end{align}
$$
- exactly like in SLR, the expected value of the *guessed* estimator $\hat{\beta}$ is exactly the proper estimator $\beta$



without showing all the algebra $Cov(\underline{\hat{\beta}})$ 
$$
Cov(\underline{\hat{\beta}}) = \Sigma_{\hat{B}} = \sigma^{2}(\mathbf{X^T X})^{-1}
$$
now exactly like *SLR* we do not know what $\sigma^{2}$ is, so now we need to estimate it $\hat{\sigma}^{2}$ which is given by
$$
\hat{\sigma}^{2} = \frac{RSS}{n-p-1}=\frac{\mathbf{e^T \mathbf{e}}}{n-p-1}
$$
so the *sample* (estimate) covariance of the estimators ($\beta$) is 
$$
\widehat{Cov}(\underline{\hat{\beta}}) = \hat{\sigma^{2}} (\mathbf{X^T X})^{-1}
$$

then like in SLR to find a confidence interval we need to create a $t$ variable. so like in [[STAT306/lecture 5|lecture 5]] we need 
$$
\frac{N}{\chi_{df}} \sim t_{df}
$$

for $\underline{\vec{B}}$ we can create the confidence interval for a specific $jth$ parameter for $j=0,1,\dots,p$ ($p$ columns/covariates)

first we find our $t$ distributed variable defined as

$$
\frac{\hat{\beta_{j}} - \beta_{j}}{\sqrt{ \left( \Large \Sigma_{\hat{\underline{\hat{\beta}}}} \right)_{jj}  }} \sim t_{n-p-1}
$$
where the denominator is just the $(j,j)$ entry in $\Sigma_{\underline{\hat{\beta}}}$

then as a confidence interval
$$
\large\left[ \hat{\beta_{j}} - t_{n-p-1, \frac{a}{2}} \cdot \sqrt{ \large\Sigma_{\underline{\hat{\beta}}} }_{jj}, \hat{\beta_{j}} + t_{n-p-1, \frac{a}{2}} \cdot \sqrt{ \large\Sigma_{\underline{\hat{\beta}}} }_{jj} \right] 
$$

things to review
- hypothesis testing
- prediction intervals vs confidence intervals

using the quantities above we can find the *sampling distribution* for $E[\mathbf{Y} | \mathbf{x_{new}}]$ give $\mathbf{x_{new}}$ is a new row of data that we want to find the expected response for

note:
$$
E[\mathbf{Y}|\mathbf{x_{new}}] = \large\mathbf{x}_{new}\underline{\beta}
$$
but since we do not know parameters we instead have
$$
\widehat{E} [ \mathbf{Y}|\mathbf{x_{new}}] = \large\mathbf{x_{new}}\underline{\hat{\beta}}
$$
the sampling distribution for this is
$$
\widehat{E} [ \mathbf{Y}|\mathbf{x_{new}}] \sim \left(\mathbf{x_{new}}\underline{\beta}, \hat{\sigma}^{2} (\mathbf{x_{new}^T} (\mathbf{X^T}\mathbf{X})^{-1} \mathbf{x_{new}})\right)
$$
