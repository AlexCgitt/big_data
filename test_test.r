#convertir des nombres en lettres.
nombre <- 123.45 
text <- as.character(nombre)
print(text) #le fait de voir des guillemets autour de la valeur indique que c'est une chaîne de caractères.


#convertir des lettres en nombres.
text <- "123.45"
nombre <- as.numeric(text)
print(nombre)

#convertir de vecteur à facteur.
vecteur <- c("haute", "moyenne", "basse")
facteur <- as.factor(vecteur)
print(facteur) # cela peut servir pour les données catégorielles.
# on remarque que c'est un facteur car il y a des niveaux.

#convertir de facteur à vecteur.
facteur <- factor(c("haute", "moyenne", "basse"))
vecteur <- as.character(facteur)
print(vecteur)
# le facteur est converti en vecteur car il n'y a plus de niveaux.

#convertir de caractère à date.
date_text <- "2023-01-01"
date <- as.Date(date_text, format="%Y-%m-%d")
print(date)

#convertir de date à caractère.
date <- as.Date("2023-01-01")
date_text <- format(date, "%d/%m/%Y")
print(date_text)

#Exercice : Manipulation et conversion de données en R
#Etape 1
donnees <- data.frame(
    Date_commande = c("2023-04-01", "2023-04-02", NA, "2023-04-04"),
    ClientID = c("001", "002", "003", NA),
    Montant_total = c("150.50", 99.99, "200", "NA"),
    stringsAsFactors = FALSE
)

#convertire les dates de commande en format date.
donnees$Date_commande <- as.Date(donnees$Date_commande, format = "%Y-%m-%d")
#convertire l'identifiant du client en caractère.
donnees$ClientID <- as.character(donnees$ClientID)
#convertire le montant total en numérique.
donnees$Montant_total <- as.numeric(donnees$Montant_total)


#Etape 2
#Remplacer les valeurs NA dans clientID par le texte "inconnu".
donnees$ClientID[is.na(donnees$ClientID)] <- "inconnu"
#Remplacer les valeurs NA dans montant total par la moyenne des montant total disponibles.
donnees$Montant_total[is.na(donnees$Montant_total)] <- mean(donnees$Montant_total, na.rm = TRUE)
#pour les dates de commande manquantes, les remplacer par la date du jour précédent plus un jour.
donnees$Date_commande <- ifelse(is.na(donnees$Date_commande), Sys.Date()-1, donnees$Date_commande)#Sys.Date() donne la date du jour.

#Etape 3
#creez une nouvelle colonne StatutCommande basée sur montant total : si le montant est supétieur à la moyenne de tous les montant marquez cette commande comme "Elevée", sinon "Normale".
donnees$StatutCommande <- ifelse(donnees$Montant_total > mean(donnees$Montant_total, na.rm = TRUE), "Elevée", "Normale")

#afficher les données.
print(donnees)