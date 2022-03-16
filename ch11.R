# Chapter 11

# dim()

ch11.v.1 = 1:2
ch11.v.2 = 3:5
ch11.v.1 %o% ch11.v.2 %o% ch11.v.1
dim( 
  ch11.v.1 
)
dim( 
  ch11.v.1 %o% ch11.v.2 %o% ch11.v.1 
)

ch11.v.3 = ch11.v.1 %o% ch11.v.2
ch11.v.3
dim( 
  ch11.v.3 
)
dim( 
  ch11.v.3 
  ) = c( 3, 2 )
ch11.v.3

# nrow(), ncol(), NROW(), and NCOL()

ch11.v.1 %o% ch11.v.2
nrow( 
  ch11.v.1 %o% ch11.v.2 
)
ncol( 
  ch11.v.1 %o% ch11.v.2 
)
nrow( 
  ch11.v.1
)
NROW( 
  ch11.v.2  
)
NCOL( 
  ch11.v.2 
)

# length()

ch11.mat = matrix( 
  1:4, 
  2, 
  2 
)
ch11.mat
length( 
  ch11.mat 
)

ch11.list = list( 
  ch11.mat, 
  c( 
    "abc", 
    "cde" 
  ) 
)
ch11.list
length( 
  ch11.list 
)

ch11.fun = log
length( 
  ch11.fun 
)

ch11.lang = call( 
  "lm", 
  y~x 
)

ch11.lang
length( 
  ch11.lang 
)

ch11.exp = expression( 
  ch11.call, 
  sin( 1:5/180 * pi ) 
)
ch11.exp
length( 
  ch11.exp 
)

ch11.mat.2 = ch11.mat
length( 
  ch11.mat.2 
) = 6
ch11.mat.2

ch11.mat.2 = ch11.mat
length( 
  ch11.mat.2 
) = 3
ch11.mat.2

ch11.mat.2 = ch11.mat
length( 
  ch11.mat.2 
) = 4
ch11.mat.2

ch11.list
length( 
  ch11.list 
) = 3
ch11.list

length( 
  ch11.list 
) = 1
ch11.list

# nchar()

ch11.list = list( 
  matrix( 
    1:4, 
    2,
    2 
  ), 
  c( 
    "abc", 
    "cde" 
  ), 
  NULL 
)
ch11.list
as.character( 
  ch11.list 
)
nchar( 
  ch11.list 
)

ch11.df=data.frame( 
  1, 
  NA, 
  12 
)
as.character( 
  ch11.df 
)
nchar( 
  ch11.df, 
  keepNA=FALSE 
)
nchar( 
  ch11.df, 
  keepNA=TRUE 
)

ch11.mat.2 = as.matrix( 
  ch11.df 
)
as.character( 
  ch11.mat.2 
)
nchar( 
  ch11.mat.2, 
  keepNA=FALSE 
)
nchar( 
  ch11.mat.2, 
  keepNA=TRUE 
)

# nzchar()

nzchar( 
  c( "1", NA, "12", "" ), 
  keepNA=FALSE 
)
nzchar( 
  c( "1", NA, "12", "" ), 
  keepNA=NA 
)
nzchar( 
  c( "1", NA, "12", "" ), 
  keepNA=TRUE 
)

# rbind() and cbind()

rbind( 
  1:2, 
  3:5 
)
cbind( 
  1:3, 
  ch11.mat 
)
cbind( 
  1:3, 
  data.frame( ch11.mat ) 
)
cbind( 
  1:4, 
  data.frame( ch11.mat ) 
)

ch11.list.2 = list( 
  one=1:3, 
  two=1:5 
  )
ch11.list.2
rbind( 
  ch11.list, 
  ch11.list.2 
)
cbind( ch11.list.2, 
       1:2, 
       1:3 
     )
cbind( ch11.list.2, 
       1:2, 
       1:3, 
       deparse.level=0 
      )
cbind( 
  ch11.list.2, 
  1:2, 
  1:3, 
  deparse.level=2 
)

# apply()

ch11.mat.3 = matrix( 
  1:4, 
  2, 
  2, 
  dimnames=list( 
    c( "r1", "r2" ),
    c( "c1", "c2" ) 
  ) 
)
ch11.mat.3

apply( 
  X=ch11.mat.3, 
  MARGIN=1, 
  FUN=sum 
)

