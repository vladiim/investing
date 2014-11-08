save.sAndP500.annual <- function() {
  write.csv( data.get.sAndP500(), file = './data/sp500.csv' )
}