# Statistical analysis

library(stats)

data <- read.csv("results/llps_scores.csv")

# Compare LLPS scores
t.test(data$LLPS_score ~ data$group)

# Multiple testing correction example
pvals <- data$pvalue
p.adjust(pvals, method = "holm")
