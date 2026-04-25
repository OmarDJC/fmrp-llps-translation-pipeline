# Main statistical analysis method = "holm"

library(ggplot2)
library(EnvStats)
library(ggstatsplot)
library(scales)
library(rstatix)
library(scales)

data <- read.csv("results/llps_scores_DecreasedTE_VS_IncreasedTE.csv", header=TRUE, sep=",")
my_comparisons <- list(c("All proteins", "Decreased TE"),c("All proteins", "Increased TE"),c("Decreased TE", "Increased TE"))

# Compare LLPS scores
stat.test <- data %>%
  t_test(CDS ~ group, paired = FALSE,comparisons = my_comparisons) %>%
  adjust_pvalue(method = "holm") %>%
  add_significance("p.adj")%>%
stat.test1
