analysis.compareReturns <- function( a, b ) PerformanceAnalytics::ActiveReturn( a, b )

analysis.drawDown <- function( d = data.get.all.annual() ) {
  average  = PerformanceAnalytics::AverageDrawdown( d )
  average  = PerformanceAnalytics::maxDrawdown( d )
  length   = PerformanceAnalytics::AverageLength( d )
  recovery = PerformanceAnalytics::AverageRecovery( d )
  rbind( average, length, recovery )
}

analysis.ratios <- function( d = data.get.all.annual(), rf_rate = 0 ) {
  sharpe  = PerformanceAnalytics::SharpeRatio( d, Rf = rf_rate )
  upside  = PerformanceAnalytics::UpsidePotentialRatio( d )
  b_and_l = PerformanceAnalytics::BernardoLedoitRatio( d )
  burke   = PerformanceAnalytics::BurkeRatio( d, Rf = rf_rate )
  m_burke = PerformanceAnalytics::BurkeRatio( d, Rf = rf_rate, modified = 1 )
  rbind( sharpe, upside, b_and_l, burke, m_burke )
}

analysis.coMoments <- function( a, b ) {
  variance = PerformanceAnalytics::BetaCoVariance( a, b )
  skewness = PerformanceAnalytics::BetaCoSkewness( a, b )
  kurtosis = PerformanceAnalytics::BetaCoKurtosis( a, b )
  rbind( variance, skewness, kurtosis )
}

analysis.CAPM <- function( a, b, rf_rate = 0 ) {
  # note: CAPM discredited in literature
  alpha   = PerformanceAnalytics::CAPM.alpha( a, b, Rf = rf_rate)
  beta    = PerformanceAnalytics::CAPM.beta( a, b, Rf = rf_rate)
  risk_p  = PerformanceAnalytics::CAPM.RiskPremium( a, Rf = rf_rate)
  slope_s = PerformanceAnalytics::CAPM.SML.slope( a, Rf = rf_rate)
  slope_c = PerformanceAnalytics::CAPM.CML.slope( a, Rf = rf_rate)
  rbind( alpha, beta, risk_p, slope_s, slope_c )
}

analysis.CAPM.diversificationPotential <- function( a, b, rf_rate = 0 ) {
  # note: CAPM discredited in literature
  beta = PerformanceAnalytics::CAPM.beta( a, b, Rf = rf_rate )
  bull = PerformanceAnalytics::CAPM.beta.bull( a, b, Rf = rf_rate )
  bear = PerformanceAnalytics::CAPM.beta.bear( a, b, Rf = rf_rate )
  time = PerformanceAnalytics::TimingRatio( a, b, Rf = rf_rate)
  rbind( beta, bull, bear, time )
}