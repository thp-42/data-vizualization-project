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

#SCATTERPLOT

df <- mtcars
pl.scatter <- ggplot(df, aes(x=wt, y=mpg))

# geom layer 
pl.scatter2 <- pl.scatter + geom_point( aes(shape=factor(cyl), color=hp))

pl.scatter3 <- pl.scatter2 + scale_color_gradient(low="blue", high="red")

# BARPLOT

df2 <- mpg
pl.barplot <- ggplot(df2, aes(x=class))
pl.barplot2 <- pl.barplot + geom_bar( aes(fill=drv))
pl.barplot2 <- pl.barplot + geom_bar( aes(fill=drv), position="dodge")
pl.barplot2 <- pl.barplot + geom_bar( aes(fill=drv), position="fill")


# BOX PLOT
df3 <- mtcars

pl.boxplot <- ggplot(df3,aes(x=factor(cyl), y=mpg))
print(pl.boxplot + geom_boxplot(aes(fill=factor(cyl))) + theme_bw())

# VARIABLE PLOTTING
#install.packages("hexbin")
#library(hexbin)
pl.varplot <- ggplot(movies, aes(x=year, y=rating))
pl.varplot2 <- pl.varplot + geom_density2d() + scale_fill_gradient(low="blue", high="red")

# COORDINATES and FACETING
ggplot(mpg, aes(x=displ,y=hwy)) + geom_point() + coord_cartesian(xlim=c(1, 5), ylim=c(15, 30))
ggplot(mpg, aes(x=displ,y=hwy)) + geom_point() + coord_fixed(ratio=1/5)

# divide the plot by cyl and drv
ggplot(mpg, aes(x=displ,y=hwy)) + geom_point() + facet_grid(. ~ cyl)
ggplot(mpg, aes(x=displ,y=hwy)) + geom_point() + facet_grid(drv ~ cyl)

## themes
#install.packages("ggthemes")
library(ggthemes)
ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point() + theme_dark()
ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point() + theme_minimal()
ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point() + theme_bw()
ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point() + theme_fivethirtyeight()


