# Chapter 4

# NULL

a = 1:3
as.null( a )
is.null( a )
is.null( as.null( a ) )

# raw

raw( 0 )
raw( 2 )
raw( "3" )
raw( 1:2 )
raw( "a" )

as.raw( NULL )
as.raw( 0 )
as.raw( c( TRUE, FALSE ) )
as.raw( c( 1, 2 ) + 0.1 )
as.raw( c( 1, 2 ) + 0.1i )
as.raw( c( "1", "2" ) )
as.raw( list( "1.1", "2.1" ) )
as.raw( -30 )
as.raw( c( "-1", "200", "a" ) )
as.raw( list( c( "-1", "200" ), 1:3 ) )

# logical

logical()
logical( 0 )
logical( 2 )
logical( 2.7 )
logical( 1, 2 )

as.logical()
as.logical( 0, 2 )
as.logical( c( 0, 2 ) )
as.logical( list( 0, 2.5, 0+1i, as.raw( NA ), NA, "2" ) )
as.logical( list( c( TRUE, TRUE ), 0:3 ) )

# double and integer

double()
double( 3 )
double( 3.7 )
double( "3.7" )
double( -3 )
double( 3:4 )

as.double()
as.double( NULL )
as.double( c( FALSE, TRUE, NA ) )
as.double( 1:3 + 0.2 )
as.double( 1:3 + 2+3i )
as.double( c( "1", "a", "3" ) )
as.double( as.raw( 2 ) )
as.double( list( as.raw( 2 ) ) )
as.double( list( 1:3 ) )
as.double( list( 1:3 )[[1]] )

typeof( 1:3 )
typeof( 1L:3L )
typeof( 1:3 + 0.1 - 0.1 )

# complex

complex( real=1:2, imaginary=6:7 )
complex()
complex( 0 )
complex( 3 )
complex( "3" )
complex( 1:3 )
complex( c( "1", "2", "3" ) )
complex( c( TRUE, FALSE ) )
complex( list( TRUE, FALSE ) )
complex( real=3:5 )
complex( im=3:5 )
complex( mod=3:5 )
complex( arg=45/180*pi )
complex( modulus=1:2, argument=45/180*pi )

as.complex( NULL )
as.complex( list( NA, FALSE, 2, 2i, "2" ) )
as.complex( as.raw( 2 ) )
as.complex( list( as.raw( 2 ) ) )

# character

character()
character( -0.5 )
character( -3 )
character( 3 )
character( "3" )
character( c( 3, 4 ) )

as.character()
as.character( NULL )
as.character( c( TRUE, FALSE ) )
as.character( 1:4 )
as.character( 1:4 + 2i )
as.character( as.raw( 100 ) )
as.character( pi )

a.list = list(
  matrix( 1:4, 2, 2 ),
  1:4,
  c( "a", "b" )
)
a.list
as.character( a.list )

x = 1:3
y = 2:4
a.lm = lm( y~x )
a.lm
as.character( a.lm )

# list

list()
vector( "list", -0.5 )
vector( "list", 2 )
list( 1:2 )
list( 1, 2 )
list( -0.5 )

as.list( NULL )
as.list( 1:2, 3:4 )
as.list( x = c( sinpi, 0:1/2 ) )
as.list( x = sinpi( 0:1/2 ) )

list( 1:2, 3:4 )
unlist( list( 1:2, 3:4 ) )

a.list = list( list( a=1:3, 2:4 ) )
a.list
unlist( a.list, rec=0, use=1 )
unlist( a.list, rec=1, use=1 )
unlist( a.list, rec=1, use=0 )

# environments

sys.frame( 0 )
sys.frame( 1 )

( function() sys.frame( 0 ) )()
( function() sys.frame( 1 ) )()
( function() sys.frame( 2 ) )()
( function() ( function() sys.frame( 0 ) )() )()
( function() ( function() sys.frame( 1 ) )() )()
( function() ( function() sys.frame( 2 ) )() )()
( function() ( function() sys.frame( 3 ) )() )()

search()
a=.GlobalEnv 
for( i in 2:20 ) { 
  a=parent.env( a ); cat( "\npos =", i, " " )
  print( a ) 
}

ne=new.env()
ne

environment( lm )=ne
environment( lm )
attach( ne )
search()

x=1:10
y=2:11
assign( "x", 0:9, pos=2 )
assign( "y", 2:11, pos=2 )
ls.str( "ne" )

lm( y~x )
rm( y )
rm( x )
lm( y~x )

detach( ne )
rm( ne )

# S4

setClass( 
  "linearmodel", 
  slots=c( 
    x="numeric", 
    y="numeric" 
  ) 
)
lm.data=new( 
  "linearmodel", 
  x=1:10, 
  y=2:11 
)
typeof( lm.data )


setGeneric( 
  "lm.fun", 
  function( object ) { 
    standardGeneric( "lm.fun" ) 
  } 
)
setMethod( 
  "lm.fun", 
  "linearmodel", 
  function( object ) { 
    lm( object@y~object@x ) 
  } 
)
typeof( lm.fun )
lm.fun( lm.data )

# language

call( "+", a=1, b=2 )
eval( call( "+", a=1, b=2 ) )
typeof( call( "+", a=1, b=2 ) )

as.call( list( `+`, 1, 2 ) )
eval( as.call( list( `+`, 1, 2 ) ) )
typeof( as.call( list( `+`, 1, 2 ) ) )

expression( a <- 3:5, b <- 2, 2*( a + b ) )
eval( expression( a <- 3:5, b <- 2, 2*( a + b ) ) )
typeof( expression( a <- 3:5, b <- 2, 2*( a + b ) ) )

as.expression( call( "+", a=1, b=2 ) )
eval( as.expression( call( "+", a=1, b=2 ) ) )
typeof( as.expression( call( "+", a=1, b=2 ) ) )

as.expression( 1:4 )
eval( as.expression( 1:4 ) )

as.expression( list( 1:4 ) )
eval( as.expression( list( 1:4 ) ) )

as.expression( lm )
