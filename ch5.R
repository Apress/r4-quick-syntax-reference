# Chapter 5

# methods

methods( class=lm )

# arrays

a=array( 
  1:8, 
  c( 2, 2, 2 ) 
)
dimnames( a )=list( 
  c( "a", "b" ), 
  c( "m", "n" ), 
  c( "y", "z" ) 
)
a
as.vector( a )

# matrices

matrix( a, 3, 3 )
matrix( a, 3, 3, 
        byrow=TRUE, 
        dimnames=list( 
          NULL, 
          c( "c1", "c2", "c3" ) 
        ) 
)

# lists 
  
a.list = list( 
  matrix( 1:4, 2, 2 ), 
  c( "abc", "cde" ), 
  1:3, 
  function(){ print( 1:3 ) } 
)
a.list

matrix( a.list, 2, 2 )
matrix( a.list, 2, 2 )[2, 2]

# data frames

a.df = data.frame( 
  c( T, F ), 
  1:2, 
  1:2+.5, 
  1:2+1i, 
  c( as.raw( 1 ), 
     as.raw( 10 ) 
  ), 
  c( "a", "b" ) 
)
dimnames( a.df )=list( 
  1:2, 
  c( "logical",  
     "integer", 
     "double", 
     "complex", 
     "raw", 
     "character" 
    ) 
)
a.df
as.matrix( a.df )
as.matrix( a.df[,1:5] )
as.matrix( a.df[,1:4] )
as.matrix( a.df[,1:3] )
as.matrix( a.df[,1:2] )
as.matrix( a.df[,1] )
data.matrix( a.df )

# arrays

array( 
  1:12, 
  c(  2, 3, 2 ), 
  dimnames=list( 
    c( "", "" ), 
    c( "a", "b", "c" ), 
    NULL 
  )  
)

# dimension names

cde = 21:30
names( cde )
names( cde ) = paste( "v", 1:10, sep="" )
cde
names( cde )
typeof( names( cde ) )
class( names( cde ) )

a.vec = c( a=1, b=2, c=3 )
a.vec

mat = matrix( 1:4, 2, 2 )
mat
colnames( mat )
colnames( mat ) = colnames( 
  mat, 
  do.NULL=FALSE, 
  prefix="cl" 
)
mat

a = array( 
  1:8, 
  dim=c( 2, 2, 2 ),
  dimnames=list( c( "d11", "d12" ),
                 c( "d21", "d22" ),
                 c( "d31", "d32" )
           )
)
dimnames( a )
dimnames( a ) = list( 
  c( "11", "12"),
  c( "21", "22" ),
  c( "31", "32" ) 
)
a

# data frames

a.list = list( 
  matrix( 
    1:12, 6, 2, 
    dimnames=list( NULL, c( "a1", "a2") ) 
  ),
  c( "abc", "cde" )
)
data.frame( 
  a.list, 
  1:3 
)

mat = matrix(
  1:4, 2, 2,
  dimnames=list( 
    paste0( "row", 1:2 ), 
    c( "one", "two" ) 
  )
)
mat
a.char = paste0( "a", 1:4 )
a.char
a.df1 = data.frame( 
  mat, 
  a.char 
)
a.df1
a.df1[[3]]

a.df2 = data.frame( 
  I( mat ), 
  I( a.char[ 1:2 ] )  
)
a.df2
a.df2[[1]]
a.df2[[2]]

z = paste0( 
  rep( "z", 301 ), 
  collapse="" 
)
nchar( z )
names( 
  as.data.frame( 
    list( 1:12 ), 
    col.names=z 
  ) 
)
nchar( 
  names( 
    as.data.frame( 
      list( 1:12 ), 
      col.names=z 
    ) 
  ) 
)
names( 
  as.data.frame( 
    list( 1:12 ), 
    col.names=z, 
    cut.names=TRUE 
  ) 
)
nchar( 
  names( 
    as.data.frame( 
      list( 1:12 ), 
      col.names=z, 
      cut.names=TRUE 
    ) 
  ) 
)
names( 
  as.data.frame( 
    list( 1:12 ), 
    col.names=z, 
    cut.names=10 
  ) 
)
nchar( 
  names( 
    as.data.frame( 
      list( 1:12 ), 
      col.names=z, 
      cut.names=10 
    ) 
  ) 
)

