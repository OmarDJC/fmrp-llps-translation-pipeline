#xtail
library(xtail) 

test.mrna <- read.csv('Goering_raw_t_tpm.csv',header=T, row.names = 1)
head(test.mrna)

test.rpf <- read.csv('Goering_raw_p_tpm.csv',header=T,row.names = 1)
head(test.rpf)

test.mrna <- round(test.mrna)
test.rpf <- round(test.rpf)

condition<- c("wt","wt","wt","ko","ko","ko")
condition
#nota condition: By default, the second condition (here is `treat`) 
#would be compared against the first condition (here is `control`).
#nota baseLevel	
#The baseLevel indicates which one of the two conditions will be 
#compared against by the other one. If not specified, Xtail 
#will return results of comparing the second condition over the first one.

#test
test.results <- xtail(test.mrna,test.rpf,condition, 
                      minMeanCount = 10,bins=1000,ci=0.95)

#test.results <- xtail(test.mrna,test.rpf,condition, 
                      #threads = 2, bins=1000,minMeanCount = 10)
#alpha
#ci=0.95	
#The level of confindence to get credible intervals of log2 fold change of 
#translational efficiency (TE), for example 0.95.
#minMeanCount
#minMeanCount = 10 use con thomson default es 1

#results
results <- resultsTable(test.results, sort.by = "pvalue.adjust")

write.csv(results,"Thomson_xtail_minMeanCount = 10,bins=1000,ci=0.95.csv")

#plot
plotFCs(test.results)

#results table
sumresults <- summary(test.results, alpha = 0.1)

write.csv(sumresults,"Shu_xtail_alpha0.05.csv")

#otros comandos para probar
data(test.results)
