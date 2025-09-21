### Q1
hubble = read.table("Hubble.txt", header=TRUE)
x = hubble$distance
y = hubble$velocity
plot (x, y, xlab="Distance (millions of light years)", ylab="Velocity (1000 km/s)")

### Q2
n = length(x)
xbar = mean(x)

sx = sqrt(sum((x-xbar)^2)/(n-1))

### Q3
sy = sd(y)
sxy = cov(x,y)
rxy = cor(x,y)

#Q4 
# Correlation is close to 1 therefore there is a strong linear relationship between x and y

#Q5
beta1hat = sxy/sx^2

# given a 1 million ligh years increase in distance is associated with an expected increase of 0.05168 velocity

### Q6
reg = lm(y~x)
res = reg$residuals

### Q7
RSS = sum((res)^2)
sigmasquare = RSS/(n-2)

### Q8
estimate_stderr_b1hat = sqrt((sigmasquare)^2 / sum((x-xbar)^2))
round(estimate_stderr_b1hat, 6)

### Q9
estimate_stderr_b0hat = sqrt((sigmasquare)^2*(1/n + xbar^2/sum((x-xbar)^2)))
round(estimate_stderr_b0hat, 6)

### Q10
summary(reg)
