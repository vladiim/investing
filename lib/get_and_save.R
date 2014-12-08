# helper function
save.asset <- function( d, asset ) {
  write.csv( d, file = paste0( './data/', asset, '.csv' ) )
}

# asset getters

save.sAndP500 <- function() {
  save.asset( data.get.sAndP500(), 'sp500' )
}

save.dow <- function() {
  save.asset( data.get.dow(), 'dow' )
}

save.eafe <- function() {
  save.asset( data.get.eafe(), 'eafe' )
}

save.US3Tbills <- function() {
  save.asset( data.get.US3Tbills(), 'us.3.tbills' )
}