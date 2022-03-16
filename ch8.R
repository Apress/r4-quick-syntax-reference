# Chapter 8

# script exaample

library( twitteR )
library( tm )
ck = "#########################"
cs = "##################################################"
at = "#################################################"
as = "############################################"
setup_twitter_oauth( 
  consumer_key=ck, 
  consumer_secret=cs, 
  access_token=at, 
  access_secret=as 
)

# Below, in the call to searchTwitter(),  Biden is the search topic, 
# 200 is the number of tweets to collect,
# English is the language for which to search, 
# 42.27 is the geographic latitude, -93.9 is the geographic longitude, 
# 200 miles is the radius of the circle around the latitude 
# and longitude within which to search,
# only recent tweets are collected, 
# and 120 retries are blocked before trying again
# if Twitter encounters a tweet limit. 

sr.1 = searchTwitter( 
  "Biden", 
  n=200, 
  lang="en", 
  geocode="42.27,-93.9,200mi", 
  resultType="recent", 
  retryOnRateLimit=120 
)
sr.1.df = twListToDF( sr.1 )
tf = termFreq( sr.1.df$text,
               control=list( 
                 tolower=TRUE, 
                 stopwords=TRUE, 
                 removePunctuation=TRUE, 
                 stemming=TRUE 
               ) 
)

sort( 
  tf[ tf>11 ], 
  decreasing=TRUE 
)

# calling a function

f.fun = function(  
  mu, 
  se=1, 
  alpha=.034 
){
  q_value = qnorm( 1-alpha/2, mu, se )
  q_value
}

f.fun( 
  se=1, 
  mu=0, 
  alpha=0.034 
)
f.fun( 
  0, 
  1, 
  0.067 
)
f.fun( 
  0, 
  alpha=0.129 
)
f.fun( 
  4,
  4 
)
f.fun( 
  se=1, 
  0, 
  0.129 
)

# arguments

x = c( 2.001, 2.000, 2.000 )
y = c( 4.03, 4.00, 4.01 )
lm( y~x )
lm( y~x, tol=.001 )

# output from a function

a.lm = lm( y~x )
a.lm$coef
a.lm$fit
a.lm$rank
a.lm$weights
a.lm$df
a.lm$call
a.lm$terms
a.lm$contrasts
a.lm$xlevels
a.lm$offset
a.lm$y
a.lm$x
a.lm$model
a.lm$na.action
