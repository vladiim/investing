# graph.asset <- function( d = data, c = 'asset' ) {
#   ggplot( d, aes_string( x = 'date', y = 'close', colour = c ) ) +
#     geom_bar( stat = 'identity' ) +
#     theme_bw()
# }

graph.sAndP.date <- function() {
  # graph.asset( data.clean.sAndP500(), '' )
  d <- data.clean.sAndP500()
  ggplot( d, aes_string( x = 'date', y = 'close' ) ) +
    geom_bar( stat = 'identity' ) +
    theme_bw()
}

graph.sAndP.dist <- function() {
  d <- data.dist.sAndP500()
  ggplot( d, aes_string( x = 'dist' ) ) +
    geom_histogram() +
    scale_x_continuous( breaks = c( seq( -0.4, 0.5, by = 0.05 ) ), labels = percent  ) +
    theme_bw() +
    theme( axis.text.x = element_text( angle = 45, hjust = 1 ) )
}