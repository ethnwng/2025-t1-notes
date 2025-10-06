[[STAT306]]

**model diagnostics**
- checking to see if the assumptions we made are good

hard to use $Y$ because it could be changing due to $X$ or due to an *error* but we cannot tell which

*residuals* are related to the line, given a slr line $K$ with its residuals $e_{k}$ if you add a new point to the slr line will change $K \to L$ and by changing the line every single residual $e_{k}$ also changes $e_{k}\to e_{L}$.
- residuals are used to be the estimates for the $\epsilon$ term, for large sample size they are similar but $e$ terms have some assumptions that $\epsilon$ does not

plots to look at:
- $e_{i}$ vs fitted value $\hat{y}$ (or covariate $x_{i}$)
	- the scatter plot should have no relationship and just be a cloud of random points
	- plots could also show that the variance *is not constant*
	![[Pasted image 20250922110301.png]]
- ordered residual $e_{(i)}$ against the normal score $E[z_{i}]$
	- this is a check to see if the residuals follow a normal distribution
	- you order the residuals in ascending order and plot the theoretical quantiles $E[z_{i}]$ with the sample $e_{i}$. 
	- you want the points to be linearly related
- $e_{i}$ against $e_{i-1}$ or $e_{i-2}$ 
	- we again want a cloud of points
	- good for timer series analysis or time collected data

notation:
- $\sum_{i=1}^n (Y_{i} - \bar{Y})^{2}$ is the total variability of $Y$ around the mean. (is this not the same as SD *TSS*
- $\sum_{i=1}^n(\hat{Y}_{i}-\bar{Y})^{2}$ is the total variability of the line around the mean *MSS*
- $\sum_{i=1}^n(Y_{i}-\hat{Y}_{i})^{2}$ is the total variability of the line *RSS*



