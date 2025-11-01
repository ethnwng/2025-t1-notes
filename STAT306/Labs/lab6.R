# Question 1
# install.packages("car")  # Run this once if you do not have the car package
babies = read.table("birth_smoke.txt", header=TRUE, sep=" ")
babies$Smoke = factor(babies$Smoke)
library(car)
scatterplot(Wgt~Gest|Smoke, smooth=FALSE, by.groups=TRUE, data=babies)

# ans: the lines are close to parallel so the additivie regression model seems to 
# be the most appropriate for this data. 

# Question 2
# ans: an initial answer is that smoking does have an effect on the babies expected weight, we can see 
# from the plot that the points for babies with smoking mothers tend to be lower than 
# babies who did not have smoking mothers

# Question 3
lm(Wgt~Gest+Smoke, data=babies)

# B0 + B1x_gestation + B2x_smokeyes 

# Question 4
# for the non-smoke, the intercept is just -2389.6
# for the smokers, the intercept is -2389.6-244.5 = -2634.1

# Question 5
babies$Smoke = relevel(babies$Smoke, ref="yes")
lm(Wgt~Gest+Smoke, data=babies)
# new intercept is -2634.1

# Question 6
# overall the model is still the same so the interpretation are still the same

# Question 7
# it is significant, 
summary(lm(Wgt~Gest+Smoke, data=babies))

# Question 8
lm(Wgt~Gest*Smoke, data=babies)
summary(lm(Wgt~Gest*Smoke, data=babies))