as.data.frame( 
  list( 1:2, "a" ) 
)

as.data.frame( 
  list( 1:2, "a" ), 
  fix.empty.names=FALSE 
)

a.mat = mat
rownames( a.mat ) = rep( "one", 2 )
a.mat
as.data.frame( a.mat )
as.data.frame( 
  a.mat, 
  make.names=FALSE 
  )

as.data.frame( 
  array( 
    data=1:24, 
    dim=c( 2, 3, 2, 2 ) 
  ) 
)

# time series

ts( 
  1:12, 
  start=c( 2019, 2 ), 
  freq=12 
)
ts( 
  1:12, 
  start=c( 2019, 2 ), 
  freq=4 
)
ts( 
  1:12, 
  start=c( 3, 2 ), 
  freq=7 
)
print( 
  ts( 
    1:12, 
    start=c( 3, 2 ), 
    freq=7 
  ), 
  calendar=TRUE 
)
ts( 
  data=1:5, 
  start=2+2/3, 
  end=4+1/3, 
  deltat=1/3
)
print( 
  ts( 
    1:5, 
    2+2/3, 
    4+1/3, 
    deltat=1/3
  ), 
  calendar=TRUE 
)

# factors

a.log = c( TRUE, TRUE, FALSE, TRUE )
a.log

af1 = factor( a.log )
af1
as.logical( levels( af1 ) )[ af1 ]
as.integer( af1 )

af2 = factor( a.log, levels=c( TRUE, FALSE ) )
af2
as.logical( levels( af2 ) )[ af2 ]
as.integer( af2 )

af3 =factor( a.log, labels=c( "flab", "tlab" ) )
af3
as.logical( levels( af3 ) )[ af3 ]
as.integer( af3 )
as.character( levels( af3 ) ) [ af3 ]

# dates and times

as.Date( "2021-8-13" )
class( as.Date( "2021-8-13" ) )

as.POSIXct( "2021-8-13 15:24:00" )
class( as.POSIXct( "2021-8-13 15:24:00" ) )

as.Date( 0:2*7, origin="2021-8-13" )
as.POSIXct( "1/13/2000 00:30:00", format="%m/%d/%Y %H:%M:%S" )

as.Date( "2021-8-13" ) + 1:2
typeof( as.Date( "2021-8-13" ) + 1:2 )

as.POSIXct( "2021-8-13 00:00:00" ) + 1:2*3600
typeof( as.POSIXct( "2021-8-13 00:00:00" ) + 1:2*3600 )

as.POSIXlt( 
  as.POSIXct( "2021-8-13 00:00:00" ) + 1:2*3600 
  )
typeof( 
  as.POSIXlt( 
    as.POSIXct( "2021-8-13 00:00:00" ) + 1:2*3600 
  ) 
)

as.POSIXlt( "2021-8-13 00:00:00" ) + 1:2*3600 
typeof( as.POSIXlt( "2021-8-13 00:00:00" ) + 1:2*3600 )

as.Date( "2021-8-13" ) - as.Date( "2000-1-1" )
typeof( as.Date( "2021-8-13" ) - as.Date( "2000-1-1" ) )
class( as.Date( "2021-8-13" ) - as.Date( "2000-1-1" ) )

t1 = as.POSIXct( "2021-8-13 12:00:00" )
t2 = as.POSIXct( "2021-8-13 11:00:00" )
difftime( t1, t2 )
difftime( t1, t2, units="mins" )
as.numeric( difftime( t1, t2, units="mins" ) )

