[[STAT306]]

##### Statistics
*definition:* (wikipedia)
any quantity computed from values in a *sample* which is considered for a statistical purpose. 
- these are normally estimates for the **true** quantity value we want for a population *mean, standard deviation*

##### Parameters
*definition:* (wikipedia)
any quantity of a statistical population that summarizes or describes an aspect of the population, such as a mean or a standard deviation.

##### Degrees of Freedom
*definition:* (wikipedia)
the number of values in the final calculation a *statistic* that are free to vary
- what the fuck does this mean

its the number of *quantities required to be known; to calculate the quantity we want to know*

for example, *standard deviation for a sample* (different from population) is given by
$$
s = \sqrt{ \large\frac{\sum_{i=1}^N (x_{i}-\bar{x})^{2}}{n-1}}
$$
for us to be able to calculate this, we need to know $\bar{x}$ the *sample mean*, thus there is **one degree of freedom**
