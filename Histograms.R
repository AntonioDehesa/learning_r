# Histograms
library(datasets)

head(iris)

hist(iris$Sepal.Length)
# It automatically tells us the frequency, and chooses an appropiate number of 
# columns 

# We can specify the number of rows and columns (groups) for the histogram
par(mfrow = c(3,1)) # par = parameter. c = concatenate, as in, 
# treat these 2 numbers as one unit

hist(iris$Petal.Length [iris$Species == "setosa"], # Variable, and row selection
     xlim=c(0,3), # range of x
     break = 9, # Suggests how many bars in the histogram, but does not guarantee it
     main = "Petal Width for Setosa", # Title of the histogram
     xlab = "", # No x label
     col = "red") # bars are red

# Once you are done with your hist, you should return the parameters to the default.
par(mfrow = c(1,1))