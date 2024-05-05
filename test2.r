x <- 2+4 # nolint
y <-36/5 # nolint
z <- sqrt(4) # nolint
var <- 3 * sqrt(4) + pi
mystere <- var / 0


tmp <- 7 / 2
resultat <- floor(tmp)
reste <- 7 - 2*resultat # nolint: infix_spaces_linter.

resultat2 <- 7 %/% 2
reste2 <- 7 %% 2

pipi <- floor(pi)

print(tmp)
print(resultat2)
print(reste2)
print(pipi)

x <- 10
y <- 20
logiq <- x > y

print(logiq)

x <- T
y <- F
v1 <- x && y
v2 <- x || y
v3 <- v2 && !v1
print(v3)

x <- T
y <- F
z <- F
v1 <- y && z || x
v2 <- y && (z || x)
logiq <- v1 == v2

print(logiq)

txt <- "un texte"
print(class(txt))

print(is.character(txt))
print(is.numeric(txt))

txt <- '42'
nbr <- as.integer(txt)
print(is.numeric(nbr))


mot <- "petite"
text1 <- paste("une", mot, "phrase")
text2 <- paste(text1, "compte", nchar(text1), "lettres")
print(text1)
print(text2)

tmp <- 3 / 0
nsp <- NA
resultat <- paste(tmp, tmp+1, tmp+nsp)
print(resultat)

vecteur1 <- c(1, 3, 5, 7, 9)
vecteur2 <- seq(from=0, to=10, by=2)
vecteur3 <- 0:10
vecteur4 <- rep(1:2, 5)

print(vecteur1)
print(vecteur2)
print(vecteur3)
print(vecteur4)

vecteur <- rnorm(10)
for (i in 1:length(vecteur))
print(vecteur[i])

v1 <- runif(10)
v2 <- rpois(10, 12)
v3 <- rnorm(10)
matrice <- rbind(v1, v2, v3)
print(matrice)

v1 <- c(175, 182, 165, 187, 158)
v2 <- c(19, 18, 21, 22, 20)
tableau <- data.frame(taille=v1,age=v2)
names(tableau)
print(tableau$taille)
summary(tableau)
write.table(tableau, "sortie.csv", sep=";")
