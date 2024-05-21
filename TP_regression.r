# exercice 1

# Création du tableau de données
data <- data.frame(
  region = 1:8,
  prix_produit_x = c(420, 380, 350, 400, 440, 380, 450, 420),
  nb_vente_y = c(5.5, 6, 6.5, 6, 5, 6.5, 4.5, 5)
)

# question 1 nuage de points
plot(data$prix_produit_x, data$nb_vente_y, xlab = "Prix du produit X", ylab = "Nombre de ventes", main = "Relation entre le prix du produit X et le nombre de ventes")

# question 2 effectuer la matrice de x en fonction de beta
X <- cbind(1, data$prix_produit_x)
print(X)


# question 3 en utilisant la méthode des moindres carrés ordinaires calculer 𝑏
b <- solve(t(X) %*% X) %*% t(X) %*% data$nb_vente_y #solve permet de résoudre un système d'équations linéaires.
# t est la transposée d'une matrice.
# que représente b par rapport à beta ?
# b est une estimation de beta.
print(b)

#question 4
#calculon sx², sy² et sxy
sx2 <- sum((data$prix_produit_x - mean(data$prix_produit_x))^2)/(length(data$prix_produit_x) - 1)
sy2 <- sum((data$nb_vente_y - mean(data$nb_vente_y))^2)/(length(data$nb_vente_y) - 1)
sxy <- sum((data$prix_produit_x - mean(data$prix_produit_x)) * (data$nb_vente_y - mean(data$nb_vente_y)))/(length(data$prix_produit_x) - 1)
# calculons b1 et b0
b1 <- sxy/sx2
b0 <- mean(data$nb_vente_y) - b1 * mean(data$prix_produit_x)
print(b1)
print(b0)

#retrouvons b0 et b1 à l'aide de lm et coef
model <- lm(nb_vente_y ~ prix_produit_x, data = data)
print(summary(model))
print(coef(model)) #coef permet de récupérer les coefficients du modèle.

#question 5
# tracer la droite de régression sur le nuage de points
abline(b0, b1, col = "red") #abline permet de tracer une droite sur un graphique.

#question 6
# calculons le coefficient de détermination
y_hat <- b0 + b1 * data$prix_produit_x
RSS <- sum((data$nb_vente_y - y_hat)^2)
TSS <- sum((data$nb_vente_y - mean(data$nb_vente_y))^2)
R2 <- 1 - RSS/TSS
print(R2)

#question 7 retrouver R2 à l'aide de summary fait à la question 4
#dans le summary, on a le min, 1er quartile, médiane, moyenne, 3ème quartile et max.
# on retrouve aussi les coefficients de la régression, l'erreur standard, la statistique de test (hypothèse de test) et la p-value qui est la probabilité d'observer une statistique de test aussi extrême que celle observée.



#Exercice 2

# question 1
# installation du package AER
#install.packages("AER")
#library(AER)

# question 2
# Charger et afficher les données CPS1985
data("CPS1985")
print(head(CPS1985)) #head permet d'afficher les premières lignes d'un tableau de données.
#on retrouve les variables suivantes: wage, educ, exper, age, ethnicité, region, gender, occupation, sector, maried, union, etc.

#question 3
ed <- CPS1985$education
exp <- CPS1985$experience
# Création du modèle de régression
model <- lm(wage ~ education + experience, data = CPS1985)
# Affichage des coefficients du modèle
# intercept = ordonnée à l'origine
print(coef(model))

#question 4
# même chose que la question 3 mais en utilisant le log de wage
model <- lm(log(wage) ~ education + experience, data = CPS1985)
print(coef(model))
#le log de wage est plus adapté pour la régression linéaire car il permet de réduire l'effet des valeurs extrêmes.

#question 5
#Donner le modèle en y incorporant une autre variable liée au genre
model <- lm(log(wage) ~ education + experience + gender, data = CPS1985)
# Affichage du résumé du modèle
summary_model <- summary(model)
print(summary_model)
print(coef(model))
# sans le gender notre coefficient R² est moins élevé que lorsque l'on met gender dans notre modèle.
#sans gender R² = 0.22 et avec gender R² = 0.26
#coefficient négatif montre qu'il y a une différence de salaire entre les hommes et les femmes. une discrimination salariale.

#question 6
# fe est une variable indicatrice, égale à 1 si l’individu est une femme et à 0 sinon
fe <- ifelse(CPS1985$gender == "female", 1, 0)
model_final <- lm(log(wage) ~ education + experience + experience^2 + fe, data = CPS1985)
summary_model_final <- summary(model_final)
print(summary_model_final)


