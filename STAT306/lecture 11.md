[[STAT306]]

*review:*
- f test distribution
- t test distribution a bit

from [[STAT306/lecture 9|lecture 9]] if we onehot encode a binary variable it will cause problems in our design matrix

Therefore for categorical variables with $C$ categories, we encode using $C-1$ variables
- ex: Encode the penguins' sex which can be *male* or *female*, introduce the variable
$$
x_{male} = \begin{cases}
 1 \text{ if male} \\
0 \text{ else}
\end{cases}
$$
this is called a **dummy model**

the model becomes
$$
Y = \beta_{0}+ \beta_{1}x_{male} + \epsilon
$$
then,
$$
\begin{align}
 & E[Y|x_{male} = 1] = \beta_{0}+\beta_{1} \\
 & E[Y|x_{male} = 0] = \beta_{0}
\end{align}
$$
and 
$$
\beta_{1} = E[Y | x_{male} = 1] - E[Y | x_{male} =0]
$$
$\star$ when we fit a model in $R$ we need to remember that the *slope* term is **the difference of the male and female** and to get the true expected average for the *male* category we need to include the *intercept*
- recall: the learned coefficients $\beta_{0}, \beta_{1}$ represent averages

this works for all categorical variables, $R$ will make $C-1$ coefficients for the categorical variable, the *intercept* term will represent the $C^{th}$ variable and will be the *unnamed* one, called the *baseline*.
- Each coefficient other than the baseline *does not represent* the mean of that category's level, you have to add the intercept to get the true mean of that leel

```R
> (model_sex <- lm(body_mass ~ species, data=penguins))

Call:
lm(formula = body_mass ~ species, data = penguins)

Coeff:
(intercept) speciesChinstrap speciesGentoo
3706.164    26.924           1386.273
```

say there are only three species `species = ['Adelie', 'Chinstrap', 'Gentoo']` 
- the intercept in the code output above represents the *Adelie* level since it is the *unnamed* coefficient

the mean values for Chinstrap and Gentoo species is then the sum of their coefficient values and the intercept
$$
\begin{align}
 E[Chinstrap] &  = 3706.164 + 1386.273 \\
E[Gentoo]  & = 3706.164 + 26.924 
\end{align}
$$
##### Categorical. + Numerical Variables Together
If we have both $x_{male}$ and $x_{\text{flipper length}}$ i.e we want to understand the relationship of sex and flipper length we get a model like
$$
Y = \beta_{0} + \beta_{1}x_{sex} + \beta_{2}x_{\text{flipper length}} + \epsilon
$$
with
$$
\begin{align}
 & E[Y|x_{sex}=male] = (\beta_{0}+\beta_{1})x_{sex} + \beta_{2}x_{\text{flipper length}} \\
 & E[Y|x_{sex}=female] = (\beta_{0})x_{sex} + \beta_{2}x_{\text{flipper length}}
\end{align}
$$
- so the *intercept* changes depending on the category, but the *slope* stays the same


An *interaction term* combines the categorical variable with the numerical, almost like a logical *AND* and indicator 

$$
Y = \beta_{0}+\beta_{1}x_{sex}+\beta_{2}X_{\text{bill length}} + \beta_{3}x_{sex}x_{\text{bill length}}
$$
with
$$
\begin{align}
E[Y]  & = \beta_{0}+\beta_{1}x_{sex} + \beta_{2}x_{\text{bill length}}+\beta_{3}x_{sex}x_{\text{bill length}} \\
E[Y|x=male]  & = (\beta_{0}+\beta_{1})x_{sex} + (\beta_{2}+\beta_{3})x_{\text{bill length}} \\
E[Y|x=female]  & = \beta_{0} + \beta_{2}x_{\text{bill length}}
\end{align}
$$
- the *intercept* and *slope* both change based on the category level

	in $R$ to add the interaction term use `x:z`. If you use `x*z` then that expands to `x+z+x:z`

