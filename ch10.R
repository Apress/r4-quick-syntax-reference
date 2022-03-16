# sink()

sink( 
  "ch10.f1.txt" 
)
round( 
  rnorm( 5 ), 
  3 
)
sink() 
system( 
  "cat ch10.f1.txt" 
)

# cat()

cat( 
    "zzzzzzz", 
    2:3, 
    "\n" 
)

cat( 
    "zzzzzzz", 
    2:3, 
    fill=3 
)

cat( 
  "zzzzzzz", 
  2:3,
  sep=c( "", "-", "+" ),
  fill=10,
  labels=paste0( "row:", 1:3 )
)

cat( 
  "zzzzzzz", 
  2:3, 
  file="ch10.f2.txt", 
  fill=TRUE 
)
cat( 
  file="|cat ch10.f2.txt" 
)

cat( 
  "zzzzzzz", 
  2:3, 
  file="ch10.f2.txt", 
  fill=TRUE, 
  append=TRUE 
)
cat( 
  file="|cat ch10.f2.txt" 
)

# write()

x=1:4
y=5:8
b = rep( 
  " ", 
  4 
)
z=rbind( 
  x, 
  y 
)
w=paste0( 
  "a", 
  1:3 
)

write( 
   c( 
     x, 
     y, 
     b, 
     z, 
     b, 
     w 
    ), 
   file="", 
   ncol=4, 
   sep=" + " 
)

# write.table(), write.csv(), and write.csv2()

ch10.mat = matrix( 
   1:4+0.0, 
   2, 
   2, 
   dimnames=list( 
       c( "r1", "r2" ), 
       c( "c1", "c2" ) 
     ) 
 )
ch10.mat

write.table( 
  ch10.mat 
)

write.table( 
  ch10.mat, 
  col.names=NA 
)

write.table( 
  ch10.mat, 
  col.names=FALSE 
)

write.csv( 
  ch10.mat 
)

write.csv2( 
  ch10.mat, 
  quote=FALSE 
)

# writeLines()

ch10.vec.chr = c( 
  "one", 
  "two" 
)
ch10.vec.chr

writeLines( 
   ch10.vec.chr 
)

writeLines( 
   ch10.vec.chr, 
   sep="\t" 
)

writeLines( 
   ch10.vec.chr, 
   sep="-+-" 
)
  
writeLines( 
   ch10.vec.chr, 
   con="ch10.wl.txt", 
   sep="-+-\n" 
   )
cat( 
   file="| cat ch10.wl.txt" 
)

wlcon = file( 
   "ch10.wl.txt", 
   open="at" 
)
writeLines( 
   ch10.vec.chr, 
   con=wlcon, 
   sep="-+-" 
)

close( wlcon )
cat( 
  file="| cat ch10.wl.txt" 
)

# dput()

ch10.dp.fun = function(){
  # example for dput()
  b = rnorm( 5 ) # normal random number generator
  b
}

dput( 
  ch10.dp.fun 
)

dput( 
  ch10.dp.fun, 
  control=NULL 
)

dput( 
  ch10.dp.fun, 
  control="all" 
)

dput( 
  1L:3L 
)
dput( 
  1L:3L, 
  control=NULL 
)
dput( 
  1L:3L, 
  control="all" 
)

# dump()

a = function(){ 
  print( 1:4 ) 
}
b = expression( x~y )
c = list( 1:4, "a" )
d = c( 1, 2, 3, 4 )

dump( 
     c( 
       "a", 
       "b", 
       "c", 
       "d" 
      ), 
     file="" 
)

# savehistory()

savehistory( 
  "ch10.Rhistory" 
)
rh = readLines( 
  "ch10.Rhistory" 
)
rh[ 511:512 ]

# save() and load()

save( 
  "ClintonCorpus", 
  "mat", 
  list=c( 
    "junk", 
    "trst" 
  ), 
  file="ch10.bin" 
)

load( 
  "ch10.bin", 
  ver=TRUE 
 )

class( 
  junk 
)
class( 
  trst 
)
class( 
  ClintonCorpus 
)
class( 
  mat 
)

# writeBin()

writeBin( 
  object=1:3, 
  con=raw() 
)
readBin( 
     writeBin( 
       1:3, 
       raw() 
      ),
     what=integer(), 
     n=3 
)

# writeChar()

ch10.rc.1 = writeChar( 
    object=c( "a", "ab", "abc" ), 
    con=raw(), 
    nchars=c( 1, 2, 3 ), 
    eos=NULL 
)

readChar( 
    con=ch10.rc.1, 
    nchars=c( 1, 2, 3 )
)

ch10.rc.2= writeChar( 
    c( "a", "ab", "abc" ), 
    raw(), 
    c( 1, 0, 3 ), 
    eos=NULL 
)

readChar(
    ch10.rc.2,
    c( 1, 3 )
)

writeChar(
  object=c( "a", "ab", "abc" ),
  con="ch10.rc.1.bin",
  nchars=c( 1, 2, 3 ),
  eos=""
)

readChar(
  con="ch10.rc.1.bin",
  nchars=c( 1, 2, 3 )
)

readChar(
  "ch10.rc.1.bin",
  c( 2, 3, 4 )
)

readChar(
  "ch10.rc.1.bin",
  c( 3, 4, 5 )
)

# serialize()

ch10.sr.fun = function( x=1:3 ) { 
  print( x ) # example 
}
ch10.sr.fun

ch10.sr.txt = serialize(
  object=ch10.sr.fun,
  connection=NULL,
  ascii=TRUE
)
ch10.sr.txt[ 1:12 ]
unserialize( 
  ch10.sr.txt 
)

srcon = gzfile( 
  "ch10.sr.bin", 
  "w+b" 
)
serialize(
  object=ch10.sr.fun,
  connection=srcon
)
close( srcon )

srcon = gzfile( 
  "ch10.sr.bin", 
  "r+b" 
)
unserialize( 
  srcon 
)
close( srcon )


