install.packages("tidyverse")
library(tidyverse)
mpg
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy))
# ggplot created the coordinate system, which you can add layers to. 
# its first argument is the dataset to use in the graph. 
# + geom_point adds a layer to the empty canvas. A layer of points, for a scatterplot. 
ggplot(data = mpg)
# This is the blank canvas. 
mtcars
size_sum(mtcars)
# 32 rows, 11 columns 
?mpg
# drv is the type of drive train. 
ggplot(data = mpg) + geom_point(mapping = aes(x = hwy, y = cyl))
ggplot(data = mpg) + geom_point(mapping = aes(x = class, y = drv))


# You can add a third variable to a two-dimensional scatterplot by mapping it to
# an aesthetic, which is a visual property of the objects in your plot. 
# They include size, shape, or color of the points. 
#example of aesthetics
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, color = class))
# You could instead assign class to size
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, size = class))
# Exercises
# 1. Becuase the color is set inside the aes, instead of outside
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy), color = "blue")
?mpg
# 2. Categorical = manufacturer, model, trans, drv, fl, class
# Continuous = displ, year, cyl, cty, hwy
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, size = cyl))
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, size = manufacturer))
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, size = class))
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, color = displ < 5))
# Facets: a way to split the plot into subplots that each display one subset of the data
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy)) + facet_wrap(~ class)
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy)) + facet_wrap(. ~ cyl)
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy)) + facet_wrap( ~ cyl)
# Geometric Objects. 
# The way the plots are drawn. For example, 
# in the previous examples we were using geom_point. But we could use
# geom_line. This in ggplot2 syntax is called a geom.
ggplot(data = mpg) + geom_smooth(mapping = aes(x = displ, y = hwy))
ggplot(data = mpg) + geom_smooth(mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(x = displ, y = hwy))
# to avoid repetition, you can pass in global parameters
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + geom_point() + 
  geom_smooth()
# You can also override global settings
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + geom_point() + 
  geom_smooth(mapping = aes(color=class))
warnings()
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth(se = FALSE)
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth()
?stat_summary()
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, color = cut))
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut))
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity))
ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) + 
  geom_bar(alpha = 1/5, position = "identity")
?geom_bar
# In our first scatterplot we can see only 126 points, but there are a 
# total of 234 data points. So where are the other 109? 
# They may be overlapping each other, which is a problem known as
# overplotting. We can solve this using the position = "jitter"
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy), 
                                position = "jitter")
# This adds random noise to each point, so even if they were both
# going to be in the same position, as each of them has a different noise,
# now they appear side to side.

# Coordinate Systems
# Coord flip: useful too switch x and y axes, to get horizontal boxplots.
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot() + coord_flip()

# There are coord_quickmap for geographical data, 
# and coord_polar, to use polar coordinates
bar <- ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = cut), 
           show.legend = FALSE,
           width = 1) + 
  theme(aspect.ratio = 1) + 
  labs(x = NULL, y = NULL)
bar + coord_flip()
bar + coord_polar()
