# exercice 4
# Création du tableau
citron_data <- data.frame(
  "Essai_numero" = 1:12,
  "Resistance_a_la_rupture" = c(37.8, 22.5, 17.1, 10.8, 7.2, 42.3, 30.2, 19.4, 14.8, 9.5, 32.4, 21.6), # nolint
  "Epaisseur_du_materiau_x1" = c(4, 4, 3, 2, 1, 6, 4, 4, 1, 1, 3, 4),
  "Densite_x2" = c(4, 3.6, 3.1, 3.2, 3.0, 3.8, 3.8, 2.9, 3.8, 2.8, 3.4, 2.8)
)

# compléter le tableau avec R
#Carré moyen résziduel regression due à x1

#carré moyen résiduel regression due à x2

# carré moyen résiduel regression due à x1 et x2

#Ecart type des résidus de la régression due à x1

#Ecart type des résidus de la régression due à x2

#Ecart type des résidus de la régression due à x1 et x2

# Linear regression models
model_x1 <- lm(Resistance_a_la_rupture ~ Epaisseur_du_materiau_x1, data = citron_data)
model_x2 <- lm(Resistance_a_la_rupture ~ Densite_x2, data = citron_data)
model_x1_x2 <- lm(Resistance_a_la_rupture ~ Epaisseur_du_materiau_x1 + Densite_x2, data = citron_data)

# Mean square residual
msr_x1 <- mean(resid(model_x1)^2)
msr_x2 <- mean(resid(model_x2)^2)
msr_x1_x2 <- mean(resid(model_x1_x2)^2)

# Standard deviation of residuals
sd_resid_x1 <- sd(resid(model_x1))
sd_resid_x2 <- sd(resid(model_x2))
sd_resid_x1_x2 <- sd(resid(model_x1_x2))

# Print results
#print(paste("Mean square residual due to x1: ", msr_x1))
#print(paste("Mean square residual due to x2: ", msr_x2))
#print(paste("Mean square residual due to x1 and x2: ", msr_x1_x2))
#print(paste("Standard deviation of residuals due to x1: ", sd_resid_x1))
#print(paste("Standard deviation of residuals due to x2: ", sd_resid_x2))
#print(paste("Standard deviation of residuals due to x1 and x2: ", sd_resid_x1_x2))

# Linear regression model
model_x1_x2 <- lm(Resistance_a_la_rupture ~ Epaisseur_du_materiau_x1 + Densite_x2, data = citron_data)

# ANOVA table
anova_table <- anova(model_x1_x2)

# Print the ANOVA table
#print(anova_table)

# Linear regression models
model_x1 <- lm(Resistance_a_la_rupture ~ Epaisseur_du_materiau_x1, data = citron_data)
model_x2 <- lm(Resistance_a_la_rupture ~ Densite_x2, data = citron_data)
model_x1_x2 <- lm(Resistance_a_la_rupture ~ Epaisseur_du_materiau_x1 + Densite_x2, data = citron_data)

# F statistic for each model
f_statistic_x1 <- summary(model_x1)$fstatistic[1]
f_statistic_x2 <- summary(model_x2)$fstatistic[1]
f_statistic_x1_x2 <- summary(model_x1_x2)$fstatistic[1]

# Print the F statistic for each model
#print(paste("F statistic for model_x1: ", f_statistic_x1))
#print(paste("F statistic for model_x2: ", f_statistic_x2))
#print(paste("F statistic for model_x1_x2: ", f_statistic_x1_x2))

# 95% confidence interval for β1 in model_x1
conf_int_x1 <- confint(model_x1, "Epaisseur_du_materiau_x1", level = 0.95)

# Print the confidence interval
#print(paste("95% confidence interval for β1 in model_x1: ", conf_int_x1))

# P-value for Epaisseur_du_materiau_x1 in model_x1
p_value_x1 <- summary(model_x1)$coefficients["Epaisseur_du_materiau_x1", "Pr(>|t|)"]

# Print the p-value
#print(paste("P-value for Epaisseur_du_materiau_x1 in model_x1: ", p_value_x1))


# Import the necessary package
library(stats)

# Create a data frame with the new data
new_data <- data.frame(Epaisseur_X1 = c(4, 3, 4), Densite_X2 = c(3.8, 3.4, 2.9))

# Generate predictions
predictions <- predict(model_x1_x2, newdata = new_data)

# Print the predictions
print(paste("Predicted rupture resistance: ", predictions))