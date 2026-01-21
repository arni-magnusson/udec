library(openxlsx)
library(readxl)
library(tidyr)
library(dplyr)

# Import using openxlsx
sheet1 <- read.xlsx("../data-raw/BKC_project_MB&SF.xlsx", sheet=1)
lixi1 <- read.xlsx("../data-raw/LIXIVIACIÓN.xlsx", sheet=1, rows=80:95,
                   cols=3:12)
milton <- read.xlsx("../data-raw/Fishery_base_Milton_Montufar.xlsx", sheet=1)
libro2 <- read.xlsx("../data-raw/Libro 2.xlsx")

# Import using readxl
also1 <- read_excel("../data-raw/BKC_project_MB&SF.xlsx", sheet=1)
lixi2 <- read_excel("../data-raw/LIXIVIACIÓN.xlsx", sheet=1, range="C80:L95")

################################################################################

# Reshape lixiviación dataset
lixi2 <- lixi2 |> gather(Treatment, Measurement, -c(Tiempo))

lixi2 <-
lixi2 |>
  mutate(
    Replicate = rep(rep(c(1,2,3), each = nrow(lixi2)/9), 3),
    Treatment = case_when(
      Treatment %in% c("...3","...4") ~ "Control",
      Treatment %in% c("...6","...7") ~ "IER",
      Treatment %in% c("...9","...10") ~ "IEQ",
      .default = Treatment
    )
  ) |>
  as.data.frame()

# Compare lixi2 and libro2

################################################################################

# Verify integrity of CSV files
HembrasTot <- read.csv("../data/HembrasTot.csv")
