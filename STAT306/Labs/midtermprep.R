# Doing all Labs up to Lab 6

# 1.1
# header is to keep the header of the dataframe, sep is the separator term

# 1.2
age_savings = read.table("age_savings.csv", header=TRUE, sep=",")

# 1.3
# ...

# 1.4
max(age_savings$Age_years) # 82

# 1.5
age_savings$Savings[which.max(age_savings$Age_years)] # 71

# 1.6 
mean(age_savings[age_savings$Age==1,]$Savings) #56

# 1.7
plot(age_savings$Age_years, age_savings$Savings)

# 1.8
# there is a linear relationship between the amount of savings a person has and their age

# 1.9
(model <- lm(age_savings$Savings ~ age_savings$Age_years))

# 1.10/11
plot(age_savings$Age_years, age_savings$Savings)
abline(model)

# fitted model does aline with the original assumptions

# 2.1
hubble = read.table("Hubble.txt", header=TRUE)
x = hubble$distance
y = hubble$velocity
plot(x, y, xlab="Distance (millions of light years)", ylab="Velocity (1000 km/s)")
# a linear model seems appropriate here since the points show a linear relationship

# 2.2
n = length(x)
xbar = mean(x)
s_x = sqrt(sum((x - xbar)^2)/(n-1))

# 2.3
s_y = sd(y)
s_xy = cov(x,y)
r_xy = cor(x,y)

# 2.4
# r_xy = 0.998 meaning the two variables are highly correlated so we can expect the model to 
# be fit very well to the data

# 2.5
beta_1_hat = (r_xy*s_y)/s_x
# An increase of 1 million light years in distance is associated with an 
# expected increase of 0.0568553 thousand km/s in velocity

# 2.6
reg = lm(y~x)
res = reg$residuals # Note: could also compute using (y - reg$fitted.values)
round(sum(res), 4)
# this does match our expectation because the least squares estimators happens by
# minimizing the sum of the residuals, using calculus we do this by setting the sum of the residuals equal to zero

# 2.7
RSS <- sum(res^2)
sigma_hat <- round(RSS/(n-2), 6)
sigma2_hat <- RSS/(n-2)

# 2.8
beta_1_hat_std_err <- round(sqrt(sigma_hat / sum((x-xbar)^2)), 6)

# 2.9
beta_0_hat_std_err <- round(sqrt(sigma_hat^2*(1/length(x) + (mean(x))^2/sum((x-mean(x))**2))), 6)
var_beta_1 = sigma2_hat / (sum((x-mean(x))**2))
se_beta_1 = sqrt(var_beta_1)

var_beta_0 = sigma2_hat * (1/length(x) + (mean(x)^2) / (sum((x-mean(x))**2)))
se_beta_0 = sqrt(var_beta_0)

# 2.10
summary(reg)

# 3.1
horsepower = read.table("horsepower.txt", header=TRUE, sep=",")
x = horsepower$Horsepower
y = horsepower$mpg
plot(x, y, xlab="Horsepower", ylab="Miles per gallon")
# a linear model seems appropriate because the points show a negative linear relationship

# 3.2
(reg <- lm(y ~ x, data=horsepower))

# 3.3
# could use a plot of the residuals vs the fitted values to see if there is homoscedacity
# could use a normal quantile plot to check for normality in the errors

# 3.4
(n = length(y))
(s = sqrt(sum(reg$residuals^2)/(n-2)))
# 3.28

# 3.5
summary(reg)
# R calls this the residual standard error

# 3.6
b1hat = reg$coefficients[2]
sigma2hat = sum(reg$residuals^2)/(n-2)
crit_t = qt(0.975, n-2)
xbar = mean(x)
se_b1hat = sqrt(sigma2hat/sum((x-xbar)**2))
(lower = b1hat - crit_t * se_b1hat)
(upper = b1hat + crit_t * se_b1hat)

# 3.7 !!!!!!!!!
# our confidence interval calculated above means that 95% of the time the true value for b1hat lies between
# -0.1124 and -0.05516
# ans: the interval *DOES NOT INCLUDE 0* which means that there is STATISTICAL SIGNIFICANCE between 
# X and Y
# there is also a negative relationship

# 3.8
x0 = data.frame(x=250)
predict(reg, x0, se.fit=TRUE, interval="confidence", level=0.95)
# fit = 25.91, CI = (23.83, 27.99)

# 3.9
predict(reg, x0, se.fit=TRUE, interval='prediction', level=0.95)
# fit = 25.91, PI = (18.51, 33.31)
# the interval here is wider since it is a prediction interval and has to include
# uncertainty for both the line and the true value error

