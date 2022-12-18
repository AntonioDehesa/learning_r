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

flights_sml <- select(flights, year: day,
                      ends_with("delay"),
                      distance, 
                      air_time)
flights_sml
mutate(flights_sml,
       gain = arr_delay - dep_delay,
       speed = distance / air_time * 60)

transmute(flights, 
          gain = arr_delay - dep_delay,
          hours = air_time / 60,
          gain_per_hour = gain/hours)
# You can create pipelines, in order to avoid naming every 
# intermediate result
delays <- flights %>%
  group_by(dest) %>%
  summarize(
    count = n(),
    dist = mean(distance, na.rm = TRUE),
    delay = mean(arr_delay, na.rm = TRUE)
  ) %>%
  filter(count>20, dest != "HNL")
delays
# The symbol %>% is the pipeline, wich can be read as "then". 
# Select 
select(flights, year, month, day)
?summarize
not_cancelled <- flights %>%
  filter(!is.na(dep_delay), !is.na(arr_delay))
delays <- not_cancelled %>%
  group_by(tailnum) %>%
  summarize(
    delay = mean(arr_delay)
  )
ggplot( data = delays, mapping = aes(x = delay)) + 
  geom_freqpoly(binwidth = 10)
delays <- not_cancelled %>%
  group_by(tailnum) %>%
  summarize(
    delay = mean(arr_delay, na.rm = TRUE),
    n = n()
  )
ggplot( data = delays, mapping = aes(x = n, y = delay)) + 
  geom_point(alpha = 1/10)
delays %>%
  filter(n > 25) %>%
  ggplot(mapping = aes(x = n, y = delay)) +
  geom_point(alpha = 1/10)
# Exercises
x <- not_cancelled %>% count(dest)
y <- not_cancelled %>% count(tailnum, wt = distance)
res1 <- not_cancelled %>%
  group_by(dest) %>%
  summarise(n = n())
# These two seem to be the same, so its ok
res2 <- not_cancelled %>% 
  group_by(tailnum) %>%
  tally(distance)
