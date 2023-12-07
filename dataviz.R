#install.packages('ggplot2')
#install.packages('ggplot2movies')
library(ggplot2)
library(ggplot2movies)

#HISTOGRAM
#data and aes layer
colnames(movies)
pl.hist <- ggplot(movies, aes(x=rating))

# geom layer
pl.hist2 <- pl.hist + geom_histogram(binwidth = 0.1, color="red", fill="pink", alpha=0.4, aes(fill=..count..))

# use count to decide color
pl.hist3 <- pl.hist + geom_histogram(binwidth = 0.1, aes(fill=..count..))

# Labels
pl.hist2 + xlab('Rating') + ylab('Count') + ggtitle("Histogram")
