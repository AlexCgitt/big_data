# Charger le jeu de données
maladie_cardiaque <- read.csv("maladie_cardiaque.csv", sep = ";")

# Créer le modèle de régression logistique
modele <- glm(maladie_cardiaque ~ age + sexe + cholesterol + bp_systolic + fumeur, 
              data = maladie_cardiaque, family = binomial)

# Afficher le résumé du modèle
print(summary(modele))