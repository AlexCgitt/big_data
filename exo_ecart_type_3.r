# Créer un dataframe avec les données
heure <- c(rep(12,2), rep(17,12), rep(22, 23), rep(27,60), rep(32,77), rep(37,38), rep(42,8)) #rep sert à répéter un nombre un certain nombre de fois et c est pour concaténer les vecteurs


ecart_type <- sd(heure)
print(ecart_type)

