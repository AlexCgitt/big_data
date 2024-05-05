dates_commande <- c("2023-04-01", "2023-04-02", NA, "2023-04-04")
dates_commande <- as.Date(dates_commande, format="%Y-%m-%d")

print(dates_commande)

ClientID <- c("001", 002, "003", NA)
ClientID <- as.character(ClientID)

print(ClientID)

montant_total <- c("150.50", 99.99, "200.00", NA)
montant_total <- as.numeric(montant_total)

print(montant_total)