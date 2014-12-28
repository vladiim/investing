data.getPriceStats <- function( qcode, collapse, price_name ) {
  d      <- data.getPrice( qcode, collapse )
  d.stat <- data.getStats( d, price_name )
  read.zoo( d.stat )
}

data.getPrice <- function( qcode, collapse ) {
  d          <- Quandl( qcode, collapse = collapse )
  names( d ) <- normVarNames( names( d ) )
  arrange( d, date )
}

data.getStats <- function( d, price_name ) {
  returns    <- data.getReturns( d, price_name )
  volitility <- data.getVolitility( d, price_name )
  price      <- d[ , price_name ]
  data.frame( date = d$date, returns = returns, price = price, volitility = volitility )
}

data.getReturns <- function( d, price_name ) {
  d.zoo <- read.zoo( d )
  c( NA, rollapply( d.zoo, 2, diff )[ , price_name ] )
}

data.getVolitility <- function( d, price_name ) {
  d.zoo <- read.zoo( d )
  c( NA, rollapply( d.zoo, 2, sd )[ , price_name ] )
}

# data.get.allAssets <- function() {
#   sandp <- data.clean.sAndP500()
#   rbind( sandp, data.clean.dow(), data.clean.eafe(), data.clean.US3Tbills() )
# }

# ------ ASX large cap

data.get.asxLargeCap.annual <- memoise( function( qcode = 'YAHOO/INDEX_AXJO' ) {
  d <- data.getPriceStats( qcode, 'annual', 'adjusted_close' )
  # d$asset = 'ASX S&P 200'
  d
} )

# # ------ S&P 500
# data.get.sAndP500 <- function( qcode = 'YAHOO/INDEX_GSPC' ) {
#   data.get.priceAndReturn( qcode )
# }

# data.clean.sAndP500 <- function() {
#   d <- data.getAndCleanCSV( 'sp500' )
#   d$asset = 'S&P 500'
#   d
# }

# data.dist.sAndP500 <- function() {
#   d <- data.clean.sAndP500()$close
#   data.frame( dist = round( d, digits = 2 ) )
# }

# # ------ Dow
# data.get.dow <- function( qcode = 'BCB/UDJIAD1' ) {
#   data.get.priceAndReturn( qcode )
# }

# data.clean.dow <- function() {
#   d <- data.getAndCleanCSV( 'dow' )
#   d$asset = 'Dow'
#   d
# }

# # ------ Morgan Stanley Europe Australasia Far East
# data.get.eafe <- function( qcode = 'EOD/EFU' ) {
#   data.get.priceAndReturn( qcode )
# }

# data.clean.eafe <- function() {
#   d <- data.getAndCleanCSV( 'eafe' )
#   d$asset = 'EAFE'
#   d
# }

# # ------ US 3-month T-Bills
# data.get.US3Tbills <- function( qcode = 'FRED/DTB3' ) {
#   data.get.priceAndReturn( qcode )
# }

# data.clean.US3Tbills <- function() {
#   d <- data.getAndCleanCSV( 'us.3.tbills' )
#   d$asset = 'US 3M T-Bills'
#   d
# }