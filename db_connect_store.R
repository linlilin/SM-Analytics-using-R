library(streamR)
library(twitteR)
library(RMySQL)
load("my_oauth.Rdata")
tw.puasa <- searchTwitter("puasa", n=50)
puasadf <- twListToDF(tw.puasa)

write.csv(puasadf, file="pupuasa.csv")

#connect_db
con <- dbConnect(dbDriver("MySQL"), user="root", password="", dbname="crawl_tweet")
dbWriteTable(conn = con, name="coba", value=puasadf)
dbListTables(con)
# filterStream(file.name = "tweets.json", # Save tweets in a json file
#              track = c("puasa", "ramadhan", "berbuka"), # Collect tweets mentioning either Affordable Care Act, ACA, or Obamacare
#              language = "id",
#              # locations = c(107.609810,-6.914744),
#              timeout = 360, # Keep connection alive for 60 seconds
#              oauth = my_oauth) # Use my_oauth file as the OAuth credentials
# tweets.df <- parseTweets("tweets.json", simplify = FALSE) # parse the json file and save to a 