# 'title: "Class 05 Data Visualization"
# 'author: "Anu Chaparala (PID: A15484707)"
# today's objective: learn how to use ggplot(), aes(), and geom_point()

#start with scatter plot
#first, load ggplot2 using library(ggplot2)
#then, call ggplot2(cars)
#note, ggplot() function alone just defines the data set for the plot and creates an empty base on top of which we will add additional layers to build up our plot.
#so, aes() aesthetics, maps variables (i.e. columns) from your data set to the visual features of the plot

#every ggplot has a data + aes + geoms

#load data set
cars

# install ggplot using install.packages("ggplot2")

#then, load ggplot install
library(ggplot2)

# assign data set to ggplot
ggplot(cars)

# add axis
ggplot(data=cars) + aes(x=speed, y=dist)

# add points/lines/columns (geom_point or line or col)
ggplot(data=cars) + aes(x=speed, y=dist) + geom_point()

# add trend line
ggplot(data=cars) + aes(x=speed, y=dist) + geom_point() + geom_smooth()

# assign variable to plot for ease of recall

p <- ggplot(data=cars) + aes(x=speed, y=dist) + geom_point() + geom_smooth()

p

# add label annotations (labs()), and black and white theme using theme_bw()
ggplot(cars) + aes(x=speed, y=dist) + geom_point() +
labs(title="Speed and Stopping Distances of Cars", x="Speed (MPH)", y="Stopping Distance (ft)", 
     subtitle = "My informative subtitle text here",
     caption="Dataset: 'cars'") +
  geom_smooth(method="lm", se=FALSE) +
  theme_bw()

labelled_p <- ggplot(cars) + aes(x=speed, y=dist) + geom_point() +
  labs(title="Speed and Stopping Distances of Cars", x="Speed (MPH)", y="Stopping Distance (ft)", 
       subtitle = "My informative subtitle text here",
       caption="Dataset: 'cars'") +
  geom_smooth(method="lm", se=FALSE) +
  theme_bw()

labelled_p

#Base graphics is shorter method of graphing
plot(cars)

#let's get into more advanced aesthetics 
#Adjust the point size of a scatter plot using the (size) parameter.
#Change the point color of a scatter plot using the (color) parameter.
#Set a parameter (alpha) to change the transparency of all points.

url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
head(genes)
#find number of rows in data set
nrow(genes)
#find number of columns and column names
ncol(genes)
colnames(genes)
#use table() function on the State column name to find how many upregulated genes there are in this data.frame
table(genes$State)
#fraction of upregulated over total
round(table(genes$State)/nrow(genes) * 100, 2 )

#create scatter plot with genes data.frame and ggplot and add respective aesthetics
ggplot(genes) + aes(x=Condition1, y=Condition2) + geom_point()

p <- ggplot(genes) + aes(x=Condition1, y=Condition2, col=State) + geom_point()
p

#change colors
p + scale_colour_manual( values=c("gold","black","lemonchiffon") )

#add some plot annotations to the p object with the labs() function
p + scale_colour_manual(values=c("gold","black","lemonchiffon")) +
  labs(title="Gene Expresion Changes Upon Drug Treatment",
       x="Control (no drug) ",
       y="Drug Treatment")
#assign final plot to object
p_labelled_genes <- p + scale_colour_manual(values=c("gold","black","navy")) +
  labs(title="Gene Expresion Changes Upon Drug Treatment",
       x="Control (no drug) ",
       y="Drug Treatment")
p_labelled_genes

