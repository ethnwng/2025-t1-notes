[[STAT306]]

From last:

$$
\sum (Y_{i}-\bar{Y})^{2} = \sum (\hat{Y}_{i} - \bar{Y})^{2}+ \sum(Y_{i} - \hat{Y}_{i})^{2}
$$
is 
$$
\text{Total Sum of Squares} = \text{Model Sum of Squares } + \text{ Residual Sum of Squares}
$$

we can rearrange the equation to get
$$
\begin{align}
TSS  & = MSS + RSS \\
1  & = \frac{MSS}{TSS} + \frac{RSS}{TSS}
\end{align}
$$
then the term $R^{2} = \frac{MSS}{TSS} = 1-\frac{RSS}{TSS}$ is the **coefficient of determination**

where $R^{2}$ measures the *variability of the response variable* that is explained by the linear model
- 1 $\to$ higher variability
- 0 $\to$ lower variability
unlike 330 a higher $R^2$ score does not mean the model is fitting the data well
- therefore the predictions are not guaranteed to be accurate

*linearity* of $X$ and $Y$ is on the $\beta$'s. So
$$
\begin{align}
Y  & = \beta_{0} +\beta_{1}X + \beta_{2}X^{2} \\
Y  & = \beta_{0} +\beta_{1}\log(X) + \epsilon \\
Y  & = \beta_{0} +\beta_{1}e^X + \epsilon
\end{align}
$$
are all linear models 

all you have to do is set $Z=X, Z=X^{2}, Z=\log(X), etc$. But the interpretation of the model will change to $Z$


### Matrix Notation Of Linear Models
**any** linear model can be defined in *matrix notation*.

the simple linear regression (one covariate) is
$$
Y_{i} = \beta_{0}+\beta_{1}x_{i} + \epsilon_{i}
$$
then in matrix form its just 
$$
\begin{bmatrix}
Y_{1} \\
\vdots \\
Y_{n}
\end{bmatrix} = \begin{bmatrix}
\beta_{0} + \beta_{1}x_{1} + \epsilon_{1} \\
\vdots \\
\beta_{0}+\beta_{1}x_{n}+\epsilon_{n}
\end{bmatrix} \implies \begin{bmatrix}
Y_{1} \\
\vdots \\
Y_{n}
\end{bmatrix} = \begin{bmatrix}
1 & x_{1} \\
\vdots \\
1 & x_{n}
\end{bmatrix} \begin{bmatrix}
\beta_{0} \\
\beta_{1}
\end{bmatrix} + \begin{bmatrix}
\epsilon_{1} \\
\vdots \\
e_{n}
\end{bmatrix}
$$
which can be simplified to
$$
\mathbf{Y} = \begin{bmatrix}
Y_{1} \\
\vdots \\
Y_{n}
\end{bmatrix} \quad \mathbf{X} = \begin{bmatrix}
1 & x_{1} \\
\vdots \\
1 & x_{n}
\end{bmatrix} \quad \vec{\beta} = \begin{bmatrix}
\beta_{0} \\
\beta_{1}
\end{bmatrix} \quad \vec{\epsilon} = \begin{bmatrix}
\epsilon_{1}  \\
\vdots \\
\epsilon_{n}
\end{bmatrix}
$$

where $n$ is the number of *rows of data* you have. 
$$
\mathbf{Y} = \mathbf{X}\vec{\beta}+\vec{\epsilon}
$$

$\mathbf{X}$ is called the *design matrix*.

This is *generalized* for $p$ covariates as 
$$
\begin{align}
 & \implies\begin{bmatrix}
Y_{1} \\
\vdots \\
Y_{n}
\end{bmatrix} = \begin{bmatrix}
\beta_{0} + \beta_{1}x_{11} +\beta_{2}x_{12}+\dots+\beta_{p}x_{1p} + \epsilon_{1p} \\
\vdots \\
\beta_{0}+\beta_{1}x_{n1}+\beta_{2}x_{n2}+\dots+\beta_{p}x_{np}+\epsilon_{np}
\end{bmatrix}  \\
 \\

  & \implies \begin{bmatrix}
Y_{1} \\
\vdots \\
Y_{n}
\end{bmatrix}_{n \times 1} = \begin{bmatrix}
1 & x_{11} & x_{12} & \dots & x_{1p} \\
\vdots  & \vdots & \vdots & \ddots  & \vdots\\
1 & x_{n 1} & x_{n 2}  & \dots & x_{np}
\end{bmatrix}_{n\times p} \begin{bmatrix}
\beta_{0} \\
\vdots \\
\beta_{p}
\end{bmatrix}_{p\times1} + \begin{bmatrix}
\epsilon_{1} \\
\vdots \\
e_{n}
\end{bmatrix}_{n\times1}
\end{align}
$$


