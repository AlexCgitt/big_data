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