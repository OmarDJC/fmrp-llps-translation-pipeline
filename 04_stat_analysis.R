# Main statistical analysis method t_test "holm"
#Apply Holm correction to control family-wise error rate

#Load required libraries
library(EnvStats)
library(rstatix)

#Import datasets
data <- read.csv("results/llps_scores_DecreasedTE_VS_IncreasedTE.csv", header=TRUE, sep=",")
my_comparisons <- list(c("All proteins", "Decreased TE"),c("All proteins", "Increased TE"),c("Decreased TE", "Increased TE"))

# Compare LLPS scores
stat.test <- data %>%
  t_test(PSPre_Score ~ group, paired = FALSE,comparisons = my_comparisons) %>%
  adjust_pvalue(method = "holm") %>%
  add_significance("p.adj")%>%
stat.test1
