library(xts)
library(zoo)
library(quantmod)
library(quantstrat)
  
initStrategy <- function(initialDate, fromDate, toDate, portfolioName, portfolioSymbol, portfolioSize, tradeSize, sticker){
  getSymbols(sticker, src="yahoo", from=fromDate, to=toDate, adjust=TRUE)
  Sys.setenv(TZ="UTC")
  currency("USD")
  stock(currency="USD",sticker)
  strategy.st <- portfolio.st <- account.st <- portfolioName
  rm.strat(strategy.st)
  initPortf(portfolio.st, symbols = portfolioSymbol, initDate = initialDate, currency = "USD")
  initAcct(account.st, portfolios = portfolio.st, initDate = initialDate, currency="USD", initEq = portfolioSize)
  initOrders(portfolio.st, initDate = initialDate)
  strategy(strategy.st, store=TRUE)
  
  ## 200 Days Moving Average
  add.indicator( strategy = strategy.st, name = "SMA", arguments = list(x=quote(Cl(mktdata)),n=200),label = "SMA200")
  
  ## 50 Days Moving Average
  add.indicator( strategy = strategy.st, name = "SMA", arguments = list(x=quote(Cl(mktdata)),n=50),label = "SMA50")

  ## 3 Days Relative Strength Index
  add.indicator(strategy = strategy.st, name = "RSI", arguments = list(x=quote(Cl(mktdata)), n=3), label = "RSI_3")
}

indicatorChart <- function(sticker){
  sticker_sma <- SMA(x=Cl(sticker), n=200)  
  sticker_rsi <- RSI(price=Cl(sticker), n=3)
  plot(Cl(sticker))
  lines(sticker_sma, col = "blue" )
  lines(sticker_rsi, col = "red" )
}

initStrategy("2015-01-01", "2015-02-02", "2019-02-02", "MyPortfolio","MPI", 20000, 200, "NFLX")
indicatorChart("ROKU")
