# Chapter 3: Data Transformation with dplyr
#install.packages("nycflights13")
#install.packages("tidyverse")
install.packages("dplyr")
library(nycflights13)
library(tidyverse)
library(dplyr)
?flights
flights
jan1 <- filter(flights, month == 1, day == 1)
