library(xts)
library(zoo)
library(quantmod)
library(quantstrat)
  
initStrategy <- function(initialDate, fromDate, toDate, portfolioName, portfolioSymbol, portfolioSize, tradeSize, sticker){
  getSymbols(sticker, src="yahoo", from=fromDate, to=toDate, adjust=TRUE)
  stock(sticker, currency="USD")
  strategy.st <- portfolio.st <- account.st <- portfolioName
  rm.strat(strategy.st)
  initPortf(portfolio.st, symbols = portfolioSymbol, initDate = initialDate, currency = "USD")
  initAcct(account.st, portfolios = portfolio.st, initDate = initialDate, currency="USD", initEq = portfolioSize)
  initOrders(portfolio.st, initDate = initialDate)
  strategy(strategy.st, store=TRUE)
}
