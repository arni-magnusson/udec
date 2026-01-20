library(openxlsx)
sheet1 <- read.xlsx("../data-raw/BKC_project_MB&SF.xlsx", sheet=1)
lixi1 <- read.xlsx("../data-raw/LIXIVIACIÓN.xlsx", sheet=1,
                   rows=80:95, cols=3:12)
milton <- read.xlsx("../data-raw/Fishery_base_Milton_Montufar.xlsx", sheet=1)

library(readxl)
also1 <- read_excel("../data-raw/BKC_project_MB&SF.xlsx", sheet=1)
aswell1 <- read_excel("../data-raw/LIXIVIACIÓN.xlsx", sheet=1,
                      range="C80:L95")

# Verify integrity of CSV files
HembrasTot <- read.csv("../data/HembrasTot.csv")
