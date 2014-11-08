stats.all <- function( d = data ) {
  group_by( data, asset ) %>%
    mutate( sd_perc_change = sd( perc_change ) ) %>%
    mutate( sd_price = sd( price ) ) %>%
    group_by( asset, sd_perc_change, sd_price ) %>%
    summarise( years = year( max( date ) ) - year( min( date ) ) )
}