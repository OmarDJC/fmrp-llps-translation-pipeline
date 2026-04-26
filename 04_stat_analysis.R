# Example of statistical analysis of LLPS propensity across TE-defined groups
# Method: pairwise Welch t-tests with Holm correction

library(dplyr)
library(rstatix)

data <- read.csv("results/llps_scores_DecreasedTE_VS_IncreasedTE.csv")

data$group <- factor(data$group)

stat.test <- data %>%
  t_test(PSPre_Score ~ group, var.equal = FALSE) %>%  # Welch t-test
  adjust_pvalue(method = "holm") %>%
  add_significance("p.adj")

stat.test
