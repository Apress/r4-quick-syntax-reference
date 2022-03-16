# Chapter 15

# options()

options( 
  defaultPackages=c( 
    getOption( "defaultPackages" ), 
    "MASS" 
  ),
  contrasts=c( 
    "contr.sum", 
    "contr.poly" 
  ) 
)

# round()

set.seed( 69239 )
round( 
  c( 
    1.2344, 
    5.67, 
    1234.567 
    ), 
  3 
)
round(
  rnorm( 3, 2 ) + 62, 
  -1 
)
round( 
  1.34+3.0i, 
  1 
)
round( 
  x=array( 
    1:8 + 0.2345, 
    c( 2, 2, 2 ) 
  ), 
  digits=1:3 
)

# signif()

set.seed( 69239 )
signif( 
  c( 
    1.2344, 
    5.67, 
    1234.567 
  ), 
  3 
)
signif( 
  rnorm( 3, 2 ) + 62, 
  -1 
)
signif( 
  1.34+3.0i, 
  1 
)
signif( 
  array( 
    1:8 + 0.2345, 
    c( 2, 2, 2 ) 
  ), 
  1:3 
)

# noquote()

c( 
  " a", 
  "bc", 
  "d" 
)
noquote( 
  c( 
    " a", 
    "bc", 
    "d" 
  ) 
)

# format()

ch15.date = as.Date( 
  x=1:3, 
  origin="2014-3-9" 
)
ch15.date
format(
  ch15.date, 
  "%m/%d/%Y"
)

ch15.list = list( 
  c( "a", "b", "c" ), 
  matrix( 
    1:4, 2, 2, 
    dimnames = list(
      c( "r1", "r2" ), 
      c( "c1", "c2" )
    )
  )
)
ch15.list
format( 
  ch15.list 
)

# print()

ch15.mat = matrix( 
  paste0( "m", 1:8 ), 
  2, 
  4,
  dimnames=list( 
    rep( "", 2 ), 
    rep( "", 4 ) 
  )
)
print( 
  ch15.mat 
)
print( 
  ch15.mat, 
  quote=FALSE, 
  right=TRUE, 
  print.gap=3 
)

# eval()

call( 
  "cospi",
  x=0:4
)
eval( 
  call(
    "cospi",
    x=0:4
  )
)
x

# attributes() and attr()

attributes( 
   1:10 
 )

attributes( 
   cbind( 
       1:10, 
       1:10 
   )
)

attributes( 
   cbind( 
       a=1:10, 
       b=1:10 
   ) 
)

attr( 
   cbind( 
       a=1:10, 
       b=1:10 
     ), 
   "dimnames" 
 )[[ 2 ]]

ch15.mat.2 = ch11.mat.3
ch15.mat.2

attr( 
     ch15.mat.2, 
     "dimn" 
)

attr( 
  ch15.mat.2, 
  "dimnames" 
) = NULL

ch15.mat.2

# summary()

set.seed( 69235 )
x = sample( 
   3, 
   1000, 
   replace=TRUE 
)
y = sample( 
   4:5, 
   1000, 
   replace=TRUE 
)

ch15.tab = table( 
  x, 
  y 
)
ch15.tab
summary( ch15.tab )

ch15.ar = array( 
   1:8, 
   c( 2, 2, 2 ) 
)
ch15.ar
summary( ch15.ar )

set.seed( 69235 )
ch15.lm = lm( 
   I( 1:10 + rnorm( 10, 1:10 ) ) ~ I( 1:10 ) 
 )
ch15.lm
summary( ch15.lm )

set.seed( 69235 )
x = sample( 
  3, 
  1000, 
  replace=TRUE 
)
y = sample( 
  4:5, 
  1000, 
  replace=TRUE 
)
ch15.tab = table( 
  x, 
  y 
)
ch15.tab
summary( ch15.tab )

ch15.ar = array( 
  1:8, 
  c( 2, 2, 2 ) 
)
ch15.ar
summary( ch15.ar )

set.seed( 69235 )
ch15.lm = lm( 
  I( 1:10 + rnorm( 10, 1:10 ) ) ~ I( 1:10 ) 
)
ch15.lm
summary( ch15.lm )

# deriv(), deriv3(), and D()

x=1:2
y=3

deriv( 
 ~x^2*y, 
 c("x", "y" ), 
 function.arg=FALSE 
 )

eval( 
   deriv( 
     ~x^2*y, 
     c( "x", "y" ), 
     function.arg=FALSE 
   )
)

deriv( 
  ~x^2*y, 
  c( "x", "y" ), 
  function.arg="x" 
)

deriv( 
  ~x^2*y, 
  c( "x", "y" ), 
  function.arg=function( x ) {} 
)( x=2:3 )

