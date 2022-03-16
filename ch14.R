# Chapter 14

# ifelse()

# basic example

ifelse( 
  c( TRUE, TRUE, FALSE, TRUE ), 
  c( 1, 2, 1, 2 ), 
  c( 4, 5, 6, 4 ) 
)

# structure of result 
#  matrix as the condition and numbers or 
#  numbers and a list as choices

ch14.mat = matrix( 
  0:3,
  2, 
  2 
)
ch14.mat

ch14.list = list( 
  ch14.mat, 
  c( "a", "b", "c" ) 
)
ch14.list

ifelse( 
  ch14.mat, 
  1:4, 
  30:33 
) 

ifelse( 
  ch14.mat, 
  1:4, 
  ch14.list 
)

#  test shorter than yes and no

ifelse( 
  c( TRUE, FALSE ), 
  1:5, 
  10:15 
)

#  test is longer than yes and no

ifelse( 
  c( TRUE, FALSE, FALSE, FALSE, TRUE ), 
  1:3, 
  10:12 
)

# mixing integer and complex choices
# and what raw choices return

ifelse( 
  c( TRUE, FALSE, FALSE, FALSE, TRUE ), 
  1:5+1i, 
  1:5 
)
ifelse( 
  c( TRUE, FALSE, FALSE, FALSE, TRUE ), 
  as.raw( 2:6 ), 
  as.raw( 12:16 ) 
)

# a function as a choice

ch14.fun = function( 
  mu, 
  se=1, 
  alpha=.05 
  ){
  q_value = qnorm( 
    1-alpha/2, 
    mu, 
    se 
  )
  q_value
}

ifelse( 
  0:3, 
  round( 
    ch14.fun( 1:2 ), 
    3 
  ), 
  round( 
    ch14.fun( 3 ), 
    3 
  )
)

# Markov chain

set.seed( 6978 )
mc="A"
for ( i in 2:6 ) {
   rn = runif( 1 )
   mc = c( 
     mc, 
     ifelse( 
       mc[ i-1 ]=="A", 
       ifelse( 
         rn <= 0.7, 
         "A", 
         "B" 
       ), 
       ifelse( 
         rn <= 0.8, 
         "B", 
         "A" 
       ) 
     ) 
   )
}
mc

# switch()

# basic example with an integer condition

switch( 
  3, 
  5, "a", "b", 6 
)

# numeric condition is less than one
# result returned quietly

switch( 
  0, 
  1, 2, 3 
)
ch14.sw = switch( 
  0, 
  1, 2, 3 
)
ch14.sw

# basic example with a character condition

switch( 
  "e", 
  a=1, b=2, c=3, d=4, 
  e=round( ch14.fun( 0 ), 3 ) 
)

# character condition not in choices 
# default value exists

switch( 
  "e", 
  a=1, b=2, c=3, d=4, 
  25 
)

switch( 
  "e", 
  a=1, b=2, c=3, d=4 
)
typeof( 
  switch( 
    "e", 
    a=1, b=2, c=3, d=4 
  ) 
)

# character condition has empty choice

switch( 
  "b", 
  a=1, b=, c=3, d= 
)

switch( 
  "b", 
  a=1, b=, c=, d= 
)
typeof( 
  switch( 
    "b", 
    a=1, b=, c=, d= 
  ) 
)

