## lab 4
# Question 1
coma = read.table("coma.txt", header=TRUE)
y = coma$piq
x = coma$duration
x1 = log(coma$duration)
plot(x, y, xlab="Duration (in days)", ylab="PIQ")
plot(x1, y, xlab="Duration (in log days)", ylab="PIQ")

# Question 2
reg = lm(y ~ x1)
u0_x0 = reg$coefficients[1] + reg$coefficients[2]*log(10)
u0_x0 # <- 86.839

# Question 3
vcov(reg)

# Question 4
# var(b0 + b1x0)
# var(b0) + x0var(b1) + 2Cov(b0, b1)^2 * 0.6783 + 2*x0* vcov(reg)

# Question 5
var_u0 <- 1.6281 + log(10)^2 * 0.6783 + 2*log(10) * vcov(reg)

# Question 6
# it is a confidence interval since we are looking at expected response

# Question 7
x2 = coma$days
reg2 <- lm(y~x1+x2)
plot(reg2$fitted.values, reg2$residuals, xlab="Fitted value", ylab="Residual")
qqnorm(reg2$residuals)
qqline(reg2$residuals)

# Question 8
summary(reg2)

# Question 9

