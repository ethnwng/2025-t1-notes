[[STAT306]]

from last we wanted to solve $E[\mathbf{E^T E}]$ 
$$
\implies
\begin{align}
\mathbf{E^T}_{1\times n}\mathbf{E}_{n\times_{1}} = 1\times 1 \text{ matrix} \to \text{scalar}
\end{align}
$$
thus
$$
E[\mathbf{E^T E}] = \mathbf{E^T E} \text{ and } tr(\mathbf{E^T E}) = \mathbf{E^T E}
$$

so we can do
$$
\begin{align}
 E[\mathbf{E^T E}]  & =  tr(\mathbf{E^T E}) \\
 E[\mathbf{E^T E}]  & = tr(\mathbf{E E^T}) \leftarrow \text{ by cyclical property}\\ 
 &  = E[tr(\mathbf{E E^T})] \leftarrow \text{ still a scalar} \\
 & = tr(E[\mathbf{E E^T }]) \leftarrow \text{ linearity} \\
 & = tr([E[(\mathbf{\mathbf{I_{n} - P}})] \mathbf{E E^T} (\mathbf{I_{n} - P})^T]) \\
 & = tr((\mathbf{I_{n}- P})E[\mathbf{E E^T}] (\mathbf{I_{n} - P})^T) \\
 & = tr( (\mathbf{I_{n} - P})Cov(\mathbf{E}) (\mathbf{I_{n} - P})^T) \\
 & = tr( (\mathbf{I_{n} - P})\sigma^{2} (\mathbf{I_{n} - P}) (\mathbf{I_{n} - P})) \\
 & = tr( (\mathbf{I_{n} - P})\sigma^{2} (\mathbf{I_{n} - P}) \cancel{(\mathbf{I_{n} - P})}) \\ 
 & = \sigma^{2} tr((\mathbf{I_{n} - P})(\mathbf{I_{n} - P})) \\
 & = \sigma^{2} (tr(\mathbf{I_{n}})-tr(\mathbf{P})) \\
 & = \sigma^{2} (n - tr(\mathbf{X(X^T X)^{-1} X^T})) \\
 &\ \  \vdots \\
E[\mathbf{E^T E}]  & = \sigma^{2} (n - p - 1)
\end{align}
$$

really just using trace properties


##### Categorical Variables
if we were looking at $sex$ of the penguins (dataset) then we could encode it as
$$
x_{male} = \begin{cases}
1 \text{ if male} \\
0 \text{ else}
\end{cases} \quad x_{female} = \begin{cases}
1 \text{ if female} \\
0 \text{ else}
\end{cases}
$$
then we model using MLR
$$
Y_{i} = \beta_{0}+\beta_{1}x_{male} + \beta_{2}x_{female}+\epsilon_{i}
$$
now it kind of looks like no issue but if a penguin is *male*, $x_{male}=1$ then we know that it is not *female*, $x_{female}=0$. So $x_{male}$ is linearly related to $x_{female}$.

What this implies then is that for our design matrix $X$, the columns will no longer be linearly independent.
ex:
$$
X = \begin{bmatrix}
1  &  1 & 0 \\
1 & 0 & 1
\end{bmatrix}
$$
which means that $X^T X$ is no longer invertible and can no longer be used in a *linear* model (could be used in a non-linear model)

so instead we encode like this
$$
x_{sex} = \begin{cases}
1\text{ if male} \\
0\text{ else}
\end{cases}
$$
then our model is
$$
Y = \beta_{0} + \beta_{sex} x_{sex} + \epsilon
$$