deriv3( 
  ~x^2*y, 
  c( "x", "y" ), 
  function.arg=function( x ) {} 
)( x=2:3 )

attributes( 
   deriv3( 
       ~x^2*y, 
       c( "x", "y" ), 
       function.arg=function( x ) {} 
    )( x=2:3 ) 
)

summary( 
   attributes( 
       deriv3( 
           ~x^2*y, 
           c( "x", "y" ), 
           function.arg=function( x ) {} 
       )( x=2:3 ) 
   )
)

D( 
  quote( sinpi( x ) ), 
  "x" 
)
eval( 
   D( 
      quote( sinpi( x ) ), 
      "x" 
   ) 
)

# numericDeriv()

x = 1:2 + 0.0
y = 3 + 0.0

numericDeriv( 
  quote( x^2*y ), 
  "y"
)
numericDeriv( 
  quote( x^2*y ), 
  c( "y", "x" )
)

# integrate()

integrate( 
   sinpi, 
   0, 
   1
)

integrate( 
   dnorm, 
   5, 
   Inf,
   mean=5
 )

ch15.int = integrate( 
   function( a, x ) a*x^2, 
   0, 
   1, 
   a=3 
 )

ch15.int

ch15.int[1:5]

# parse()

cat( 
  "c( 2, 9 )\nc( 9, 8 )\n", 
  file="ch15.src.txt" 
)
system(
  "cat ch15.src.txt"
)
cat( 
  "c( 2, 3 )\nc( 9, 2 )\n", 
  file="ch15.src.2.txt" 
)
system(
  "cat ch15.src.2.txt"
)

ch15.par.1T = parse( 
  , 
  2, 
  , 
  "P>", 
  TRUE, 
  srcfile( "ch15.src.txt" ) 
)
1:10
3:7

ch15.par.1T
attributes( ch15.par.1T )

ch15.par.1F = parse( 
  , 
  2, 
  , 
  "P> ", 
  FALSE, 
  srcfile( "ch15.src.txt" ) 
)
1:10
3:7

ch15.par.1F
attributes( ch15.par.1F )

ch15.par.2T = parse( 
  "ch15.src.txt", 
  2,
  , 
  "P> ", 
  TRUE, 
  srcfile( "ch15.src.2.txt" ) 
)
ch15.par.2T
attributes( ch15.par.2T )

ch15.par.2F = parse( 
  "ch15.src.txt", 
  2,
  , 
  "P> ", 
  FALSE, 
  srcfile( "ch15.src.2.txt" ) 
)
ch15.par.2F
attributes( ch15.par.2F )

ch15.par.3T = parse( 
  , 
  2, 
  "c( 2, 6 )", 
  "P> ", 
  TRUE 
)
ch15.par.3T
attributes( ch15.par.3T )

ch15.par.3F = parse( 
  , 
  2, 
  "c( 2, 6 )", 
  "P> ", 
  FALSE 
)
ch15.par.3F
attributes( ch15.par.3F )

ch15.par.4T = parse( 
  , 
  2, 
  "c( 2, 6 )", 
  "P> ", 
  TRUE, 
  NULL 
)
ch15.par.4T
attributes( ch15.par.4T )

ch15.par.4F = parse( 
  , 
  2, 
  "c( 2, 6 )", 
  "P> ", 
  FALSE, 
  NULL 
)
ch15.par.4F
attributes( ch15.par.4F )

# deparse()

ch15.dep = c( 
  list( 1:3 ), 
  list( 7:8 ), 
  list( c( 9, 8, 10 ) )
)

deparse( 
  ch15.dep 
)

deparse( 
  ch15.dep,
  width.cutoff=20L
)

deparse( 
  ch15.dep,
  width.cutoff=20L,
  nlines=1
)

deparse( 
  ch15.dep,
  width.cutoff=20L,
  nlines=NA
)

# Functions for Models

set.seed( 69235 )
x=1:5
y = rnorm( 5 )
ch15.lm.2 = lm( 
  y~x 
)

methods( anova )

round(
  anova( ch15.lm.2 ),
  4
)

methods( coef )

round(
  coef( ch15.lm.2 ),
  3
)

round(
  effects( ch15.lm.2 ),
  3
)

methods( residuals )

round(
  residuals( ch15.lm.2 ),
  3
)

methods( fitted )

round(
  fitted( ch15.lm.2 ),
  3
)

methods( vcov )

round(
  vcov( ch15.lm.2 ),
  3
)

methods( confint )

round(
  confint( ch15.lm.2 ),
  3
)

methods( predict )

round(
  predict( 
  ch15.lm.2, 
  interval="confidence" 
  ),
  3
)
