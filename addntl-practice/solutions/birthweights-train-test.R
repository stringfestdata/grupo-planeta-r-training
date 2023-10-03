library(tidyverse)
library(tidymodels)\

birthweights <- read_csv('datasets/birthweights.csv')

# 1. Gestation vs smoker

ggplot(data = birthweights, aes(x = gestation))+
  geom_histogram()+
  facet_wrap(~ smoker)


t.test(gestation ~ smoker, data=birthweights)

# 2. Correlation

birthweights %>% 
  select(-c('ID', 'smoker')) %>% 
  cor()


# 3. Weight vs length viz

ggplot(aes(x=length, y=weight), data=birthweights) +
  geom_point()

# 4. Weight vs length regression

bw_reg <- lm(weight ~ length, data = birthweights)
summary(bw_reg)

# ~53% of change in Y is explained by X 


# 5. Split the dataset and validat model
set.seed(1234)
bw_split <- initial_split(birthweights)
bw_train <- training(bw_split)
bw_test <- testing(bw_split)


dim(bw_train)
dim(bw_test)
# These samples are skirting the lower side for
# representative samples, proceed with caution

# Specify what kind of model this is
lm_spec <- linear_reg()

# Fit the model to the data 
lm_fit <- lm_spec %>%
  fit(weight ~ length, data = birthweights)

bw_pred <- lm_fit %>% 
  predict(new_data = bw_test) %>% 
  bind_cols(bw_test)


# Find r-squared
rsq(data = bw_pred, truth = weight, estimate = .pred)

# Find rmse
rmse(data = bw_pred, truth = weight, estimate = .pred)