apply( 
  X=ch11.mat.3, 
  MARGIN=1, 
  FUN=sum,
  simplify=FALSE
)

round(
  apply( 
    ch11.mat.3, 
    1, 
    pnorm, 
    3, 
    2 
  ),
  3
)

round(
  apply( 
    ch11.mat.3, 
    1, 
    pnorm, 
    3, 
    2
  ),
  3
)


ch11.array = array( 
  1:8, 
  c( 2, 2, 2 ), 
  dimnames=list( 
    c( "x1", "x2" ), 
    c( "y1", "y2" ), 
    c( "z1", "z2" ) 
  ) 
)

ch11.array

apply( ch11.array, 
       c( 1, 3 ), 
       mean 
)

# lapply(), sapply(), vapply(), and rapply()

# lapply()

ch11.list.3 = list( 
  1:7, 
  3:4 
)
ch11.list.3

lapply( 
  ch11.list.3, 
  sum 
)

lapply( 
  1:2, 
  "^", 
  2 
)

#  sapply()

sapply( 
  ch11.list.3, 
  sum 
)

ch11.char = paste0( 
  "a", 
  7:9 
  )
ch11.char

sapply( 
  ch11.char, 
  paste0, 
  "b" 
)
sapply( 
  ch11.char, 
  paste0,  
  "b", 
  USE.NAMES=FALSE 
)

# vapply()

set.seed( 49676 )
ch11.val=1:2
round(
  vapply( 
    X=ch11.val, 
    FUN=rnorm, 
    FUN.VALUE=matrix( 0.1, 2, 2 ), 
    n=4, 
    sd=1 
    ),
  3
)

# rapply()

ch11.list.4 = list( 
  list( 
    1:3, 
    4:5 
  ), 
  paste0( 
    "p", 
    1:3 
  ) 
)
ch11.list.4
rapply( 
  ch11.list.4, 
  sum, 
  classes="integer" 
)
rapply( 
  ch11.list.4, sum, 
  classes="integer", 
  deflt=NA 
)
rapply( 
  ch11.list.4, sum, 
  classes="integer", 
  deflt=NA, 
  how="replace" 
)
rapply( 
  ch11.list.4, sum, 
  classes="integer", 
  deflt=NA, 
  how="list" 
)
rapply( 
  ch11.list.4, 
  paste0, 
  classes="character", 
  deflt=NULL, 
  how="unlist", 
  ":" 
)

# tapply()

ch11.ta.1 = sample( 
  1:4, 
  100, 
  re=TRUE 
)
ch11.ta.2 = sample(
  5:6,
  100,
  re=TRUE
)
ch11.ta.1[ 1:8 ]
ch11.ta.2[ 1:8 ]

ch11.ta.f = paste0( 
  "a", 
  c( 1, 1, 2, 2 ) 
)

ch11.ta.f.1 = paste0( 
  "a", 
  c( 1, 1, 2, 2, 1, 1, 2, 2 ) 
)

ch11.ta.f.2 = paste0( 
  "b", 
  c( 3, 4, 3, 4, 3, 4, 3, 4 ) 
)

table( 
  ch11.ta.1 
)

tapply( 
  table( ch11.ta.1 ), 
  ch11.ta.f, 
  NULL 
)

table( ch11.ta.1 )
tapply( 
  table( ch11.ta.1 ), 
  ch11.ta.f, 
  mean 
)
tapply( 
  table( ch11.ta.1 ),
  ch11.ta.f, 
  "^", 
  2 
)

table( 
  ch11.ta.1, 
  ch11.ta.2 
)

tapply( 
  table( 
    ch11.ta.1, 
    ch11.ta.2 
  ), 
  list( 
    ch11.ta.f.1,
    ch11.ta.f.2
  ),
  NULL
)

tapply( 
  table( 
      ch11.ta.1, 
      ch11.ta.2 
  ), 
  list( 
    ch11.ta.f.1,
    ch11.ta.f.2
  ),
  mean 
)

# mapply()

set.seed( 43529 )

ch11.ma.1 = matrix( 
  1, 
  4, 
  4 
)
ch11.ma.2 = round(
  matrix( 
    runif( 9 ), 
    3, 
    3 
  ),
  2
)
ch11.ma.2
ch11.ma.3 = 1:2

round( 
  mapply( 
    det,  
    list( 
      ch11.ma.1, 
      ch11.ma.2
    )
  ),
  4
)

