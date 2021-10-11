
# Load required library
library(tidyquant)
options("getSymbols.warning4.0"=FALSE)
options("getSymbols.yahoo.warning"=FALSE)

get_date_from_yahoo <- function(tickers, start_date, end_date) {
 
  getSymbols( tickers
             ,from = start_date
             ,to = end_date
             ,warnings = FALSE
             ,auto.assign = TRUE)
  
  
 
  
  write.csv(AAPL,'data/raw_apple_Stock.csv')
  write.csv(GOOGL,'data/raw_google_Stock.csv')
  write.csv(TSLA,'data/raw_tesla_Stock.csv')
  
}

tickers = c("AAPL", "GOOGL", "TSLA")
start.date <- "2000-01-01"
today <- format(Sys.Date(), "%Y-%m-%d")
get_date_from_yahoo(tickers, start.date, today)


