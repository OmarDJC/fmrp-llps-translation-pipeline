Computational Pipeline Summary
Fragile X mental retardation protein modulates translation of proteins with predicted tendencies for liquid-liquid phase separation
BioSystems (2025) https://doi.org/10.1016/j.biosystems.2025.105405
1. Overview
This study integrates publicly available ribosome profiling (Ribo-seq) and RNA-seq datasets with protein sequence-based predictors to investigate whether genes translationally regulated by FMRP encode proteins with a propensity for liquid–liquid phase separation (LLPS). The workflow combines differential translation analysis, sequence-based biophysical predictions, and statistical validation to test this hypothesis.
________________________________________
2. Data Sources and Input Datasets
Ribosome Profiling and RNA-seq Data
•	Eight paired Ribo-seq / RNA-seq datasets from FMRP-knockout vs wild-type mouse neurons retrieved from Gene Expression Omnibus (GEO). Accession numbers GSE143659, GSE127847, GSE143333, GSE114064, GSE101823, GSE137878, GSE112502 and GSE140565.  
•	Six datasets retained after quality filtering: GSE143659, GSE127847, GSE143333, GSE114064, GSE101823, and GSE137878. 
•	Final dataset: 2,313 genes with decreased translation efficiency (TE)  and 1,734 genes with increased TE. 
Additional Biological Datasets
•	FMRP target mRNAs (CLIP-seq datasets; merged list ~1147 genes) from supplementary data of Darnell et al., 2011; Maurin et al., 2018; Sawicka et al., 2019
•	ASD-associated genes (SFARI database) https://gene.sfari.org/database/gene-scoring/ 
•	LLPS-related proteins and RNAs: 
o	RPS database (LLPS-related RNAs) http://rps.renlab.org/
o	MLOsMeta and DrLLPS (LLPS-related proteins) http://mlos.leloir.org.ar/ https://llps.biocuckoo.cn/
Reference Control Dataset
•	Neuronal expressed genes (n=11,605) from the investigation of Furlanis and colleagues (Furlanis et al., 2019)
•	Length-matched non-FMRP targets used as controls (n= 3,796) derived from previous dataset (Furlanis et al., 2019)
________________________________________
3. Computational Workflow
Step 1: Identification of Differential Translation
•	Tool: Xtail (R package) 
•	Input: paired Ribo-seq and RNA-seq count data 
•	Output: genes with altered translation efficiency (TE) 
•	Threshold: p < 0.01 
Quality control:
•	Exclusion of datasets with inconsistent CDS length trends ( GSE112502 and GSE140565)
•	Validation against known biological expectation (long CDS → decreased translation) 
Step 2: Gene Set Integration
•	Merge of significant genes across datasets 
•	Cross-referencing with: 
o	FMRP targets 
o	ASD-associated genes 
o	Granule-associated genes 
This generates biologically meaningful subsets for downstream analysis.
Step 3: Sequence Retrieval
•	Protein sequences retrieved using Ensembl BioMart https://www.ensembl.org/biomart/
•	Input for downstream structural and LLPS sequence-based prediction tools 
Step 4: Prediction of Intrinsic Disorder and LLPS Propensity
Intrinsic Disorder
•	Tool: RIDAO 
•	Output: per-residue disorder profile (PER-MDP) 
LLPS Propensity
•	Tools: 
o	PSPredictor (machine learning-based) 
o	FuzDrop (physics-based model) 
Classification criteria:
•	PSPredictor score ≥ 0.5 
•	FuzDrop score ≥ 0.6 
•	Proteins classified as LLPS-prone only if both predictors agree 
Strategy:
•	Dual-tool agreement used to increase prediction robustness 
•	Discrepancies classified separately (“controversial PSPs”) 
Step 5: Statistical Analysis
All analyses performed in R (v4.2.2)
Methods:
•	One-way ANOVA 
•	Student’s t-test (Holm correction for multiple testing) 
•	Spearman correlation 
•	Gene Ontology enrichment (gProfileR) 
Significance threshold:
•	p < 0.05 
Step 6: Validation and Control Strategies
To ensure robustness and minimize bias:
•	Reference controls: 
o	Full neuronal proteome (n=11,605)
o	Length-matched non-FMRP targets (n=3,796) 
•	Randomized controls: 
o	Random gene sets matched by CDS length 
•	Cross-dataset consistency: 
o	Independent Ribo-seq datasets integrated 
•	Biological validation: 
o	Enrichment in synaptic and neurodevelopmental genes 
o	Overlap with known LLPS-related proteins and RNAs 
•	Tool cross-validation: 
o	Agreement between independent LLPS predictors 
________________________________________
4. Key Outputs
•	Identification of 906 proteins with strong LLPS propensity among genes with decreased translation 
•	Significant enrichment of intrinsically disordered regions in these proteins 
•	Strong overlap with known LLPS-related datasets and neuronal condensate components 
________________________________________
5. Reproducibility and Implementation
•	All analyses conducted using structured R-based workflows 
•	Modular pipeline: 
-	Data acquisition 
-	Differential translation analysis 
-	Sequence extraction 
-	LLPS prediction 
-	Statistical validation 
•	Scripts are organized to allow reproducibility of each step (data → processing → output) 
________________________________________
6. Limitations and Considerations
•	LLPS predictors rely on training datasets with limited negative examples 
•	Predictions are probabilistic and require experimental validation 
•	CDS length and LLPS relationship remains partially unresolved 
These limitations were explicitly considered in interpretation and addressed through multiple validation strategies.