round(
  mapply( 
    mean, 
    list( 
      ch11.ma.1, 
      ch11.ma.2, 
      ch11.ma.3 
    ) 
  ),
  3
)

mapply( 
  sum, 
  list( 
    ch11.ma.1, 
    ch11.ma.2 
    ), 
  ch11.ma.3,
  MoreArgs=NULL, 
  SIMPLIFY=TRUE, 
  USE.NAMES=TRUE 
)

round(
  mapply( 
    cor,
    list( 
      1:16 + runif( 16 )*4, 
      1:9 + runif( 9 )*4 
    ),
    list( 
      1:16, 
      1:9
    ),
    MoreArgs=list( 
        method="kendall" 
    )
  ),
  3
)

# eapply()

set.seed( 38994 )
ch11.en = new.env()
ch11.en

ch11.en$a = 1:10
ch11.en$b = 11:20
ch11.en$c = rnorm( 100 )

ls( 
  ch11.en 
)

lapply(
  eapply( 
    ch11.en, 
    sd 
  ),
  round,
  3
)

# sweep()

set.seed( 36694 )

ch11.mat.4 = matrix( 
  sample( 
    1:8 
  ), 
  2, 
  4 
)
ch11.mat.4
ch11.cent = sweep( 
  ch11.mat.4, 
  1, 
  apply( 
    ch11.mat.4, 
    1, 
    mean 
  ) 
)
ch11.cent
round( 
  sweep( 
    ch11.cent, 
    1, 
    apply( 
      ch11.mat.4, 
      1, 
      sd 
    ), 
    "/" 
  ), 
  3 
)

# scale()

ch11.mat.5 = t( 
  ch11.mat.4 
)
round(
  t(
    scale( 
      ch11.mat.5 
    )
  ),
  3
)
ch11.mat.6 = matrix( 
  c( 
    1:8, 
    NA, 
    2 
  ), 
  2, 
  5 
)
ch11.mat.6
round(
  scale( 
    ch11.mat.6, 
    center=rep( 
      3, 
      5 
    ), 
    scale=rep( 
      4, 
      5 
    ) 
  ),
  3
)

# aggregate()
#  data frames

ch11.df=data.frame( 
  y1=1:3, 
  y2=7:9, 
  x=c( 
    1, 
    2, 
    1
  )
)
ch11.df

aggregate( 
  ch11.df[ , 1:2 ], 
  by=list( 
    ch11.df$x 
  ), 
  FUN=sum 
)

#  formulas

aggregate(
  cbind( y1, y2 )~x, 
  data=ch11.df, 
  FUN=sum 
)

#  time series

ch11.ts=ts( 
  cbind( 
    1:8, 
    9:16 
  ), 
  start=c( 
    1, 
    1 
  ), 
  freq=4 
)
ch11.ts
aggregate( 
  ch11.ts, 
  nfreq=2 
)
aggregate( 
  ch11.ts, 
  ndelt=2 
)

# table()

set.seed( 36694 )
ch11.smp.1=sample( 
  2, 
  100, 
  replace=TRUE 
)
ch11.smp.2=sample( 
  4:6, 
  100, 
  replace=TRUE 
)
ch11.smp.2[10]=NA
table( 
  ch11.smp.1, 
  ch11.smp.2 
)
table( 
  ch11.smp.1, 
  ch11.smp.2, 
  useNA="ifany" 
)

# tabulate()

tabulate( 
  c( 
    -3.5, 
    0.9, 
    1, 
    4, 
    5.6, 
    5.4, 
    4, 
    1, 
    3 
  ) 
)
tabulate( 
  c( 
    -3.5, 
    0.9, 
    1, 
    4, 
    5.6, 
    5.4, 
    4, 
    1, 
    3 
  ), 
  nbins=3 
)

# ftable()

set.seed( 38794 )
ch11.smp.3 = sample( 
  7:8, 
  100, 
  replace=TRUE 
)

ftable( 
  ch11.smp.1, 
  ch11.smp.2,
  ch11.smp.3 
)

ftable( 
  list( 
    ch11.smp.1,
    ch11.smp.2, 
    ch11.smp.3 
  ),
  row.vars=3, 
  col.vars=2:1 
)

ftable( 
  table( 
    ch11.smp.1, 
    ch11.smp.2, 
    ch11.smp.3
  ),
  row.vars=2, 
  col.vars=3 
)

