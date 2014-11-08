graph.asset <- function( d = data ) {
  ggplot( d, aes_string( x = 'date', y = 'perc_change', fill = 'asset' ) ) +
    geom_bar( stat = 'identity', position = 'dodge' ) +
    theme_bw()
}

# S&P 500
graph.date.sAndP <- function() {
  graph.asset( data.clean.sAndP500() )
}

graph.dist.sAndP <- function() {
  d <- data.dist.sAndP500()
  ggplot( d, aes_string( x = 'dist' ) ) +
    geom_histogram() +
    scale_x_continuous( breaks = c( seq( -0.4, 0.5, by = 0.05 ) ), labels = percent  ) +
    theme_bw() +
    theme( axis.text.x = element_text( angle = 45, hjust = 1 ) )
}

# Dow
graph.date.dow <- function() {
  graph.asset( data.clean.dow() )
}

# US 3m T-bill
graph.date.US3Tbills <- function() {
  graph.asset( data.clean.US3Tbills() )
}