# 3.10
se_prediction = sigma2hat*(1 + 1/n + (x0-xbar)**2/sum((x-xbar)**2))

# 3.11
# the prediction for the 280 will be wider because the (x_new - xbar)^2/sum((x-xbar)^2)
# term is going to larger than the 250

###############################################################3

# 4.1
coma = read.table("coma.txt", header=TRUE)
y = coma$piq
x = coma$duration
x1 = log(coma$duration)
plot(x, y, xlab="Duration (in days)", ylab="PIQ")
plot(x1, y, xlab="Duration (in log days)", ylab="PIQ")

# the log data will fit better because the points are further spread apart

# 4.2
reg <- lm(y ~ x1, data=coma)
b0 = reg$coefficients[1]
b1 = reg$coefficients[2]
x0 = log(10)
u = b0+b1*x0
u
# Someone who was in a coma for 10 log days is expected to have a PIQ score of 86.83

# 4.3
vcov(reg)
# the off diagonal of the matrix represent the cov(b0, b1)

# 4.4
# var(b0) + x0^2*var(b1) - 2*x0*cov(b0,b1)

# 4.5
se_b0 = vcov(reg)[1,1]
se_b1 = vcov(reg)[2,2]
covb1b2 = vcov(reg)[1,2]
varu = se_b0 + x0**2*se_b1 - 2*x0*covb1b2
varu

# 4.6
# this is confidence interval because we are dealing with an expected response

# 4.7
(reg2 <- lm(y ~ log(coma$duration) + log(coma$days), data=coma))
plot(reg2$fitted.values, reg2$residuals, xlab="Fitted value", ylab="Residual")
qqnorm(reg2$residuals)
qqline(reg2$residuals)
# looks like the qq plot is showing that the errors are normal
# looks like the points are homoscedastic 

# 4.8
summary(reg2)

# 4.9
b2hat = reg2$coefficients[3]
RSS = sum(reg2$residuals^2)
sigmahat = RSS/(length(x) - 3 - 1)
tcrit = qt(0.975, length(x)-3-1)
se_b2 = vcov(reg2)[3,3]

(lower = b2hat - tcrit * sqrt(se_b2))
(upper = b2hat + tcrit * sqrt(se_b2))

# 4.10
# the confidence interval does not include 0 therefore we can reject the null hypothesis
# of H0: B2 = 0. 

# 4.11
# There is a relationship between the PIQ score and the number of log days a person has been in a coma, it is a negative
# relationship

# 4.12
# changing n will change the interval because the degrees of freedom will change. it means the t distribution will also change

#############
# 5.1
movie = read.table("movie.txt", header=TRUE, sep="")
levels(factor(movie$studio))
# baseline = 20thcenturyfox

# 5.2
boxplot(gross~studio, data=movie)
# a. disney produces the highest median gross movies
# b. warner has the lowest variation in gross movies

# 5.3
reg = lm(gross~studio+openweekendgross, data=movie)
summary(reg)
# a. b1 = 42.31+29.24, b2 = -11.43+29.24, b3 = 14.48+29.24
# b. the parameter estimate for disney is b1, which means the movies produced
# by the studio disney has an expected increase in gross of 71.5602 million USD

# 5.4
X = model.matrix(reg)
library(Matrix)
rk = rankMatrix(X)[1]
rk
rankMatrix(t(X)%*%X)
# b. because the rank of X^TX is equal to 5, it means that it is full rank
# and therefore the columns are linearly independent and (X^TX)^{-1} exists

# 5.5
# when you use that kind of encoding style you end up with linearly dependent columns
# thus (X^T X)^{-1} has no solutions and the LSE cannot be solved

# 5.6
# [1 0 0 0 75.7]

# 5.7
kfp = data.frame(openweekendgross=75.7, studio="20thcenturyfox")
predict(reg, kfp, interval='prediction', 0.95)
# std error is Var(hat(Y_new)) + Var(Y_new) = sigma^2(1 + 1/n + (x_new - xbar)^2/sum(xi-xbar)^2)

# 5.8
library(car)
scatterplot(gross~openweekendgross*studio, data=movie, smooth=FALSE)
# the fitted models do not look different enought to warrant the use of interaction terms
# a simplier model might be better since they all have very similar slopes 

# 5.9
reg_full = lm(gross~studio*openweekendgross, data=movie)
summary(reg_full)
# looking at the estimates for each interaction term, they are all quite small
# looking at the p-values of each estimate, we can see they are all quite large
# meaning that they all would lie outside of a signficance level and therefore
# are all insignificant to the model

# 5.10
summary(reg)
# the R^squared scores for the full model and the additive model are quite similar