# grep(), grepl(), agrep(), and agrepl()

ch11.char.1=c( 
  "achar1", 
  "achar2", 
  "achar3" 
)
ch11.char.1

grep( 
  "achar", 
  ch11.char.1 
)

grep( 
  "1", 
  ch11.char.1, 
  value=TRUE 
)

grep( 
  "Achar", 
  ch11.char.1 
)

grep( 
  "Achar", 
  ch11.char.1, 
  ignore.case=TRUE 
)

grep( "Achar", 
      ch11.char.1, 
      ignore.case=TRUE, 
      invert=T 
)

grepl( 
  "1", 
  ch11.char.1 
)

grepl( 
  "Achar", 
  ch11.char.1 
)

agrep( 
  "Achar", 
  ch11.char.1 
)

agrepl( 
  "Achar", 
  ch11.char.1 
)

# grepRaw()

charToRaw( 
  "abc123" 
)

grepRaw( 
  "b", 
  "abc123" 
)

grepRaw( 
  "b", 
  "abc123", 
  value=TRUE 
)

grepRaw( 
  "B", 
  "abc123", 
  value=TRUE, 
  ignore.case=T 
)

charToRaw(
  "abab" 
)

grepRaw( 
  "ab", 
  "abab" 
)

grepRaw( 
  "ab", 
  "abab", 
  all=TRUE 
)

grepRaw( 
  "ab", 
  "abab", 
  value=TRUE, 
  all=TRUE 
)

grepRaw( 
  "ab", 
  "Abab", 
  value=TRUE, 
  all=TRUE 
)

grepRaw( 
  "ab", 
  "Abab", 
  value=TRUE, 
  all=TRUE, 
  ignore.case=TRUE 
)

# regexpr(), gregexpr(), 
# regexec(), and gregexec()

regexpr( 
  "ab", 
  c( 
    "abab", 
    "ba" 
  ) 
)

ch11.rg=gregexpr( 
  "ab", 
  c( 
    "abab", 
    "ba" 
  ) 
)
ch11.rg
as.vector( 
  ch11.rg[[1]] 
)
attr( 
  ch11.rg[[1]], 
  "match.length" 
)

regexec( 
  "ab", 
  c( 
    "abab", 
    "ba" 
  ) 
)

ch11.rg.2=gregexec( 
  "ab", 
  c( 
    "abab", 
    "ba" 
  ) 
)
ch11.rg.2
as.vector( 
  ch11.rg.2[[1]][ 1, ] 
)
attr(
  ch11.rg.2[[1]], 
  "match.length" 
)

# tolower(), toupper(), 
# casefold(), and chartr()

tolower(  
  c( 
    "Jane Doe", 
    "John Doe" 
  ) 
)

casefold( 
  c( 
    "Jane Doe", 
    "John Doe" 
  ) 
)

toupper(  
  c( 
    "Jane Doe", 
    "John Doe" 
  ) 
)

casefold( 
  c( 
    "Jane Doe", 
    "John Doe" 
  ), 
  upper=TRUE 
)

chartr( 
  "ao", 
  "oa",     
  c( 
    "Jane Doe", 
    "John Doe" 
  ) 
)

chartr( 
  "a-e", 
  "ABCDE", 
  c( 
    "Jane Doe", 
    "John Doe" 
  ) 
)

# substr(), substring(), and strsplit()

substr( 
  c( 
    "Jane Doe", 
    "John Doe", 
    "Ms. X" 
  ), 
  2, 
  7 
)

substr( 
  c( 
    "Jane Doe", 
    "John Doe", 
    "Ms. X" 
  ), 
  c( 
    6, 
    6, 
    0 
  ), 
  c( 
    8, 
    8, 
    0 
  ) 
)

ch11.char.2 = c( 
  "Jane Doe", 
  "John Doe", 
  "Ms. X" 
)
substr( 
  ch11.char.2, 
  6, 
  7 
) = "SoA"
ch11.char.2

substring( 
  ch11.char.2, 
  c( 
    2, 
    2, 
    4 
  ) 
) = "osa"
ch11.char.2

strsplit( 
  "a.b.b", 
  "b." 
)

strsplit( 
  "a.b.b", 
  "." 
)

strsplit( 
  "a.b.b", 
  "[.]" 
)

strsplit( 
  c( 
    "a.b.b", 
    "d.f.d" 
  ), 
  "" 
)
