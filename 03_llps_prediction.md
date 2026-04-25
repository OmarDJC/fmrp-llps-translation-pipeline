# LLPS Propensity Prediction

LLPS propensity was evaluated using two independent tools:

- PSPredictor: http://www.pkumdl.cn:8000/PSPredictor/
- FuzDrop: https://fuzdrop.bio.unipd.it/predictor/

## Input

Protein sequences (FASTA format) obtained from Ensembl BioMart.

## Procedure

1. Protein sequences were submitted manually to PSPredictor to obtain LLPS propensity scores.
2. For FuzDrop, instead of manual submission, I used precomputed LLPS propensity scores for full proteomes:
   - *Mus musculus* and *Rattus norvegicus* proteomes
   - Data obtained from Supplementary Datasets S7 and S8 of:
     *Widespread occurrence of the droplet state of proteins in the human proteome*  
     (PNAS, 2020, 117(52):33254–33262)
3. Scores from both predictors were compiled into a unified CSV table.

## Output

A table with the following format:

| Gene | PSPredictor_score | FuzDrop_score | LLPS_class |
|------|------------------|---------------|------------|

## Classification Criteria

Proteins were classified as LLPS-prone if:
- PSPredictor ≥ 0.5 AND
- FuzDrop ≥ 0.6

## Notes

- PSPredictor analysis was performed manually due to lack of stable programmatic APIs and batch submission limitations.
- FuzDrop scores were retrieved from published proteome-wide datasets, ensuring consistency and avoiding redundancy in computation.

The resulting table is provided in:

`data/llps_scores.csv`
