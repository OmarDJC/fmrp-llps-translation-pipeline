# FMRP–LLPS Translation Pipeline

This repository contains a documented computational workflow for the main analysis presented in:

**Jurado et al., BioSystems (2025)**  
https://doi.org/10.1016/j.biosystems.2025.105405

## Overview

This pipeline integrates ribosome profiling (Ribo-seq), RNA-seq data, and protein sequence-based predictors to investigate whether FMRP-regulated mRNAs encode proteins with liquid–liquid phase separation (LLPS) propensity. For details check pipeline_summary.md

## Workflow

1. Data acquisition and preprocessing (optional)  
2. Differential translation analysis (Xtail)  
3. LLPS prediction (PSPredictor, FuzDrop) and Intrinsic disorder analysis (RIDAO) 
4. Statistical analysis   

## Key Features

- Integration of multiple independent datasets  
- Dual LLPS predictor validation  
- Statistical controls (randomized gene sets, multiple testing correction)  
- Biological validation (synaptic and neurodevelopmental enrichment)

## Data acquisition

Ribosome profiling (Ribo-seq) and RNA-seq datasets were obtained from the Gene Expression Omnibus (GEO):

- GSE143659  
- GSE127847  
- GSE143333  
- GSE114064  
- GSE101823  
- GSE137878  

For each dataset, raw count matrices for mRNA and RPF were used. Only experiments containing both wild-type (WT) and knockout (KO) conditions with biological replicates were included.

Minimal preprocessing was applied prior to analysis:
- Matching gene identifiers between mRNA and RPF datasets
- Ensuring consistent sample ordering across matrices

Filtering of low-expression genes (mean count ≥ 10) was performed internally within xtail (parameter `minMeanCount`).
No additional normalization or transformation was applied, as xtail operates directly on count data.

## Reproducibility

All analyses are structured as modular scripts.  
Inputs, processing steps, and outputs are explicitly defined.

## Figure 1 Analysis Pipeline Example (Annotated R Script)

This pipeline:
Compares gene/protein features across TE-defined groups,
Uses pairwise t-tests with Holm correction,
Visualizes distributions with violin + boxplots,
Integrates statistical annotations directly into plots.
Variables analyzed:
A: CDS length
B: Intrinsic disorder (%)
C: PSPredictor score (LLPS propensity)
D: FuzDrop score (LLPS propensity)

## Note

This repository provides a **minimal reproducible representation** of the pipeline.  
Full datasets are available from GEO and referenced databases.

## Contact

Dr. Omar Jurado
omarjuradocarrera@gmail.com
