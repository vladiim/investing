data.getAndCleanCSV <- function( file ) {
  d <- read.csv( paste0( './data/', file, '.csv'), header = TRUE, sep = ',' )
  names( d ) <- normVarNames( names( d ) )
  d$date <- as.Date( d$date )
  # d$ticker <- as.character( d$ticker )
  d
}