data.get.priceAndReturn <- function( qcode ) {
  d          <- data.get.price( qcode )
  names( d ) <- normVarNames( names( d ) )
  d          <- arrange( d, date )
  annual_return   <- try( ROC( d$close, type = 'discrete' ), silent = TRUE )

  if ( class( annual_return ) == 'try-error' ) {
    annual_return <- try( ROC( d$value, type = 'discrete' ), silent = TRUE )
  }
  if ( class( annual_return ) == 'try-error' ) {
    annual_return <- try( ROC( d$adj_close, type = 'discrete' ), silent = TRUE )
  }
  d
}

data.get.price <- function( qcode ) {
  Quandl( qcode )
}

data.get.allAssets <- function() {
  sandp <- data.clean.sAndP500()
  rbind( sandp, data.clean.dow(), data.clean.eafe(), data.clean.US3Tbills() )
}

# ------ ASX large cap

data.get.asxLargeCap <- memoise( function( qcode = 'YAHOO/INDEX_AXJO' ) {
  d <- data.get.priceAndReturn( qcode )
  d$asset = 'ASX S&P 200'
  d
} )

# ------ S&P 500
data.get.sAndP500 <- function( qcode = 'YAHOO/INDEX_GSPC' ) {
  data.get.priceAndReturn( qcode )
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
data.get.dow <- function( qcode = 'BCB/UDJIAD1' ) {
  data.get.priceAndReturn( qcode )
}

data.clean.dow <- function() {
  d <- data.getAndCleanCSV( 'dow' )
  d$asset = 'Dow'
  d
}

# ------ Morgan Stanley Europe Australasia Far East
data.get.eafe <- function( qcode = 'EOD/EFU' ) {
  data.get.priceAndReturn( qcode )
}

data.clean.eafe <- function() {
  d <- data.getAndCleanCSV( 'eafe' )
  d$asset = 'EAFE'
  d
}

# ------ US 3-month T-Bills
data.get.US3Tbills <- function( qcode = 'FRED/DTB3' ) {
  data.get.priceAndReturn( qcode )
}

data.clean.US3Tbills <- function() {
  d <- data.getAndCleanCSV( 'us.3.tbills' )
  d$asset = 'US 3M T-Bills'
  d
}