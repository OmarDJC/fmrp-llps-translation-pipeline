#xtail

library(xtail) 

# Load data

test.mrna <- read.csv('raw_mrna_tpm.csv',header=T, row.names = 1)
head(test.mrna)

test.rpf <- read.csv('raw_rpf_tpm.csv',header=T,row.names = 1)
head(test.rpf)

test.mrna <- round(test.mrna)
test.rpf <- round(test.rpf)

# Label conditions

condition<- c("wt","wt","wt","ko","ko","ko")
condition

#notes on conditions: By default, the second condition (here is `ko`) 
#would be compared against the first condition (here is `wt`).

#test

test.results <- xtail(test.mrna,test.rpf,condition, 
                      minMeanCount = 10,bins=1000,ci=0.95)

#notes on test:
#ci=0.95 is	alpha i.e.
#the level of confindence to get credible intervals of log2 fold change of 
#translational efficiency (TE), for example 0.95.

#results
results <- resultsTable(test.results, sort.by = "pvalue.adjust")

write.csv(results,"Test_xtail_minMeanCount = 10,bins=1000,ci=0.95.csv")

#plot
plotFCs(test.results)

#results table
sumresults <- summary(test.results, alpha = 0.1)

write.csv(sumresults,"Test_xtail_alpha0.05.csv")
