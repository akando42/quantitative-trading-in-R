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
}

initStrategy("2018-01-01", "2018-02-02", "2019-02-02", "MyPortfolio","MPI", 20000, 200, "ROKU")