#Exercice 3
# Création du tableau de données
automobile_data <- data.frame(
  U = c(40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150),
  V = c(9, 11, 20, 27, 39, 45, 58, 78, 79, 93, 108, 124)
)

# question 1
# Quelle variable devons-nous identifier comme variable dépendante ? Comme variable explicative ?
# U est la variable explicative et V est la variable dépendante.

# question 2
# Qu’est-ce qui peut renseigner l’entreprise sur la forme de liaison statistique qui peut exister entre ces deux variables ?
# Un nuage de points peut renseigner l'entreprise sur la forme de liaison statistique entre les deux variables.
plot(automobile_data$U, automobile_data$V, xlab = "U", ylab = "V", main = "Relation entre U et V")

#question 3
#Quelle méthode d’ajustement linéaire devons-nous utiliser pour obtenir les estimateurs des coefficients de la droite de régression ?
#Nous devons utiliser la méthode des moindres carrés ordinaires pour obtenir les estimateurs des coefficients de la droite de régression.

#question 4
# Ajustement du modèle de régression linéaire
model <- lm(V ~ U, data = automobile_data)
# Affichage des coefficients du modèle
print(coef(model))
# beta0 = -43,36  et beta1 = 1.06
b0 <- coef(model)[1] # physiquement pas de sens car on ne peut pas avoir un chemin de freinage négatif.
b1 <- coef(model)[2] #distance de freinage augmente de 1.06 mètres par km/h supplémentaire.


#question 5
# Donner une estimation ponctuelle de l'écart-type de l'erreur de régression
sigma <- summary(model)$sigma
print(sigma)
# dans le summary, sigma est l'écart-type de l'erreur de régression. (residual standard error)

#question 6
# Tracer la droite de régression sur le nuage de points
abline(model$coefficients, col = "red")

#question 7
# Calculer la variation totale, la variation expliquée par la droite des moindres carrés et la variation résiduelle.
# ESS = TSS - RSS
y_hat <- b0 + b1 * automobile_data$U
RSS <- sum((automobile_data$V - y_hat)^2)
TSS <- sum((automobile_data$V - mean(automobile_data$V))^2)
ESS <- TSS - RSS
cat("ESS: ", ESS, "\n")


# question 8
#  Quelle proportion de la variation totale du chemin de freinage est expliquée par la droite des moindres carrés ? Quelle proportion demeure inexpliquée par la droite ?
y_hat <- b0 + b1 * automobile_data$U
RSS <- sum((automobile_data$V - y_hat)^2)
cat("RSS: ", RSS, "\n")
TSS <- sum((automobile_data$V - mean(automobile_data$V))^2)
cat("TSS: ", TSS, "\n")
R2 <- 1 - RSS/TSS
cat("R2: ", R2, "\n")

# question 9
#Nous avions fixé le coefficient de détermination ajusté (R2 ajusté) à 0, 80 comme valeur minimale pour considérer la droite des moindres carrés d’utilité pratique. D’après les résultats obtenus, devrions-nous utliser la droite des moindres carrés comme outil de prévision ?
#R2 = 0.99 > 0.80, donc la droite des moindres carrés est d'utilité pratique pour la prévision.

# question 10
# Pour chaque niveau de vitesse suivant, estimer le chemin de freinage en mètres à l’aide de la droite des moindres carrés Ui 85 112 127 180 
U <- c(85, 112, 127, 180)
V_hat <- b0 + b1 * U
print(V_hat)

# question 11
# Donner un intervalle de confiance au niveau 95% pour la valeur moyenne de V lorsque U=127
predict(model, newdata = data.frame(U = 127), interval = "confidence", level = 0.95)
print(predict(model, newdata = data.frame(U = 127), interval = "confidence", level = 0.95))
#autre méthode
# Calcul de l'estimation de la moyenne
mean_hat <- coef(model)[1] + coef(model)[2] * 127

# Calcul de l'estimation de l'écart-type
sd_hat <- sqrt(sum(residuals(model)^2) / (length(automobile_data$U) - 2))

# Calcul de l'intervalle de confiance à 95%
confidence_interval <- c(mean_hat - 1.96 * sd_hat / sqrt(length(automobile_data$U)), mean_hat + 1.96 * sd_hat / sqrt(length(automobile_data$U)))

# Affichage de l'intervalle de confiance
print(confidence_interval)


# exercice 4
