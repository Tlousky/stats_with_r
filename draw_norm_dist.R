library( ggplot2 )

obs = 67
m   = 70
s   = 3.3

x  = seq( m - 4 * s, m + 4 * s, by = 1 )
y  = dnorm( x, m, s )
df = data.frame( x = x, y = y )

obsY = y[ which( abs(x-obs) == min(abs(x-obs)) ) ]

dfTxt = data.frame(
    x      = c( m, obs ),
    y      = c( max(y), obsY ),
    labels = c(
        paste0( "mean=", m ),
        paste0( "x=", obs )
    )
)

ggplot( df, aes( x = x, y = y ) ) +
    geom_line( colour = "blue", size = 1 ) +
    geom_segment( x = m, xend = m, y = min(y), yend = max(y), colour = 'blue' )  +
    geom_segment( x = obs, xend = obs, y = min(y), yend = obsY, colour = 'red' ) +
    geom_label( data = dfTxt, aes( x = x, y = y, label = labels ) )
