data.get.allIndexes <- function() {
  rbind( data.clean.sAndP500() )
}

# ------ S&P 500
data.get.sAndP500 <- function() {
  Quandl( 'YAHOO/INDEX_GSPC', transformation = 'rdiff', collapse = 'annual')
}

data.clean.sAndP500 <- function() {
  d <- data.getAndCleanCSV( 'sp500' )
  d$index = 'S&P 500'
  d
}