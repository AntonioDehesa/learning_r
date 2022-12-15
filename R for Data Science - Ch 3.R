# Chapter 3: Data Transformation with dplyr
#install.packages("nycflights13")
#install.packages("tidyverse")
#install.packages("dplyr")
library(nycflights13)
library(tidyverse)
library(dplyr)
?flights
flights
jan1 <- filter(flights, month == 1, day == 1)
is.na(jan1)
(ex1 <- filter(flights, arr_delay > 120 &
                (dest %in% c("IAH","HOU")) &
                 (carrier %in% c("DL","UA","AA")) & 
                 (month %in% 7:9)))
# or
(ex2 <- filter(flights, arr_delay > 120 &
                 (dest %in% c("IAH","HOU")) &
                 (carrier %in% c("DL","UA","AA")) & 
                 between(month,7,9)))
ex1 == ex2
sorting <- arrange(flights, desc(dep_delay))
sorting
fastest_flights <- arrange(flights, air_time)
fastest_flights
select(flights, year:day) # select cols from year to day
select(flights, -(year:day)) # select every col except from year to day

rename(flights, tail_num = tailnum)
select(flights, time_hour, air_time, everything())
select(flights, air_time,air_time,air_time)