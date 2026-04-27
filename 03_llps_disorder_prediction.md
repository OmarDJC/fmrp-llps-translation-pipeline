## LLPS Propensity and Protein Disorder Analysis
## Description

LLPS propensity and intrinsic protein disorder were evaluated using complementary approaches:

PSPredictor (sequence-based LLPS prediction)
FuzDrop (proteome-scale LLPS propensity)
RIDAO (intrinsic disorder estimation)

## Input

Protein sequences (FASTA format) corresponding to differentially translated genes identified by xtail were obtained from Ensembl BioMart.

Datasets analyzed:

GSE143659,
GSE127847,
GSE143333,
GSE114064,
GSE101823,
GSE137878

Final dataset:

2,313 genes with decreased TE
1,734 genes with increased TE

## Procedure
1. PSPredictor (LLPS propensity)
Protein sequences were submitted manually to the PSPredictor web server
LLPS propensity scores were retrieved for each protein

⚠️ Note: Manual submission was required due to lack of stable API or batch processing support.

2. FuzDrop (LLPS propensity)
Precomputed LLPS scores were used for:
Mus musculus
Rattus norvegicus
Data source: Supplementary datasets (S7, S8) from
Widespread occurrence of the droplet state of proteins in the human proteome

✔ This approach ensures consistency and avoids redundant computation.

3. RIDAO (Intrinsic disorder content)
Protein sequences were submitted manually to the RIDAO web-based predictor
For each protein, the percentage of disordered residues was obtained

⚠️ Note: This step was performed manually due to lack of programmatic access.

## Output

A unified dataset integrating LLPS propensity and disorder content:

Gene | PSPredictor_score | FuzDrop_score | Disorder_percent | LLPS_class
Classification Criteria

## Proteins were classified as LLPS-prone if:

PSPredictor ≥ 0.5
FuzDrop ≥ 0.6

Otherwise, proteins were classified as non–LLPS-prone.

## Notes
PSPredictor and RIDAO analyses were performed manually due to lack of stable APIs and batch submission limitations.
FuzDrop scores were retrieved from published proteome-wide datasets.
Intrinsic disorder content was used as a complementary structural feature to interpret LLPS propensity.