as.difftime( 
  c( "20:15", "2021-1-1" ), 
  format=c( "%H:%M", "%Y-%m-%d" ), 
  units="weeks" 
)
class( 
  as.difftime( 
    c( "20:15", "2021-1-1" ), 
    format=c( "%H:%M", "%Y-%m-%d" ), 
    units="weeks" 
  ) 
)
strftime( 
  c( "2021-08-13" ), 
  format=c( "%m/%d/%Y", "%d/%m/%Y" ), 
  tz="America/Chicago", 
  usetz=TRUE 
)
strftime( 
  x="2021-08-13 12:00:00", 
  format="%m/%d/%Y %I:%M %p" 
)
strptime( 
  "8/13/2021", 
  format="%m/%d/%Y", 
  tz="UTC" 
)
class( 
  strptime( 
    "8/13/2021", 
    format="%m/%d/%Y", 
    tz="UTC" 
  ) 
)
strptime(
  c( "8/13/2021 12:00 AM", "8/13/2021 12:00 pm" ), 
  format=c( "%m/%d/%Y %I:%M %p" ) 
)
class( 
  strptime( 
    c( "8/13/2021 12:00 AM", "8/13/2021 12:00 pm" ), 
    format=c( "%m/%d/%Y %I:%M %p" ) 
  ) 
)

c( t1, t2 )
weekdays( 
  x=c( t1, t2 ), 
  abb=c( TRUE, FALSE ) 
)
months( 
  x=c( t1, t2 ), 
  abb=c( TRUE, FALSE ) 
)
quarters( 
  x=c( t1, t2 ), 
  abb=c( TRUE, FALSE ) 
)
julian( as.Date( "1971-1-1" ) )
julian( as.POSIXct( "1971-1-1 12:00:00" ) )
julian( as.POSIXlt( "1971-1-1 12:00:00" ) )

# formulas in nested functions

a.fun = function() {
# at the first function level
# formulas defined using the expression and formula()
  cat( "\nlevel a \n\n" )
  print( parent.frame() )
  print( environment() )
    x=1:10
    y=11:20
  cat( "\nx=", x )
  cat( "\ny=", y, "\n" )
    a.formula="y~x"
    b.formula=formula("y~x")
  b.fun=function() {
# at the second function level
# lm() is run for the formulas defined at the first level
    cat( "\nlevel b \n\n" )
      x=1:10
      y=21:30
    print( parent.frame() )
    print( environment() )
    print( lm( a.formula ) )
    cat( "\nx=", x )
    cat( "\ny=", y, "\n" )
    print( lm( b.formula ) )
# the cc environment is defined at the second level
# the formula from as.formula() is run
    cat( "\nenvironment cc \n\n" )
      cc=new.env()
        assign( "x", 1:10, env=cc )
        assign( "y", 31:40, env=cc )
    c.formula=as.formula( "y~x", env=cc )
    cat( "\nx=", cc$x )
    cat( "\ny=", cc$y, "\n" )
    print( lm( c.formula ) )
  }
 # the second function is run at the first level
  b.fun()
}
a.fun()

# S4

setClass( 
  "example", 
  slots=c( x="numeric", y="numeric",  z="matrix" ) 
)
getClass( "example" )
setClass( 
  "example.2", 
  slots=c( xx="numeric", yy="numeric", zz="matrix" ), 
  contains="example" 
)
getClass( "example.2" )
getClasses( .GlobalEnv )
isClass( "example" )
isClass( "numeric" )

# Reference Class

RCE = setRefClass( 
  "RCE", 
  fields=list( x="numeric", y="numeric", rs="lm" ), 
  method=list( rg=function() { rs <<- lm( y~x ) } 
  ) 
) 
RCE
isS4( RCE )

x = 0:2
y = 1:3

RCE.p1 = RCE$new( 
  x=1:6, 
  y=3:8 + rnorm( 6 ), 
  rs=lm( y~x ) 
)
RCE.p1
RCE.p1$rg()
RCE.p1

RCE.p1$x = RCE.p1$x + 1
RCE.p1$rg()
RCE.p1

RCE.pc = RCE.p1
RCE.pc$x
RCE.pc$x = 15:20
RCE.pc$x
RCE.p1$x

RCE.p2 = RCE.p1$copy()
RCE.p2
RCE.p2$y = 3:8 + rnorm( 6 )
RCE.p2$y
RCE.p1$y

class( RCE )
typeof( RCE )

class( RCE.p1 )
typeof( RCE.p1 )

class( RCE.p1$y )
typeof( RCE.p1$y )

class( RCE.p1$rg )
typeof( RCE.p1$rg )

class( RCE.p1$rg() )
typeof( RCE.p1$rg() )




