# Define the data as a single string
data_string <- "
\"Predicted\" \"Actual\" \"Status\"
4.55 -4.66 1
2.82 -1.1 1
2.13 -2.01 1
2.06 -3.22 1
3.2 -1.36 1
2.26 -2.09 1
2.07 -3.68 1
3.6 -3.08 1
2.09 -4.17 1
2.7 -2.87 1
2.08 -4.21 1
2.65 -3.86 1
1.58 -3.03 1
2.83 -4.07 1
2.03 -2.3 1
3.68 -2.46 1
2.99 -4.52 1
4.25 -1.22 1
4.09 -3.21 1
2.47 -3.09 1
1.52 -3.1 1
2.67 -2.36 1
1.71 -3.18 1
2.5 -1.61 1
2.81 -3.18 1
3.45 -4.88 1
3.06 -1.07 1
2.93 -2.92 1
2.05 -3.56 1
0.99 -4.66 2
2.69 -1.1 2
2.25 -2.01 2
0.45 -3.22 2
0.53 -1.36 2
0.71 -2.09 2
0.18 -3.68 2
2.99 -3.08 2
0.86 -4.17 2
1.88 -2.87 2
2.06 -4.21 2
2.5 -3.86 2
3.68 -3.03 2
2.94 -4.07 2
-0.66 -2.3 2
3.87 -2.46 2
2.39 -4.52 2
0.81 -1.22 2
2.62 -3.21 2
0.45 -3.09 2
1.81 -3.1 2
1.82 -2.36 2
"

# Read the string into a dataframe
# header = TRUE tells R the first line is the column names
df <- read.table(text = data_string, header = TRUE)

# Print the first few rows to check
print(head(df))

model <- lm(Predicted ~ Actual, data=df)
summary(model)$r.squared

model2 <- lm(Predicted ~ Actual + Status, data=df)
summary(model2)$coefficients[3,4]

model3 <- lm(Predicted ~ Actual*Status, data=df)
summary(model3)$coefficients[4,4]
