library(psych)
library(writexl)
library(babynames)

# 1. Easter egg!
?write_xlsx


# browseVignettes()
browseVignettes(package = 'dplyr')
browseVignettes(package = 'tidyverse')


# How many datasets?
data(package = 'babynames')


# Learn more about lifetables dataset
?lifetables
View(lifetables)

summary(lifetables)
describe(lifetables)


write_xlsx(lifetables, "/lifetables.xlsx", col_names = FALSE)
