# Differential translation analysis using Xtail

library(xtail)

# Load data (example placeholders)
ribo_counts <- read.csv("data/ribo_counts.csv")
rna_counts  <- read.csv("data/rna_counts.csv")

# Run Xtail
result <- xtail(ribo_counts, rna_counts)

# Filter significant genes
sig_genes <- subset(result, pvalue < 0.01)

write.csv(sig_genes, "results/significant_translation_genes.csv")
