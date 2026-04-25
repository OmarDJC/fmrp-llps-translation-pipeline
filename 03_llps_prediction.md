# LLPS Propensity Prediction

LLPS propensity was evaluated using two independent web-based tools:

- PSPredictor: http://www.pkumdl.cn:8000/PSPredictor/
- FuzDrop: https://fuzdrop.bio.unipd.it/predictor/

## Input

Protein sequences (FASTA format) obtained from Ensembl BioMart.

## Procedure

1. Protein sequences were submitted manually to both predictors.
2. Scores were retrieved for each protein:
   - PSPredictor score
   - FuzDrop score
3. Results were compiled into a CSV table.

## Output

A table with the following format:

| Gene | PSPredictor_score | FuzDrop_score | LLPS_class |
|------|------------------|---------------|------------|

## Classification Criteria

Proteins were classified as LLPS-prone if:
- PSPredictor ≥ 0.5 AND
- FuzDrop ≥ 0.6

## Notes

This step was performed manually due to:
- lack of stable programmatic APIs
- batch submission limitations

The resulting table is provided in:

`data/llps_scores.csv`
