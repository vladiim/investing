data.get.asset <- function( qcode ) {
  Quandl( qcode, transformation = 'rdiff', collapse = 'annual')
}

data.get.allAssets <- function() {
  rbind( data.clean.sAndP500() )
}

# ------ S&P 500
data.get.sAndP500 <- function() {
  data.get.asset( 'YAHOO/INDEX_GSPC' )
}

data.clean.sAndP500 <- function() {
  d <- data.getAndCleanCSV( 'sp500' )
  d$asset = 'S&P 500'
  d
}

data.dist.sAndP500 <- function() {
  d <- data.clean.sAndP500()$close
  data.frame( dist = round( d, digits = 2 ) )
}

# ------ Nasdaq
data.get.nasdaq <- function() {
  data.get.asset( 'NASDAQOMX/COMP' )
}