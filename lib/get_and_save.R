# helper function
save.asset <- function( d, asset ) {
  write.csv( d, file = paste0( './data/', asset, '.csv' ) )
}

# asset getters

save.sAndP500 <- function() {
  save.asset( data.get.sAndP500(), 'sp500' )
}

save.nasdaq <- function() {
  save.asset( data.get.nasdaq(), 'nasdaq' )
}