#install.packages('prophet')


library(prophet)
library(tidyverse)

companies <- c("GOOGLE", "APPLE", "TESLA")

# Load the dataset
stock.df <- read.csv(file="data/all_company_close_stock.csv")
head(stock.df)
tail(stock.df)


# Preparing data set for google
google.df <- stock.df[stock.df$Company.Name == "GOOGLE", ]
head(google.df)


google.df <- google.df[, c('Date', 'Close')]
colnames(google.df) <- c('ds', 'y')
head(google.df)


# Creating model
model <- prophet(google.df)


# Creating data-frame for forecast
future.df <- make_future_dataframe(model, periods = 365)
tail(future.df)

# Forecast
forecast.google <- predict(model, future.df)
tail(forecast.google[c("ds", "yhat", "yhat_lower", "yhat_upper")])

# Plot the model
dyplot.prophet(model, forecast.google)
prophet_plot_components(model, forecast.google)


