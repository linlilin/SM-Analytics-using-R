library(twitteR)
library(devtools)
library(RCurl)
library(streamR)
library(stringr)
library(RJSONIO)
library(ROAuth)
requestURL <- "https://api.twitter.com/oauth/request_token"
accessURL <- "https://api.twitter.com/oauth/access_token"
authURL <- "https://api.twitter.com/oauth/authorize"
consumerKey <- "sAPghZUBAsklj1a964sXAVLc6" # From dev.twitter.com
consumerSecret <- "KT2TwnyUa4WglygXJZBMTjhwNX9CZOZkILw8iViNpqKgdJUac4" # From dev.twitter.com

my_oauth <- OAuthFactory$new(consumerKey = consumerKey,
                             consumerSecret = consumerSecret,
                             requestURL = requestURL,
                             accessURL = accessURL,
                             authURL = authURL)
my_oauth$handshake(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))

# PART2
save(my_oauth, file = "my_oauth.Rdata")