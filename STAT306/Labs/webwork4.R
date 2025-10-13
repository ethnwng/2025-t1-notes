# Q1
# y variable
askpr=c(73.9, 48.5, 56.88, 54.8, 46.8, 79.99, 50.8, 53.8, 71.99, 58.39, 68.5, 78.8, 52.4, 58.8, 55.8, 62.9, 57.8, 55.2, 51.68, 56.8, 57.5, 33.7, 108.8, 45.99, 25.9, 68.5, 41.99, 40.8, 60.8, 49.9, 50.8, 74.8, 65.99, 68.8, 62.8888, 48.8, 54.8, 58.68, 40.8, 40.9, 61.5, 86.8, 26.99, 81.9, 51.99, 47.8, 53.9, 44.8, 50.5, 54.98)

# x variable(s)
ffarea=c(15.15, 14.8, 15.78, 11.26, 16.2, 22, 12.27, 12.22, 15.05, 15.09, 15.76, 19.48, 16.22, 17.37, 13.06, 14, 13.84, 15.3, 15.1, 15.5, 13.46, 12, 23.98, 16.01, 6.1, 13.59, 12.9, 14, 13.2, 15.6, 16.6, 17.48, 22.78, 16.9, 15.77, 14.8, 15.46, 13.96, 12.26, 16.06, 14.5, 15.08, 10.5, 20.95, 12.09, 13.34, 11.84, 9.4, 12.26, 13.06) 
age=c(0, 24, 17, 0, 30, 20, 17, 9, 8, 8, 4, 11, 25, 26, 0, 5, 10, 9, 20, 23, 10, 28, 16, 25, 11, 2, 44, 38, 3, 20, 23, 5, 35, 8, 6, 50, 41, 9, 29, 25, 7, 1, 37, 19, 7, 32, 15, 14, 3, 1) 
mfee=c(22.2, 16.1, 17.3, 24.8, 16, 26.7, 25.2, 18.5, 22.3, 20.3, 22.1, 20.4, 36.4, 31, 18.6, 19.6, 16, 16.9, 24.5, 17.4, 22.1, 25.9, 36.9, 33.7, 17.1, 17, 23.2, 23, 18.9, 27, 19.9, 29.7, 57.4, 19.4, 35.7, 25, 31, 22, 19.8, 24.4, 18.7, 48.8, 28, 34.8, 18.1, 24.5, 21, 23.3, 18, 19.6) 
beds=c(4, 3, 4, 2, 4, 3, 2, 3, 3, 4, 4, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 3, 3, 1, 3, 3, 3, 3, 3, 4, 4, 2, 4, 3, 3, 3, 3, 3, 2, 3, 3, 2, 1, 3, 3, 2, 2, 3, 3) 

# dataframe
richmondtownh=data.frame(cbind(askpr,ffarea,age,mfee,beds)) 

# models
lm_two = lm(askpr ~ ffarea + age, data = richmondtownh)
lm_three = lm(askpr ~ ffarea + age + mfee, data = richmondtownh)
lm_four = lm(askpr ~ ffarea + age + mfee + beds, data = richmondtownh)

summary(lm_two)
summary(lm_three)
summary(lm_four)

confint(lm_three)

# new prediction
library(tibble)
new <- tibble(ffarea=15, age=8, mfee=29, beds=4)
predictions <- predict(lm_three, newdata = new, interval = "prediction", level = 0.95, se.fit = TRUE)
predictions

se_fit <- predictions$se.fit
residual_se <- predictions$residual.scale

se_prediction <- sqrt(se_fit^2 + residual_se^2)