
# Load required library
library(tidyquant)
options("getSymbols.warning4.0"=FALSE)
options("getSymbols.yahoo.warning"=FALSE)

get_date_from_yahoo <- function(tickers, start_date, end_date) {
 
  getSymbols( tickers
             ,from = start_date
             ,to = end_date
             ,warnings = FALSE
             ,auto.assign = TRUE
             , src = "yahoo")
  
  
 
  apple_df <-data.frame(AAPL)
  apple_df$Date<-rownames(apple_df)
  rownames(apple_df)<-NULL 
  write.csv(apple_df,'data/raw_apple_Stock.csv')
  
  google_df <-data.frame(GOOGL)
  google_df$Date<-rownames(google_df)
  rownames(google_df)<-NULL
  write.csv(google_df,'data/raw_google_Stock.csv')
  
  tesla_df <-data.frame(TSLA)
  tesla_df$Date<-rownames(tesla_df)
  rownames(tesla_df)<-NULL
  write.csv(tesla_df,'data/raw_tesla_Stock.csv')
  
}

tickers = c("AAPL", "GOOGL", "TSLA")
start.date <- "2000-01-01"
today <- format(Sys.Date(), "%Y-%m-%d")
get_date_from_yahoo(tickers, start.date, today)
