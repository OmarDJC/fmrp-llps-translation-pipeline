# Step 1 — Preprocessing count matrices for xtail

library(dplyr)

# Load raw count matrices - GSE143659 example
mrna <- read.csv("raw/GSE143659_rna_cds_counts.csv", row.names = 1)
rpf  <- read.csv("raw/GSE143659_ribo_cds_counts.csv", row.names = 1)

# Ensure same genes
common_genes <- intersect(rownames(mrna), rownames(rpf))
mrna <- mrna[common_genes, ]
rpf  <- rpf[common_genes, ]

# Remove low-expression genes
keep <- rowMeans(mrna) >= 10 & rowMeans(rpf) >= 10

mrna_filtered <- mrna[keep, ]
rpf_filtered  <- rpf[keep, ]

# Save processed data
write.csv(mrna_filtered, "data/GSE143659_mrna_counts_filtered.csv")
write.csv(rpf_filtered, "data/GSE143659_rpf_counts_filtered.csv")
