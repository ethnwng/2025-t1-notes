[[STAT306]]

#### Model Selection
The main goal was to find a relationship between $X_{i}$ and $Y$. But:
- can we make things better if we remove some of the covariates? (some covariates are unrelated to $Y$)
- how would we select these

*Q:* why is it that removing covariates can sometimes improve the models 
*A:* 
- it makes simpler models which makes them easier to understand
- if a covariate $X$ is not important to the model, removing it also lowers the variability of the model and therefore makes it a little bit more precise.

*Q:* what does it mean for "best" covariates
*A:* based on criteria

There are two objectives for models normally:
- Prediction of $Y$: models that are better for prediction are normally more complex
- Inference of $Y$: models that are better for inference means they are easier to interpret

**Inference Models**
- we focus on the $\beta$ values as they represent the relationship, "change in $X$ implies a $\beta$ change in $Y$"
- meaning we dont really care (within reason) what the output of the model is

*Principle of Parsimony*
- General Principle: When faced with two "equally good" competing explanations for a phenomenom, the simpler one is preferred.

- Statistical Application: If two models have similar fit to a dataset, the simpler model should be preferred

*How do we compare model fitness*
- Cant use RSS and $R^{2}$ because they do not penalize model complexity
- Adj-$R^{2}$ does penalize the inclusion of variables

the main ones to use 
- Mallows $C_{p}$ statistic
- Akaike Information Criterion (AIC)
- Bayesian Information Criterion (BIC)

**Mallows** $C_{p}$
suppose we have $p$ covariates, $X_{1}, \dots, X_{p}$. Which implies $k=p+1$ coefficients

For a fitted model with $q\leq p$ predictors, i.e. $q+1$ coefficients the $C_{p}$ estimate is given by:
$$
\begin{align}
C_{p} &  = \frac{1}{n}\left( RSS(X_{i_{1}}, X_{i_{2}},\dots,X_{i_{q}}) + 2(q+1)\hat{\sigma}^{2} \right)  \\
 & =\frac{1}{n}(RSS_{q}+2(q+1)\hat{\sigma}^{2})
\end{align}
$$
so in other words
$$
C_p = \frac{1}{n}RSS_{q} + \frac{1}{n}2(q+1)\hat{\sigma}^{2}
$$
- $\large \frac{1}{n}RSS_{q}$ is the *training error*, like in CPSC330
- $\frac{1}{n}2(q+1)\hat{\sigma}^{2}$ is the *penalty term*. The penalty term exists to account for the training error underestimating the test error (unseen data?)

basically just pick the model with the lowest Mallows statistic

**AIC (Akaike's Information Criterion)**
the AIC of a model with $q$ covariates is given by
$$
AIC_{q} = n\ln(RSS_{q}) -n\ln(n) + 2(q+1)
$$
- AIC is a more generic criterion, applicable for many model.
- different formula for different models, the one above is specific for linear regression
- we want the model with the smallest $AIC$

**BIC (Bayesian Information Criterion)**
the BIC of a model with $q$ covariates is given by
$$
BIC_{q} = n\ln(RSS_{q}) - n\ln(n) + \ln(n) (q+1)
$$
- looks the same as $AIC$ but penalizes more when we bring in a new covariate
- $BIC$ tends to select smaller models for this reason compared to Mallows or AIC
- again we want the smallest

*Computational Cost*
each of the methods above require you to fit multiple models. The number of possible models is $2^p$ for $p$ covariates.

*so what do*

**Forward Selection:**
- greedy by nature
1. start with the null model (no covariates, only intercept) called $M_{0}$
2. For $q=0,\dots,p-1$. From the remaining $p-q$ covariates, we then add one at a time to the model $M_{q}$. Pick the model that decreases the $RSS$ the most, and call it $M_{q+1}$
3. Compare the model $M_{0},\dots, M_{p}$ using $AIC$ or $BIC$

In english:
- start with a model that has no covariates.
- for each of the covariates fit a model, and then keep the model that decrease $RSS$ 
- then using the model from the previous step, fit $p-1$ different models and then pick the "best" one
- when you run out of covariates, use $AIC$/$BIC$ to compare each of the models from each step

**Forward Selection:**
- very similar to forward selection, but we start with the *full model* instead of the *null*

- start with $p$ covariate model, drop each covariate one at a time and pick the model that *increases RSS* the least.
- then repeat again 
- same concluding step to compare each model
- 