in [[STAT306/lecture 2|lecture 2]] we found the formula for each estimator $\hat{\beta_{0}}$, $\hat{\beta_{1}}$. Without showing proof in matrix form the equations *called the normal equations*are
$$
\mathbf{X}^T\mathbf{X}\vec{\hat{\beta}} = \mathbf{X}^T\mathbf{y}
$$
where $X$ is the design matrix and
$$
\vec{\hat{\beta}} = \begin{bmatrix}
\hat{\beta_{0}} \\
\hat{\beta_{1}}
\end{bmatrix} \quad \mathbf{y} = \begin{bmatrix}
y_{1} \\
\vdots \\
y_{n}
\end{bmatrix}
$$
then the least squares estimators $\vec{\hat{\beta}}$ is given by
$$
\vec{\hat{\beta}} = (\mathbf{X}^T \mathbf{X})^{-1} \mathbf{X}^T\mathbf{y}
$$
thus the inverse of $\mathbf{X}^T\mathbf{X}$ must exist. *It only does not exist when*
$$
\sum_{i=1}^n (x_{i}-\bar{x})^{2} = 0
$$
- but this only happens when each $x_{i}$ is exactly equal to the sample mean so $x_{i}=\bar{x}$ or $x_{i}=c$

in general, the matrix $\mathbf{X}^T\mathbf{X}$ is **iff** the design matrix $X_{n \times p}$ has $rank(A)=p$
($p$ is the number of columns) or the columns are *linearly independent*


##### Multiple Linear Regression
suppose we have $p$ covariates $X_{1},X_{2},\dots,X_{p}$

then we have a general model
$$
\begin{align}
Y_{1}  & = \beta_{0}+\beta_{1}X_{1}+\epsilon_{p} \\
 & \vdots \\
Y_{p}  & = \beta_{0}+\beta_{1}X_{p}+\epsilon_{p}
\end{align}
$$
which in matrix notation it can written as
$$
\mathbf{Y}=\mathbf{X}\vec{\beta}+\vec{\epsilon}
$$
where
$$
\mathbf{Y}=\begin{bmatrix}
Y_{1} \\
\dots \\
Y_{n}
\end{bmatrix}_{n\times 1} \quad \mathbf{X}=\begin{bmatrix}
1 & x_{11} & x_{12} & \dots  & x_{1p} \\
1 & x_{21} & x_{22} & \dots & x_{2p} \\
\vdots & \vdots & \vdots & \ddots & \vdots \\
1 & x_{n 1} & x_{n2} & \dots & x_{np}
\end{bmatrix}_{n\times p} \quad \vec{\beta} = \begin{bmatrix}
\beta_{0}  \\
\beta_{1} \\
\vdots \\
\beta_{p}
\end{bmatrix}_{(p+1)\times1} \quad \vec{\epsilon} = \begin{bmatrix}
\epsilon_{1} \\
\epsilon_{2} \\
\vdots \\
\epsilon_{n}
\end{bmatrix}_{n\times 1}
$$
instead of a line the model now represents a *hyperplane*

similar to the last we look for the *residuals* to find the values of the estimators. without proof of formula the residuals look like
$$
\mathbf{e} = \begin{bmatrix}
Y_{1} - b_{0}-b_{1}x_{1} \\
\vdots \\ 
Y_{n} - b_{0}-b_{1}x_{n}
\end{bmatrix} \implies \mathbf{e} = \mathbf{Y}-\mathbf{X}\mathbf{b}
$$

then we are solving
$$
RSS(\mathbf{b}) = \mathbf{e}^T\mathbf{e}
$$
where 
$$
\mathbf{b} = \begin{bmatrix}
b_{0} \\
b_{1}
\end{bmatrix}
$$
and $\mathbf{e}$ is defined above.

so we do all this to generalize that the solution to the estimators is
$$
\mathbf{X}^T\mathbf{X}\hat{\beta} = \mathbf{X}^T\mathbf{y}
$$
*aside:* on $RSS$ as you add covariates.
if you have $p=2$ covariates or $p=3$ covariates, the minimum value of $RSS$ of the $p=2$ model is always greater than or equal to the $p=3$ model

to see why,
$$
Y_{p=2} = \sum (y_{i} - \beta_{0}-\beta_{1}x_{1}-\beta_{2}x_{3})^{2}
$$
$$
Y_{p=3} = \sum(y_{i}-\beta_{0}-\beta_{1}x_{1}-\beta_{2}x_{2}-\beta_{3}x_{3})^{2}
$$
its clear that the $p=3$ RSS can take smaller values than the $p=2$ because of the additional $\beta_{3}$ term which is subtracting from $y_{i}$





