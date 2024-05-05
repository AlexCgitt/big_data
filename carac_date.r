date_chaine <- "2023-01-01"
date <- as.Date(date_chaine, format="%Y-%m-%d")

print(date)

date <- as.Date("2023-01-01", format="%Y-%m-%d")
date_chaine <- format(date, "%Y-%m-%d")

print(date_chaine)