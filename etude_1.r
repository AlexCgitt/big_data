
patient <- data.frame(
    Heuresdesommeil = c(7, 6, 8, 5, 7, 7, 6.5, 8.5, 5.5, 6),
    Niveaudesucre = c(90, 95, 85, 100, 90, 88, 92, 84, 98, 93)
)

n <- length(patient$Heuresdesommeil)
x_ <- mean(patient$Heuresdesommeil)
y_ <- mean(patient$Niveaudesucre)
sxy <- sum((patient$Heuresdesommeil - x_) * (patient$Niveaudesucre - y_)) / (n - 1)
sx2 <- sum((patient$Heuresdesommeil - x_)^2) / (n - 1)

b1 <- sxy / sx2
b0 <- y_ - b1 * x_

cat("sxy: ", sxy, "\n")
cat("sx2: ", sx2, "\n\n")
cat("b0: ", b0, "\n")
cat("b1: ", b1, "\n\n")

plot(patient$Heuresdesommeil, patient$Niveaudesucre,
    main = "Niveau de sucre en fonction des heures de sommeil",
    xlab = "Heures de sommeil", ylab = "Niveau de sucre", cex = 2
)
abline(b0, b1, col = "red")

rss <- sum((patient$Niveaudesucre - (b0 + b1 * patient$Heuresdesommeil))^2)
tss <- sum((patient$Niveaudesucre - y_)^2)
r2 <- 1 - rss / tss
cat("RSS: ", rss, "\n")
cat("TSS: ", tss, "\n")
cat("R2: ", r2, "\n")