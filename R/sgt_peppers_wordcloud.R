library(tm)
library(wordcloud)

setwd("Beatles/")



# Create document term matrix after some processing -------------------------

sgtp <- VCorpus(DirSource("SgtPeppers/"))

sgtp <- tm_map(sgtp, removePunctuation)
sgtp <- tm_map(sgtp, content_transformer(tolower))
sgtp <- tm_map(sgtp, removeNumbers)
sgtp <- tm_map(sgtp, stripWhitespace)
sgtp <- tm_map(sgtp, removeWords, stopwords("english")) 

dtm <- DocumentTermMatrix(sgtp)

freq <- colSums(as.matrix(dtm))



# Word cloud -----------------------------------------------------------------

set.seed(1)
wordcloud(names(freq), freq, min.freq = 5, colors = brewer.pal(3, "Accent"))
