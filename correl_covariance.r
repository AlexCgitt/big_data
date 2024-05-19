# Définir le nombre de clients
nombre_clients <- 48

# Définir l'âge moyen et l'écart-type
age_moyen <- 40
ecart_type <- 10

# Générer un échantillon aléatoire d'âges
ages <- rnorm(nombre_clients, mean = age_moyen, sd = ecart_type)

# Limiter les âges à l'intervalle [18, 65]
ages <- pmax(pmin(ages, 65), 18)

# Afficher les âges
print(ages)


#-------------------------------------------

set.seed(123)  # Pour la reproductibilité
age <- 18:65  # Âge de 18 à 65 ans
depenses <- 100 + 10 * (age - 18) + rnorm(length(age), mean=0, sd=50)  # Dépenses avec variation aléatoire

# Créons un dataframe
data <- data.frame(age, depenses)

# Affichage des premières lignes du dataframe
head(data)

#Calcul de la Covariance
covariance <- cov(data$age, data$depenses)
covariance

#Calcul de la Corrélation
correlation <- cor(data$age, data$depenses)
correlation

#Visualisation
plot(data$age, data$depenses, main="Relation entre l'âge et les dépenses en divertissement",
     xlab="Âge", ylab="Dépenses en divertissement", pch=19)