data.get.priceAndPerc <- function( qcode ) {
  perc_change <- data.get.perc_change( qcode )
  price <- data.get.price( qcode )
  data.frame( date = price$Date, price = price$Value, perc_change = c( 0, perc_change$Value ) )
}

data.get.perc_change <- function( qcode ) {
  Quandl( qcode, transformation = 'rdiff', collapse = 'annual')
}

data.get.price <- function( qcode ) {
  Quandl( qcode, collapse = 'annual')
}

data.get.allAssets <- function() {
  rbind( data.clean.sAndP500(), data.clean.dow(), data.clean.US3Tbills() )
}

# ------ S&P 500
data.get.sAndP500 <- function( qcode = 'YAHOO/INDEX_GSPC' ) {
  perc_change <- data.get.perc_change( qcode )
  price <- data.get.price( qcode )
  data.frame( date = price$Date, price = price$Close, perc_change = c( 0, perc_change$Close ) )
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

# ------ Dow
data.get.dow <- function() {
  data.get.priceAndPerc( 'BCB/UDJIAD1' )
}

data.clean.dow <- function() {
  d <- data.getAndCleanCSV( 'dow' )
  d$asset = 'Dow'
  d
}

# ------ US 3-month T-Bills
data.get.US3Tbills <- function() {
  data.get.priceAndPerc( 'FRED/DTB3' )
}

data.clean.US3Tbills <- function() {
  d <- data.getAndCleanCSV( 'us.3.tbills' )
  d$asset = 'US 3M T-Bills'
  d
}