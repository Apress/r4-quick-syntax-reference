# Chapter 7

# scripts

cat(
  "x=1:3; y=2:4
print( x ); print( y )
print( lm(y~x) )",
  file="lm.example.R"
)
system( "cat lm.example.R" )
source( "lm.example.R" )
source( "lm.example.R", echo=TRUE )

# structure of function

c.fun = function() {
 print( 1:5 )
}
c.fun
c.fun()

d.fun = \() print( 1:5 )
d.fun
d.fun()

e.fun = function( a, b=3 ){
 print( a:b )
}
e.fun
e.fun( 10 )
e.fun()

k.fun = function( x, y ) {     
     if ( missing( y ) ) y=10 
     x+y     
 } 
k.fun
k.fun( 9 )
k.fun( x=9, y= )

g.fun = function( a=3, ... ) c( a + c( ... ) )
g.fun
g.fun( 1, 5, 4, 5 )
g.fun( , 5, 4, 5 )
g.fun()

h.fun = function( a=3, ... ) c( a + ..1 + ..2 )
h.fun( , 5, 4, 5 )

i.fun = function( a=3, ... ) {
   for( i in 1:...length() ) {
       print( c( a, ...elt( i ) ) )
     }
 }
i.fun( 1, 5, 4, 5 )
i.fun( , 5, 4, 5 )

j.fun = function( a=3, ... ) {
   for( i in 1:...length() ) {
       print( c( a, ...names()[ i ], ...elt( i ) ) )
     }
 }
j.fun( 1, b=5, c=4,  5 )

f.fun
f=f.fun(0)
f

f.fun = function(  mu, se=1, alpha=.034 ){
  q_value = qnorm( 1-alpha/2, mu, se )
  print( q_value )
}
f=f.fun(0)
f

f.fun = function(  mu, se=1, alpha=.034 ){
  q_value = qnorm( 1-alpha/2, mu, se )
  print( q_value )
  return( q_value + 1 )
}
f=f.fun(0)
f

f.fun = function(  mu, se=1, alpha=.034 ){
  q_value = qnorm( 1-alpha/2, mu, se )
  print( q_value )
  q_value + 1
}
f=f.fun(0)
f

airmiles.plot = function( 
  ts=airmiles, col="grey55", 
  tt="Airmiles Flown over Time",  yl="Airmiles",
  tx="Source: Airmiles dataset in
the datasets package of R" ) {
  plot( x=ts, col=col, axes=FALSE , ylab="" )
  axis( side=1, col=col )
  axis( side=2, col=col, yaxp=c( 0, 30000, 3 ) )
  box( col=col )
  title( tt, font.main=2, col.main=col, ylab=yl )
  mtext( side=1, line=3.6, , adj=1, cex=0.75, text=tx  )
}
airmiles.plot()

# entering a function

f.fun = function(){}
f.fun = edit( f.fun )
f.fun = function(mu, se=1, alpha=.05){
  z_value = qnorm(1-alpha/2, mu, se)
  print( z_value )
}
f.fun( 0 )

b.fun = function(){
 print( 3:6 )
 }
b.fun
b.fun()

b.fun = function(){
 print( 3:6
 }

# S4

setClass( 
  Class="xyz", 
  slots=c( 
    x="numeric", 
    y="numeric" 
  ) 
)
setMethod( 
  f="lmFunction", 
  signature="xyz", 
  definition=function( 
    x="xyz", 
    y="missing", 
    ... 
  ) { 
      print( 
        lm( x@y ~ x@x ) 
      ) 
    } 
)
setGeneric( 
  name="lmFunction", 
  function( 
    x, 
    y, 
    ... 
  ) { 
    standardGeneric( "lmFunction" ) 
  } 
)
setMethod( 
  f="lmFunction", 
  signature="xyz", 
  definition=function( 
    x="xyz", 
    y="missing", 
    ... 
  ) { 
    print( lm( x@y ~ x@x ) ) 
  } 
)
xyz.p1 = new( 
  "xyz", 
  x=1:10, 
  y=21:30 
)
lmFunction( xyz.p1 )
 
isGeneric( "lm" )
isS4( "lm" )
isS3method( "lm" )
isS3stdGeneric( "lm" )

setClass( "lm", 
          slots=c( 
            fo="formula", 
            df="data.frame"
        ) 
)

isGeneric( "plot" )
isS4( "plot" )
isS3method( "plot" )
isS3stdGeneric( "plot" )

setClass( 
  "plot", 
  slots=c( 
    x="numeric", 
    y="numeric" 
  ) 
)
setMethod( 
  "plot", 
  signature="plot", 
  definition=function( 
    x, 
    y,
    ... 
  ) { 
      plot( 
        x@x, 
        x@y 
      ) 
    } 
)
tester=new( 
  "plot", 
  x=1:10, 
  y=21:30 
)
plot ( tester )
 
isGeneric( "plot" )
isS4(  "plot"  )
isS3method( "plot" )
isS3stdGeneric( "plot" )

isS3method( "plot" )
isS3method( "plot.ts" )

# Reference Class
 
RCE$methods()

RCE$methods( "rg" )

RCE$methods( 
    li=function( xx=x ) print( xx ), 
    qu=function( xx=x ) print( xx^2 )
  )
RCE.p1 = RCE$new( 
  x=1:6, 
  y=3:8, 
  rs=lm( y~x ) 
)
RCE.p1$li()
RCE.p1$qu()
RCE.p1$qu( 3:4 )

RCE$methods( 
   sa=function( xx=x, ... ) sample( xx, ... )  
 )
RCE.p1$sa()
RCE.p1$sa( size=3 )
RCE.p1$sa( 1:3, size=10, replace=TRUE )

rm( RCE )
RCE = setRefClass( 
  "RCE", 
  fields=list( 
    x="numeric", 
    y="numeric", 
    rs="lm" 
  )
) 
RCE
RCE()
RCE.p1 = RCE$new( 
  x=1:6, 
  y=4:9, 
  rs=lm( y~x ) 
) #initialize has not been set
RCE$methods( 
  initialize=function() { 
    x <<- as.numeric( 1:4 ); 
    y <<- as.numeric( 5:8 ); 
    rs <<- lm( y~x )
  } 
)
RCE()
RCE.p1 = RCE$new( 
  x=1:6, 
  y=4:9, 
  rs=lm( y~x ) 
)

RCE$methods( 
  initialize=function() { 
     x <<- as.numeric( 1:3 ); 
     y <<- as.numeric( 3:5 ); 
     rs <<- lm( y~x )
 } 
) 
RCE()
