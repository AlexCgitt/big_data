# Patient
# Patient Heures de Sommeils (x)  Niveau de sucre (mg/dL) (y)
# 1 7 90
# 2 6 95
# 3 8 85
# 4 5 100
# 5 7 90
# 6 7 88
# 7 6.5 92
# 8 8.5 84
# 9 5.5 98
# 10 6 93

patient <- data.frame(
    HeuresSommeil = c(7, 6, 8, 5, 7, 7, 6.5, 8.5, 5.5, 6),
    NiveauSucre = c(90, 95, 85, 100, 90, 88, 92, 84, 98, 93)
)

regression <- lm(NiveauSucre ~ HeuresSommeil, data = patient)

plot(patient$HeuresSommeil, patient$NiveauSucre,
    main = "Niveau de sucre en fonction des heures de sommeil",
    xlab = "Heures de sommeil", ylab = "Niveau de sucre", cex = 2 # cex sert à augmenter la taille des points
)
abline(regression, col = "red")