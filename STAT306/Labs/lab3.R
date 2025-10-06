# Q1

horsepower = read.table("horsepower.txt", header=TRUE, sep=",")
x = horsepower$Horsepower
y = horsepower$mpg

plot(x, y, xlab="Horsepower", ylab="Miles per gallon")

# Yes there is a negative linear relationship between horsepower and miles per gallon. 

# Q2

reg <- lm(y~x)
summary(reg)

# Q3

# Look at the plot of residuals vs fitted y_hat values. If the spread of the points is not consistent 
# then the variance of the errors is not constant. The normal quantile plot is used to see if the errors are normally distributed

# Q4

res = reg$residuals
numerator = sum(res^2)
denominator = length(res) - 2
s = sqrt(numerator/denominator)

# Q5


# Q6
qt(.975, length(res)-2)

B1_hat = -0.08380
B1_SE = 0.01325
t_val = 2.16


confint(reg)

# Q7

# Q8

x0 = data.frame(x=250)
predict(reg, x0, se.fit=TRUE, interval="confidence", level=0.95)

# expected = 25.91717
# interval = (23.8358, 27.99854)

# Q9
x0 = data.frame(x=280)
predict(reg, )
