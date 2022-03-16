# Chapter 9

# file()

ch9.fex1 = ""
ch9.fexcon = file( 
  ch9.fex1, 
  "w+" 
)
showConnections()
scan( ch9.fex1 )
1
2
5

close( ch9.fexcon )
showConnections()

scan( ch9.fex1 )
1
4

ch9.fex2 = "ch9.df.txt"
ch9.fexcon = file( 
  ch9.fex2, 
  "w+" 
)
cat( 
  1:3, 
  "\n", 
  1:2, 
  file=ch9.fexcon 
)
close( ch9.fexcon )
scan( ch9.fex2 )

ch9.fex3 = "file://ch9.df.txt" 
ch9.fexcon = file( 
  ch9.fex3, 
  "r+" 
)
cat( 
  1:2, 
  "\n", 
  3:4, 
  "\n", 
  file=ch9.fexcon 
)
close( ch9.fexcon )
readLines( ch9.fex3 )

ch9.fexcon = file( 
  ch9.fex3, 
  "a+" 
)
cat( 
  2:3, 
  "\n", 
  4:5, 
  "\n", 
  file=ch9.fexcon 
)
close( ch9.fexcon )
readLines( ch9.fex3 )

ch9.fexcon = file( 
  ch9.fex3, 
  "w+" 
)
readLines( ch9.fex3 )

# url()

ch9.uex1 = "http://berkeleyearth.lbl.gov/auto/Global/Land_and_Ocean_complete.txt"
ch9.uexcon = url( 
  ch9.uex1 
)
readLines( 
  ch9.uexcon, 
  n=3 
)
close( 
  ch9.uexcon 
)

# gzfile()

ch9.gzex1 = "ch9.bin"
ch9.gzexcon = gzfile( 
  ch9.gzex1, 
  "wb" 
)
cat( 
  "binary file\n", 
  file=ch9.gzexcon 
)
close( 
  ch9.gzexcon 
)
ch9.gzexcon = gzfile( 
  ch9.gzex1, 
  "rb" 
)
readBin( 
  ch9.gzex1, 
  what=character() 
)
readLines( 
  ch9.gzex1 
)
close( 
  ch9.gzexcon 
)

# unz()

ch9.zex1 = "ia090121-exempt.zip"
ch9.zexcon = unz( 
  ch9.zex1, 
  "ia090121-exempt.csv" 
)
readLines( 
  ch9.zexcon 
)[[ 982 ]][ 1 ]
close( 
  ch9.zexcon 
)

# pipe

ch9.pex4 = "pbpaste"
ch9.pexcon = pipe( 
  ch9.pex4, 
  "" 
)
scan( 
  ch9.pexcon, 
  what=character() 
)
readLines( 
  ch9.pexcon 
)
readChar( 
  ch9.pexcon, 
  105 
)
close( 
  ch9.pexcon 
)

# fifo()

ch9.ffex1 = tempfile( 
  fileext="-fifo" 
)
ch9.ffex1
ch9.ffexcon = fifo( 
  ch9.ffex1, 
  "a+" 
)
writeLines( 
  paste( 10:12 ), 
  con=ch9.ffexcon 
)
cat( 
  20:22, 
  file=ch9.ffexcon 
)
readLines( 
  ch9.ffexcon 
)
scan( 
  ch9.ffexcon 
)
scan( 
  ch9.ffexcon 
)
close( 
  ch9.ffexcon 
)
unlink( 
  ch9.ffex1 
)

# showConnections(), getConnection(), and closeAllConnections()

ch9.scex1 = file()
showConnections()
ch9.scex2 = getConnection( 
  3 
)
showConnections()
ch9.scex1
ch9.scex2
closeAllConnections()
showConnections()

#stdin() and isatty()

stdin()
showConnections()
showConnections( all=TRUE )
closeAllConnections()
showConnections( all=TRUE )

scan( stdin() )
2
4
1

isatty( stdin() )

#scan

scan()
4
6
2

scan( 
  text="1 a 3 b 2 c 4 d", 
  what=list( 0, "" ) 
)

cat( "#junk\none, two, three, four
1, 2, 3, 4\n2, 3, 4, 5 ",
     file="ch9.tb2.txt" 
    )
system( "cat ch9.tb2.txt" )

