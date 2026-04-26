# fmrp-llps-translation-pipeline
Determine differential translated genes and the LLPS tendencies of their encoded proteins

# FMRP–LLPS Translation Pipeline

This repository contains a documented computational workflow for the analysis presented in:

**Jurado et al., BioSystems (2025)**  
https://doi.org/10.1016/j.biosystems.2025.105405

## Overview

This pipeline integrates ribosome profiling (Ribo-seq), RNA-seq data, and protein sequence-based predictors to investigate whether FMRP-regulated mRNAs encode proteins with liquid–liquid phase separation (LLPS) propensity.

## Workflow

1. Data acquisition and preprocessing  
2. Differential translation analysis (Xtail)  
3. Sequence retrieval (Ensembl BioMart)  
4. LLPS prediction (PSPredictor, FuzDrop)  
5. Statistical analysis and validation  

## Key Features

- Integration of multiple independent datasets  
- Dual LLPS predictor validation  
- Statistical controls (randomized gene sets, multiple testing correction)  
- Biological validation (synaptic and neurodevelopmental enrichment)

## Reproducibility

All analyses are structured as modular scripts.  
Inputs, processing steps, and outputs are explicitly defined.

#Figure 1 Analysis Pipeline Example (Annotated R Script)

This pipeline:
Compares gene/protein features across TE-defined groups
Uses pairwise t-tests with Holm correction
Visualizes distributions with violin + boxplots
Integrates statistical annotations directly into plots
Variables analyzed:
A: CDS length
B: Intrinsic disorder (%)
C: PSPredictor score (LLPS propensity)
D: FuzDrop score (LLPS propensity)

## Note

This repository provides a **minimal reproducible representation** of the pipeline.  
Full datasets are available from GEO and referenced databases.

## Contact

Omar David Jurado Carrera
