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