scan( 
  file="ch9.tb2.txt", 
  skip=2, 
  sep="," 
)

scan( 
  text="1 2 4+1i", 
  what=complex() 
)
scan( 
  text="1 2 4+1i", 
  what=character() 
)

scan( 
  file="ch9.tb2.txt", 
  skip=2, 
  sep=",", 
  nmax=5 
)
scan( 
  file="ch9.tb2.txt", 
  what=list( 1, 1 ), 
  skip=2, 
  sep=",", 
  nmax=3 
)
scan( 
  file="ch9.tb2.txt", 
  skip=2, 
  sep=",", 
  n=5 
)
scan( 
  file="ch9.tb2.txt", 
  what=list(1,1), 
  skip=2, 
  sep=",", 
  n=3 
)

scan( 
  text="1, 2, 3,, 4", 
  sep="," 
)

cat( 
  "1 7 3 4 5 #flush\n2 3 4 5 6",
  file="ch9.tb3.txt"
)
system( "cat ch9.tb3.txt" )
scan( 
  file="ch9.tb3.txt", 
  flush=TRUE 
)
scan( 
  text="1 a 3 b 2 c 4 d", 
  what=list( 0, "" ), 
  flush=TRUE 
)


cat( 
  "1 2 3\n4 5\n6",
  file="ch9.tb4.txt"
)
system( 
  "cat ch9.tb4.txt" 
)

scan( 
  file="ch9.tb4.txt", 
  list( 1, 1, 1, 1 ), 
  fill=FALSE 
)
scan( 
  file="ch9.tb4.txt", 
  list( 1, 1, 1, 1 ), 
  fill=TRUE 
)

scan( 
  "ch9.tb2.txt", 
  what=character(), 
  sep=",", 
  skip=2 
)
scan( 
  "ch9.tb2.txt", 
  what=character(), 
  sep=",", 
  strip.white=TRUE, 
  skip=2 
)


cat(
  "1 7 3 4 5\n\n2 3 4 5 6",
  file="ch9.tb5.txt"
)
system( 
  "cat ch9.tb5.txt" 
)

scan( 
  file="ch9.tb5.txt" 
)
scan( 
  file="ch9.tb5.txt", 
  blank.lines.skip=FALSE 
)
scan( 
  file="ch9.tb5.txt", 
  list( 1, 1 ), 
  blank.lines.skip=FALSE 
)

cat(
  "1 7 3\n2 3 4",
  file="ch9.tb6.txt"
)
system( 
  "cat ch9.tb6.txt" 
)
scan( 
  file="ch9.tb6.txt", 
  list( 1, 1 ), 
  multi.line=TRUE 
)

system( 
  "cat ch9.tb3.txt" 
)

scan( 
  file="ch9.tb3.txt" 
)
scan( 
  file="ch9.tb3.txt", 
  comment.char="#" 
)

system(
  "cat ch9.tb7.txt" 
)

scan( 
  file="ch9.tb7.txt", 
  what=character(), 
  allowEscapes=TRUE, 
  comment.char="#" 
)
cat( 
  scan( 
    file="ch9.tb7.txt", 
    what=character(), 
    allowEscapes=TRUE, 
    comment.char="#" 
  )
)
scan( 
  file="ch9.tb7.txt", 
  what=character(), 
  allowEscapes=FALSE, 
  comment.char="#" 
)
cat( 
  scan( 
    file="ch9.tb7.txt", 
    what=character(), 
    allowEscapes=FALSE, 
    comment.char="#" 
  ) 
)

matrix( 
  scan( 
    text="1 2 3 4 5 6 7 8 9 10" 
  ), 
  2, 
  5, 
  byrow=TRUE 
)

# read.table() and read.csv()

system( "cat ch9.tb2.txt" )

read.table( 
  file="ch9.tb2.txt", 
  header=TRUE, 
  sep=","  
)
read.csv( 
  file="ch9.tb2.txt", 
  comment.char="#"  
)

read.table( 
  text="1 2 3 4 \n 2 3 4 5" 
)


cat(
  '01 TRUE  1 1.1 1+0i "a"\n02 FALSE 2 2  2 "b"\n',
  file="ch9.tb10.txt"
)
system( 
  "cat ch9.tb10.txt" 
)

