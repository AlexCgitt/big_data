model <- lm(mpg ~ hp + wt + cyl, data = mtcars)

predctions <- predict(model, mtcars)
print(predctions)
plot(mtcars$mpg, predctions, main = "Prédictions vs. Valeurs réelles", xlab = "Valeurs réelles", ylab = "Prédictions", col = "blue", pch = 19)
abline(0, 1, col = "red")
print(summary(model))