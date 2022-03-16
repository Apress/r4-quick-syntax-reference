# Chapter 13 Example 1
#   for loop and if/else

ch13.mat = matrix(
  1:10,
  2,
  5
)
ch13.mat

for ( i in 1:2 ) {
  for ( j in 1:5 ) {
    if ( ch13.mat[ i, j ] > 5 ) ch13.mat[ i, j ] = 1
    else ch13.mat[ i, j ] = 0
  }
}
ch13.mat

#   using indices

ch13.mat = matrix(
  1:10,
  2,
  5
)
ch13.mat

ch13.mat[ ch13.mat <= 5 ] = 0
ch13.mat[ ch13.mat > 5 ] = 1
ch13.mat


# Chapter 13 Example 2

#   while loop

set.seed( 129435 )
n = 0
ch13.sum = 0
while ( ch13.sum <= 5 ) {
  ch13.sum = ch13.sum + runif( 1 )
  n = n + 1
}
n
ch13.sum

# with indices

set.seed( 129435 )
ch13.sum = runif( 25 )
ch13.sum = cumsum( ch13.sum )
n = length( ch13.sum[ ch13.sum <= 5 ] ) + 1
ch13.sum = ch13.sum[ n ]
n
ch13.sum

# Chapter 13 Example 3

#   two for loops

ch13.mat.2 = matrix( 
  1:8, 
  2, 
  4 
)
colnames( ch13.mat.2 ) = paste0( 
  "c", 
  1:4
)
ch13.mat.2

ch13.mat.2p = matrix(
  0, 
  2, 
  6 
)
colnames( ch13.mat.2p ) = rep( 
  "", 
  6 
)
ch13.mat.2p

k=0
for ( i in 1:3 ) {
   for ( j in ( i+1 ):4 ) {
       k = k+1
       ch13.mat.2p[ , k ] = ch13.mat.2[ , i ] - ch13.mat.2[ , j ]
       colnames( ch13.mat.2p )[ k ] = paste0( 
         colnames( ch13.mat.2 )[ i ], 
         "-",
         colnames( ch13.mat.2 )[ j ]
       )
   }
}
ch13.mat.2p

# with indices

ch13.mat.2

ind.1 = rep( 
  1:3, 
  3:1 
)
ind.1
ind.2 = numeric( 0 )
for( i in 2:4 ) ind.2 = c( 
  ind.2, 
  i:4 
)
ind.2
ch13.mat.3p = ch13.mat.2[ , ind.1 ] - ch13.mat.2[ , ind.2 ]
colnames( ch13.mat.3p ) = paste0( 
  "c", 
  ind.1, 
  "-c", 
  ind.2
)
ch13.mat.3p

# Chapter 13 Example 4

#   for and if and next

set.seed( 69785 )
ch13.vec = numeric( 0 )
for ( i in 1:10000 ) {
  x = rnorm( 1 )
  if ( x > 2.1158 ) next
  ch13.vec = c( ch13.vec, x )
}
hist( ch13.vec )
box() # to put a box around the plotting region

# with indices

set.seed( 69785 )
ch13.vec = rnorm( 10000 )
ch13.vec = ch13.vec[ ch13.vec <= 2.1158 ]
hist( ch13.vec )
box() # to put a box around the plotting region

# Chapter 13 Example 5
#   for, repeat, if, break

set.seed( 38965 )
ch13.vec.2 = numeric( 10000 )
for ( i in 1:10000 ) {
  n = 0
  repeat{
      n = n + 1
      x = sum( rnorm( 100 ) )/10
      if ( x > 2.1158 ) { 
        ch13.vec.2[ i ] = n 
        break 
      }
  }
}

hist( 
  ch13.vec.2, 
  breaks=25, 
  xlim=c( 0, 400 ) 
)
box() # to put a box around the plotting region
mean( ch13.vec.2 )
median( ch13.vec.2 )

# with indices

set.seed( 38965 )
ch13.vec.3 = numeric( 0 )
xr = numeric( 0 )

repeat{
  x = matrix( 
    rnorm( 100000 ), 
    100, 
    1000 
  )
  x = colSums( 
    x
  )/10
  x = c( 
    xr, 
    x 
  )
  w = which( 
    x > 2.1158 
  )
  lw = length( w )
  ch13.vec.3 = c( 
    ch13.vec.3, 
    w - c( 0, w[ -lw ] )
  )
  if ( length( ch13.vec.3 ) > 10000 ) break
  lr = length( xr )
  lrt = ( w[ lw ] == ( 1000 + lr ) )
  if ( lrt ) xr = numeric( 0 ) 
  else  xr = x[ ( w[ lw ] + 1 ):( 1000 + lr )  ]
}
ch13.vec.3 = ch13.vec.3[ 1:10000 ]
hist( 
  ch13.vec.3, 
  breaks=25, 
  xlim=c( 0, 400 ) 
)
box() # to put a box around the plotting region
mean( ch13.vec.3 )
median( ch13.vec.3 )