read.table( 
  file="ch9.tb10.txt"
)
read.table( 
  file="ch9.tb10.txt", 
  colClasses=c( V1="raw" ) 
)

read.table( 
  file="ch9.tb10.txt", 
  col.names=c( "col1", "col2", "col3", "col4", "col5", "col6" ), 
  row.names=2 
)

# readline()

ch9.rlex = function() {
  ans = readline( 
    "Are you tall? (y/n): " 
  )
  if( ans=="y" | ans=="Y" ) {
    print( "YOU are tall." )
  }
  else { 
    if( ans=="n" | ans=="N" ) {
      print( "YOU are not tall.")
    }
    else print( "Wrong answer." )
  }
}
  
ch9.rlex()
y
ch9.rlex()
N
ch9.rlex()
no

# dget() and source()

dget( 
  "" 
)
print( round( rnorm( 4 ), 2 ) )

ch9.dg1 = dget( 
  "" 
)
function() print( round( rnorm( 4 ), 2 ) )

ch9.dg1
ch9.dg1()

cat( 
  "x=1:3\nprint( x )", 
  file="ch9.dg2.txt" 
)
system( 
  "cat ch9.dg2.txt" 
)

dget( 
  "ch9.dg2.txt" 
)
ch9.dg2=dget( 
  "ch9.dg2.txt" 
)
ch9.dg2

source(
  "ch9.dg2.txt" 
)

cat(
  "function ( x = 1:3 )\n  print( x )",
  file="ch9.dg3.txt"
)
system( 
  "cat ch9.dg3.txt" 
)

ch9.dg3=dget( 
  "ch9.dg3.txt" 
)
ch9.dg3
ch9.dg3()

ch9.sc3 = source(
  "ch9.dg3.txt"
)
ch9.sc3
ch9.sc3$value()

cat(
  "function( x=4 )
print( round( rnorm( x ), 2 ) )",
  file="ch9.dg4.txt"
)
system( 
  "cat ch9.dg4.txt" 
)

dget( 
  "ch9.dg4.txt", 
  keep.source=TRUE 
)
dget( 
  "ch9.dg4.txt" 
)


# loadhistory

savehistory( 
  "ch9.Rhistory"
)
loadhistory( 
  "ch9.Rhistory" 
)

# load() and attach()

save(
  atl.strm,
  atl.strm.plot.fun,
  file="ch9.ldex.bin"
)
load( 
  "ch9.ldex.bin" 
)
load( 
  "ch9.ldex.bin", 
  verbose=TRUE 
)

rm( 
  atl.strm 
)
atl.strm

attach( 
  "ch9.ldex.bin", 
  name="one" 
)

nrow(
  atl.strm
)
ls( 
  pat="atl.strm" 
)

detach( 
  one 
) 
atl.strm

# readRDS()

saveRDS( 
  atl.strm.plot.fun, 
  "ASPF" 
)
rm( 
  atl.strm.plot.fun 
)
ls( 
  pat="atl.strm.plot.fun" 
)

atl.strm.plot.fun = readRDS( 
  "ASPF" 
  )
ls( 
  pat="atl.strm.plot.fun" 
)

# readBin() and readChar()

writeBin( 
  "one, two, three", 
  "ch9.rbex.bin" 
)

readBin( 
  "ch9.rbex.bin", 
  character() 
)
readBin( 
  "ch9.rbex.bin", 
  raw(), 
  n=100 
)

readChar( 
  "ch9.rbex.bin", 
  nchars=15 
)
readChar( 
  "ch9.rbex.bin", 
  nchars=c( 3, 2, 3, 2, 5 ) 
)

# serialize()

serialize( 
  "one, two, three", 
  NULL 
)
unserialize( 
  serialize( 
    "one, two, three", 
    NULL 
  ) 
)

ch9.serex = serialize( 
  "one, two, three", 
  connection=NULL 
)
unserialize( 
  ch9.serex 
)

ch9.sercon = gzfile( 
  "ch9.serex.bin", 
  "wb" 
) 
serialize( 
  "one, two, three", 
  connection=ch9.sercon 
)

close( 
  ch9.sercon 
)
ch9.sercon = gzfile( 
  "ch9.serex.bin", 
  "rb" 
) 
unserialize( 
  connection=ch9.sercon 
)
close(
  ch9.sercon
)

# library(), attach(), and data()

  # Example 1

