# =========================================================
# xtail analysis: Differential Translational Efficiency (TE)
# =========================================================

library(xtail)

# ---------------------------------------------------------
# Step 1 — Load raw count data (NOT TPM)
# ---------------------------------------------------------
# Rows: genes
# Columns: samples (matched between mRNA and RPF)

mrna_counts <- read.csv("data/raw_mrna_counts.csv", header = TRUE, row.names = 1)
rpf_counts  <- read.csv("data/raw_rpf_counts.csv",  header = TRUE, row.names = 1)

# Optional sanity check
stopifnot(all(colnames(mrna_counts) == colnames(rpf_counts)))

# ---------------------------------------------------------
# Step 2 — Define experimental conditions
# ---------------------------------------------------------
condition <- factor(c("wt","wt","wt","ko","ko","ko"))

# Note:
# The second condition ("ko") is compared against the first ("wt")

# ---------------------------------------------------------
# Step 3 — Run xtail analysis
# ---------------------------------------------------------
set.seed(123)

xtail_results <- xtail(
  mrna_counts,
  rpf_counts,
  condition,
  minMeanCount = 10,   # filter low-expression genes
  bins = 1000,         # resolution of posterior estimation
  ci = 0.95            # 95% credible interval (NOT alpha)
)

# ---------------------------------------------------------
# Step 4 — Extract results table
# ---------------------------------------------------------
results <- resultsTable(
  xtail_results,
  sort.by = "pvalue.adjust"
)

write.csv(results, "results/xtail_results_minMean10_bins1000_ci95.csv")

# ---------------------------------------------------------
# Step 5 — Summary of significant genes
# ---------------------------------------------------------
summary_results <- summary(xtail_results, alpha = 0.1)

write.csv(summary_results, "results/xtail_summary_alpha0.1.csv")

# ---------------------------------------------------------
# Step 6 — Visualization
# ---------------------------------------------------------
plotFCs(xtail_results)
