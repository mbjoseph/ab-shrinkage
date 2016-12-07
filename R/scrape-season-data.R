# fetches nba season data from 1950 to 2016
if (!file.exists("data/all_years.csv")) {
  library(bbr)
  library(dplyr)
  years <- 1951:2016
  d <- list()
  for (i in seq_along(years)) {
    d[[i]] <- get_season(years[i])
  }
  d %>%
    bind_rows() %>%
    write.csv("data/all_years.csv", row.names = FALSE)
} 
d <- read.csv("data/all_years.csv", stringsAsFactors = FALSE)
