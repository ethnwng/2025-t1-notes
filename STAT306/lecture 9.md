[[STAT306]]

*motivation*
we want to understand what the quantity
$$
E[\hat{\sigma}^{2}]
$$
i think in the end we will show that it is unbiased $E[\hat{\sigma}^{2}]=\sigma^{2}$

we are focusing on the *residuals* so
$$
\mathbf{e}=\mathbf{y}-\mathbf{X}\hat{\beta} = \mathbf{y}-\mathbf{\hat{y}}
$$
the residual sum of squares is
$$
RSS = \mathbf{e}^T\mathbf{e} = \sum_{i=1}^n (y_{i}-\hat{y_{i}})^{2}
$$
and considering the residuals as a random vector denoted $\mathbf{E}$
$$
\mathbf{E} = \mathbf{Y-X \hat{\beta}} = \mathbf{Y-\hat{Y}}
$$
postlecture:

try n solve 
$$
E[\hat{\sigma}^{2}] = E[\mathbf{E}^T \mathbf{E}]
$$
