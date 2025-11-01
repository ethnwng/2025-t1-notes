# lab 5

# question 1
movie = read.table("movie.txt", header=TRUE, sep="")
levels(factor(movie$studio))

# question 2
boxplot(gross~studio, data=movie)

# question 3
reg = lm(gross~studio+openweekendgross, data=movie)

# question 4
install.packages("Matrix")

X = model.matrix(reg)
library(Matrix)
rk = rankMatrix(X)[1]
rk_T = rankMatrix(t(X)%*%X)

# question 6
kfp = data.frame(openweekendgross=75.7, studio="20thcenturyfox")
predict(reg, kfp, se.fit=TRUE, interval="prediction", level=0.95)

# question 7
install.packages("car")
library(car)
scatterplot(gross~openweekendgross*studio, data=movie, smooth=FALSE)

# question 8 
# the full model includes interaction terms which means it gives a different slope for different 
# categorical levels
# looking at the plot the slopes of each level do not vary that much therefore we could use a SINGLE
# slope to explain the data. 
# So in this case we could use a **simplier** model compared to one that has multiple slopes

# question 9
reg_full = lm(gross~studio*openweekendgross, data=movie)
summary(reg_full)
# take studiodisney - studiodisney:openweekendgross and the value is still very close to studiodisney
# -> each interaction term is very small 
# -> the p-values are very large but also non-significant

# question 10
# adding more covariates will also increase the R^2, adding an interaction term also adds a new covariate
# which means that the R^2 will increase but this does not mean that his model is better than before