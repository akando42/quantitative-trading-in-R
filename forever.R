library(xts)
library(zoo)
library(quantmod)
library(highcharter)
library(jsonlite)
library(Quandl)

## Create a number sequence
ula_int <- seq(from =1, to=100)

## Create a Sequence of Time
ula_day <- seq(as.Date("2019-05-01"), 10, by="days")

## Getting Lyft Stock Symbol
lyft <- getSymbols("LYFT",src="yahoo", auto.assign=FALSE) 
this_month_lyft <- lyft["2019-06"]
last_lyft <- lyft["2019-06-07"]

## Getting Uber Stock Symbol
uber <- getSymbols("UBER", src="yahoo", auto.assign = FALSE)
this_year_uber <- uber["2019/"]
this_month_uber <- uber["2019-06/"]

## Netflix and Roku Stock
netflix <- getSymbols("NFLX", src="yahoo", auto.assign = FALSE)
roku <- getSymbols("ROKU", src="yahoo", auto.assign = FALSE)
weekly_netflix <- endpoints(netflix, on="weeks")

## Drawing Chart of Netflix with Highcharter
hchart(netflix)

## Using Quandl

results <- Quandl.datatable('SHARADAR/SF1', calendardate='2018-12-31', ticker='XOM,WMT,VZ')

## Getting Free Financial Statement from https://financialmodelingprep.com
getQuote <- function(ticker){
  url <- paste0("https://financialmodelingprep.com/api/v3/financials/income-statement/", ticker)
  response <- fromJSON(txt=url)
  return(response$financials)
}

cor(this_month_lyft, this_month_uber)

## Downloading Unemployment rate from Quandl 
Quandl.api_key('uTNL-qxDGezSWzQRRszn')
unrate <- Quandl(code="FRED/UNRATE", type="ts") 
unrate_rdiff <- Quandl(code="FRED/UNRATE", type="ts", transform = "rdiff") 

## Simple Moving Average - SMA


## Relative Strength Index - RSI


## CymaBay Therapeutics, Inc. (CBAY)
cbay <- getSymbols("CBAY")


