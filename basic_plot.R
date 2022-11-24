#install.packages("name") # This one installs new packages
library(datasets) # This one imports the packages without a confirmation message
#require(datasets) # This one imports the packages, with a confirmation message
head(iris) # imports a basic dataset

#?plot # This one provides help, ?, and you provide what you want help with after ?
plot(iris$Species) # From the dataset iris, use the variable Species
plot(iris$Petal.Length) # From the dataset iris, use the variable Petal
plot(iris$Species, iris$Petal.Width) # Cuantitative and qualitative variables in x,y
plot(iris$Petal.Length, iris$Petal.Width) # Scatter plot
#plot with options
plot(iris$Petal.Length, iris$Petal.Width,
     col = "#cc0000", #Hex code for datalab.cc red
     pch = 19,        # Use solid circles for points
     main = "Iris: Petal Length vs. Petal Width", # title
     xlab = "Petal Length",
     ylab = "Petal Width")

plot(cos, 0 , 2*pi) # We can pass formulas
