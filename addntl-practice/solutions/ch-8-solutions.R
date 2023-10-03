library(tidyverse)

car_crashes <- read_csv('datasets/car_crashes.csv')
census <- read_csv('datasets/census-divisions.csv')
census

# 1. Numbers per billion -- turn into million
#   There are 1,000 millions in a billion

car_crashes <- car_crashes %>% 
  mutate(total_per_million = total/1000)

# 2. Average insurance for each region

car_crashes %>% 
  left_join(census) %>% 
  group_by(region) %>% 
  summarise(avg_premium = mean(ins_premium))

# 3. Visualize distribution of no_previous
# It looks normal! 

ggplot(data = car_crashes, aes(x = no_previous)) +
  geom_histogram()




