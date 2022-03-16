# Chapter 17

# NA, is.na(), Inf, -Inf, and NaN

ch17.mat = matrix( 
  c( 
    1, 
    NA, 
    3, 
    4 
  ), 
  2,
  2 
)
ch17.mat
ch17.mat[ ch17.mat==NA ] = 0
ch17.mat
ch17.mat[ is.na( ch17.mat ) ] = 0
ch17.mat

1/0
-1/0
0/0
log( -1 )

# is.finite(), is.infinite(), and is.nan()

ch17.mat.2 = matrix( 
  c( 
    1, 
    NaN, 
    Inf, 
    -Inf 
  ), 
  2, 
  2 
)

ch17.mat.2
ch17.mat.2[ is.finite( ch17.mat.2 ) ] = 2
ch17.mat.2
ch17.mat.2[ is.infinite( ch17.mat.2 ) ] = 3
ch17.mat.2
ch17.mat.2[ is.nan( ch17.mat.2 ) ] = 4
ch17.mat.2

ch17.mat.3=matrix( 
  c( 
    1, 
    2, 
    Inf, 
    -Inf 
  ), 
  2, 
  2 
)
ch17.mat.3
ch17.sg.mat.3 = sign( ch17.mat.3 )
ch17.sg.mat.3
ch17.mat.3[ is.infinite( ch17.mat.3 ) ] = 4
ch17.mat.3
ch17.mat.3 = ch17.sg.mat.3*abs( ch17.mat.3 )
ch17.mat.3

# all() and any()

ch17.log=c( 
  TRUE, 
  TRUE, 
  FALSE, 
  TRUE 
)
ch17.log
ch17.test = 8
ch17.test

if ( 
  ch17.log==TRUE 
) ch17.test=1
ch17.test

if ( 
  any( 
    ch17.log 
  ) 
) ch17.test=2
ch17.test

if ( 
  any( 
    !ch17.log 
  ) 
) ch17.test=3
ch17.test

if ( 
  all( 
    ch17.log[1:2] 
  ) 
) ch17.test=4
ch17.test

# list() and c() for lists

ch17.list = list( 
  1:4, 
  paste0( 
    "a", 
    1:2 
  ) 
)
ch17.list

list( 
  ch17.list, 
  1:3 
)

c(
  ch17.list, 
  1:3 
)

c( 
  ch17.list, 
  list( 
    1:3 
  ) 
)

# paths and urls

file.path( "ch11.R" )
basename( "ch11.R" )
dirname( "ch11.R" )
path.expand( "ch11.R" )
normalizePath( "ch11.R" )

file.path( "~/ch11.R" )
basename( "~/ch11.R" )
dirname( "~/ch11.R" )
path.expand( "~/ch11.R" )
normalizePath( "~/ch11.R" )

URLencode ( "https://vanward stat.com" )
URLdecode ( "https://vanward%20stat.com" )

# |>

cbind( 
  1:10, 
  runif( 10 ) + 1:10 
) |> cor()


# c() and NULL

c( 
  NULL, 
  3:4, 
  NULL, 
  1:2, 
  NULL 
)
c( 
  NULL 
)

# c() and factors

attributes( 
  c( 
   factor( 
     sample( 3, 10, replace=TRUE ) 
   ), 
   factor( 
     sample( 4:5, 20, replace=TRUE ) 
   )
 ) 
)

# recursion

ch17.exp = function( x, i=0 ) {
    if ( 
      abs( 
        x^i/factorial( i ) 
      ) > 1.0e-8 
    ) {
      ch17.exp( x, i+1 ) + x^i/factorial( i )
    }
    else {
      0
    }
}

ch17.exp( 1 )
exp( 1 )


