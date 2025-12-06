# Load the data
data('cars')

# Visualize the data
x = cars$speed
y = cars$dist
plot(x, y, xlab="Speed (mph)", ylab="Distance (ft)")

# Question 1
(fit1 <- lm(y~x))
# Y = -17.579 + 3.932x

# Question 2
plot(fit1$fitted.values, fit1$residuals, xlab="Fitted value", ylab="Residual")
# there seems to be a fanning shape

# Question 3
cooks.distance(fit1) >= 1
# no points are influential

# Question 4
# no points are influential and but there is a fanning shape to the residuals
# therefore the model is not that good a fit

# Question 5
fit2 = lm(y~x+I(x^2))
summary(fit1)
summary(fit2)
# the adjusted R squared increases but not by alot so maybe we do not include

# Question 6
# the coefficient p-value is not significant at the 5% level 

# Question 7
fit3 = lm(y~x+I(x^2)+I(x^3))
summary(fit3)
# this is not the best model because adding the covariate always increases the R squared score

# Question 8
# the simplest model which only includes x. it is harder to interpret speed squared

# Question 9
library(car)
vif(fit3)

# Question 10
vif(lm(y~x+I(x^3)))
# the x^2 term is explained alot by the x and x^3 terms. the VIF says there is a multicollinearity issue

# Question 11
fit5 <- lm(sqrt(y) ~ x)
summary(fit5)
plot(fit5$fitted.values, fit5$residuals, xlab="Fitted value", ylab="Residual")
# the scale of the x axis has changed to be more spread out but the plots look relatively similar


