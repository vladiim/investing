runReport <- function( name ) {
  input = paste0( './reports/templates/', name, '.Rmd' )
  output = paste0( './reports/output/', name, '_', vars.currentTime(), '.md' )
  knit( input, output )  
}

runReport.assets <- function() {
  runReport( 'assets' )
}