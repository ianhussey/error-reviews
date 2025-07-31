library(tidyverse)

# Page 113, pilot study
## Cannot reproduce the value d=13.95. Below are some attempts
38.95 / sqrt(8)
c(38.945, to = 38.955) / sqrt(8) # Cannot be due to rounding
38.95 / sqrt(7)

# Can reproduce other values on page 113
midpoint <- 5.5
# Negative events
abs(3.13 - midpoint) / .26
# Positive events
abs(7.03 - midpoint) / .49

# Cohen's d on the bottom of the right column on page 114:
15.65 / sqrt(201)

# Values for pilot study on page 116, top of the left column
-59.75 / sqrt(12)
abs(3.13 - midpoint) / .21
abs(7.04 - midpoint) / .39

# Left column on page 115, df = 199
tibble(
  tstatistic = c(-11.12, -9.85, 8.71, 5.74, -5.19, -5.62, 3.85, .81, -2.88, -1.67,
        1.59, .48),
  df = 199
) %>% 
  mutate(cohens_d = round(abs(tstatistic / sqrt(df)), 2))

# Page 116
tibble(
  tstatistic = c(-5.12, -5.55, .43, -3.48, -3.71, .23, 3.28, 3.06, .22,
                 1.94, .89, 1.06),
  df = 94
) %>% 
  mutate(cohens_d = round(abs(tstatistic / sqrt(df)), 2))

# Table 3, page 118
tibble(
  tstatistic = c(-2.39, -3.54, 2.45, .94, 
                 -2.77, -2.20, 2.61, 1.23),
  df = c(rep(44, 4), rep(48, 4))
) %>% 
  mutate(cohens_d = round(abs(tstatistic / sqrt(df)), 2))

# Page 120
tibble(
  tstatistic = c(-7.60, -7.00, 5.46, 2.79, -3.66, -5.15, 2.99, 3.59),
  df = 70
) %>% 
  mutate(cohens_d = round(abs(tstatistic / sqrt(df)), 2))

