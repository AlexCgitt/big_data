df <- data.frame(
  DatesCommande = as.Date(c("2023-04-01", "2023-04-02", NA, "2023-04-04"), format="%Y-%m-%d"),
  ClientID = as.character(c("001", 002, "003", NA)),
  MontantTotal = as.numeric(c("150.50", 99.99, "200.00", NA))
)

df$ClientID[is.na(df$ClientID)] <- "Inconnu"

moyenne <- mean(df$MontantTotal, na.rm = TRUE) #na.rm = TRUE permet de ne pas prendre en compte les valeurs NA
df$MontantTotal[is.na(df$MontantTotal)] <- moyenne


for (x in 1:length(df$DatesCommande)) { #1:length(df$DatesCommande) permet de parcourir toutes les lignes de la colonne DatesCommande
    if (is.na(df$DatesCommande[x])) {
        df$DatesCommande[x] <- df$DatesCommande[x-1] + 1
    }
}

print(df)