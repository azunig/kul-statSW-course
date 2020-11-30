
# --- Chapter 8: Statistical inference for continuous data ---

# - One sample -
library(UsingR)
?normtemp
head(normtemp)

library(rstatix)
summary_result <- normtemp %>%
  get_summary_stats(temperature, hr, show = c("n", "mean", "sd", "median"))
summary_result


## - One sample t-test -
temp <- normtemp$temperature
t.test(temp, mu = 100)


## - Nonparametric test - 
wilcox.test(temp, mu = 100)

# One sample t-test of rstatix
normtemp %>% t_test(temperature ~ 1, mu = 100)

# wilcox_test of rstatix
normtemp %>% wilcox_test(temperature ~ 1, mu = 100)



# - Two samples - 

## - Two sample t-test -
mentemp <- normtemp[normtemp$gender==1, 'temperature']
length(mentemp)
womentemp <- normtemp[normtemp$gender==2, 'temperature']
length(womentemp)

# Summary statistics by gender
gender_result <- normtemp %>%
  group_by(gender) %>%
  get_summary_stats(temperature, show = c("n", "mean", "sd", "median"))
gender_result

# Test normality in both groups
shapiro.test(mentemp)
shapiro.test(womentemp)

# Test equality of variances
var.test(mentemp, womentemp)
var.test(normtemp$temperature ~ normtemp$gender)

# Test equality of means
t.test(mentemp, womentemp, var.equal = TRUE)
t.test(normtemp$temperature ~ normtemp$gender, var.equal = T)

t.test(mentemp, womentemp, var.equal = FALSE)

wilcox.test(mentemp, womentemp)

normtemp %>%
  group_by(gender) %>%
  shapiro_test(temperature)

normtemp %>%
  levene_test(temperature ~ as.factor(gender))

normtemp %>%
  t_test(temperature ~ gender, var.equal = T)

normtemp %>% wilcox_test(temperature ~ gender)


## - Correlation analysis - 
normtemp %>% cor_test(temperature, hr)
normtemp %>% cor_test(temperature, hr, method = "spearman")



