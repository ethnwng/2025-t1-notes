[[STAT306]]

**Nested Models**
*motivating example:* Consider a "full model"
$$
\large Yi = \beta_{0} + \beta_{1}x_{1} + \beta_{2}x_{2} + \beta_{3}x_{3} + \beta_{4}x_{4} + \epsilon i
$$
what if we want to compare this model to a simpler one that does not have $\beta_{2}$ and $\beta_{4}$? If we just set these 
terms to zero in the full model we get a **nested model**
$$
\large Y_{i} = a_{0} + a_{1}x_{1}  + a_{3}x_{3}+\epsilon _{i}
$$
or in other words we are doing the hypothesis test: $H_{0}: \beta_{2}=\beta_{4}=0$ 

you can use the *F test* to compute above

*note:* you can only use the F test on two models *if they are nested models of each other*
