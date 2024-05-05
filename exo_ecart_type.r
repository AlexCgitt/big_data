dates_commande <- c(60, 56, 61, 68, 51, 53, 69, 54)

#moyenne <- mean(dates_commande)
#ecart_type <- sd(dates_commande)

# Calculer la moyenne
moyenne <- mean(dates_commande)

# Calculer les écarts à la moyenne
ecarts <- dates_commande - moyenne

# Calculer les carrés des écarts
ecarts_carres <- ecarts^2

# Calculer la somme des carrés des écarts
somme_ecarts_carres <- sum(ecarts_carres)

# Calculer la variance (somme des carrés des écarts divisée par (n-1))
variance <- somme_ecarts_carres / (length(dates_commande) - 1)

# Calculer la racine carrée de la variance (c'est l'écart type)
ecart_type <- sqrt(variance)

print(ecart_type)