search()
names( 
  loo::milk 
)
attach( 
  loo::milk 
)

search()
loo::milk$mass[ 1:5 ]
mass[ 1:5 ]

# Example 2
  
names( 
  colorspace::USSouthPolygon 
)
attach( 
  colorspace::USSouthPolygon 
)

search()              
colorspace::USSouthPolygon$x[ 1:5 ]
x

detach( 
  colorspace::USSouthPolygon 
)
detach( 
  loo::milk 
)
search()

# data()

library( 
  datasets 
)
airmiles
ls( 
  pattern="air" 
)

data( 
  "airmiles", 
  package="datasets" 
)
ls( 
  pattern="air" 
)

  # datasets

data( 
  package="graphics" 
)
data( 
  package="graphics" 
)$results

data( 
  package="colorspace" 
)
data( 
  package="colorspace" 
)$results

# probability distribution functions

round( 
  dbinom( 
    0:5, 
    5, 
    0.4 
  ), 
  3 
)
round( 
  pbinom( 
    0:5, 
    5, 
    0.4 
  ), 
  3 
)
qbinom( 
  0:5/5, 
  5, 
  0.4 
)
rbinom( 
  6, 
  5, 
  0.4 
)

# sample

sample( 
  10 
)
sample( 
  10, 
  5 
)
sample( 
  c( "a1", "a2", "a3" ), 
  6, 
  replace=TRUE 
)
sample( 
  11:21, 
  prob=1:11 
)

# c()

rw = as.raw( 
  c( 36, 37, 38, 39 ) 
)
rw
c( 
  rw, 
  rw 
)
c( 
  rw, 
  TRUE 
)
c( 
  rw, 
  40L 
) 
c( 
  rw, 
  40.5 
)
c( 
  rw, 
  1+1i 
)
c( 
  rw, 
  "six" 
)

c( 
  a=1, 
  b=2, 
  3 
)

ch9.lst2 = list(
  matrix(
    1:4,
    2,
    2,
    dimnames=list(
      NULL,
      c( "cl1", "cl2" ) 
    )
  ),
  c(
    "abc",
    "cde"
  )
)
c( 
  ch9.lst2, 
  1:2 
)
c( 
  ch9.lst2, 
  1:2, 
  recursive=TRUE 
)
ch9.expr = expression( 
  y ~ x, 
  `1` 
)
c( 
  ch9.lst2, 
  ch9.expr 
)

# seq()

seq( 
  -3.3 
)

seq( 
  3, 
  10 
)

seq( 
  3, 
  10, 
  2 
)

seq( 
  3, 
  10, 
  len=5 
)

seq( 
  3, 
  10, 
  along=c( 1, 2, 1, 2 , 1 ) 
)
seq( 
  c( 1, 2, 1, 2 ) 
)

seq( 
  len=4 
)
seq( 
  7, 
  along=c( 1, 2, 1, 2 ) 
)
seq( 
  7, 
  len=4 
)

# rep()

rep( 
  0, 
  5 
)
rep( 
  1:3, 
  3 
)
rep( 
  1:3, 
  2:4 
)

rep( 
  1:3, 
  each=3 
)


rep( 
  1:3, 
  each=3, 
  times=2 
  )
rep( 
  rep( 
    1:3, 
    times=2:4 
  ), 
  each=2 
)
rep( 
  rep( 
    1:3, 
    times=2:4 
  ), 
  times=2 
)

rep( 
  rep( 
    1:3, 
    times=2:4 
  ), 
  times=2, 
  len=10 
)

# combn()

combn( 
  1:3, 
  2 
)
combn( 
  3, 
  2, 
  FUN=sum, 
  simplify=FALSE 
)

# permsn()

library( 
  prob 
)
permsn( 
  3, 
  2 
)

# expand.grid()

expand.grid( 
  a=1:2, 
  b=3:4, 
  c=5:6 
)

# paste() and paste0()

paste( 
  1:3 
)
paste( 
  "a", 
  1:3 
)
paste0( 
  "a", 
  1:3 
)

paste0( 
  "a", 
  1:3, 
  collapse=".." 
)
paste0( 
  character(0), 
  1:3, 
  recycle0=TRUE 
)
paste0( 
  character(0), 
  1:3, 
  recycle0=FALSE 
)
