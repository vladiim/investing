# ------ Helper functions

data.getPriceStats <- function( qcode, collapse, price_name ) {
  d      <- data.getPrice( qcode, collapse )
  d.stat <- data.getStats( d, price_name )
  as.xts( read.zoo( d.stat ), dateFormat = 'Date' )
}

data.getPrice <- function( qcode, collapse ) {
  d          <- Quandl( qcode, collapse = collapse )
  names( d ) <- normVarNames( names( d ) )
  arrange( d, date )
}

data.getStats <- function( d, price_name ) {
  returns    <- data.getReturns( d, price_name )
  # volitility <- data.getVolitility( d, price_name )
  # price      <- d[ , price_name ]
  # data.frame( index = d$date, returns = returns, price = price, volitility = volitility )
  data.frame( index = d$date, returns = returns )
}

data.getReturns <- function( d, price_name ) {
  d.zoo <- read.zoo( d )
  r.zoo <- Return.calculate( d.zoo[, price_name] )
  data.frame( r.zoo )$r.zoo
}

data.getVolitility <- function( d, price_name ) {
  d.zoo <- read.zoo( d )
  c( NA, rollapply( d.zoo, 2, sd )[ , price_name ] )
}

# ------ ASX large cap

data.get.asxLargeCap.annual <- memoise( function( qcode = 'YAHOO/INDEX_AXJO' ) {
  d <- data.getPriceStats( qcode, 'annual', 'adjusted_close' )
  names( d )[1] <- 'asx_large_cap'
  d
} )

# # ------ US total market

data.get.usTotalMarket.LargeCap.annual <- memoise( function( qcode = 'EOD/VTI' ) {
  d <- data.getPriceStats( qcode, 'annual', 'close' )
  names( d )[1] <- 'us_large_cap'
  d
} )

