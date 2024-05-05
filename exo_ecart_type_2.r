# Créer un vecteur avec les réponses des fermiers
reponses <- c(4, 5, 6, 5, 3, 2, 8, 0, 4, 6, 7, 8, 4, 5, 7, 9, 8, 6, 7, 5, 5, 4, 2, 1, 9, 3, 3, 4, 6, 4)

ecart_type_population <- sd(reponses)

print(ecart_type_population)
# on est dans le cas d'un echantillon car on a les réponses de 30 fermiers et non de tous les fermiers de la population entière