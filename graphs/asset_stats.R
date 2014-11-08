stats.all <- function( d = data ) {
  stats <- with( d, data.frame(
    asset = asset,
    start = min( date ),
    finish = max( date ),
    years = year( max( date ) ) - year( min( date ) ),
    sd = sd( close )
  ) )
  unique( stats )
}