library("DESeq2")

# Gathering data
directory <- "~/GenomeAnalysis_project/analyses/9_htseq_differential_analysis/"
sampleFiles <- c("bh_1.txt","bh_2.txt","bh_3.txt","se_1.txt","se_2.txt","se_3.txt")
sampleName <- c("bh_1","bh_2","bh_3","se_1","se_2","se_3")
condition <- c("bh", "bh", "bh", "se", "se", "se")

phdata <- data.frame(sampleName, sampleFiles, condition)

# Formatting data for input
#phdata<-data.frame(fname=sampleFiles,stringsAsFactors=FALSE)
# phdata <- phdata %>% transmute(sample=substr(fname,1,4),fname)

# phdata <- phdata %>% mutate(condition=as.factor(substr(sample,1,2)),
#                            repl=substr(sample,4,4))

# Running DESeq2
dds<-DESeqDataSetFromHTSeqCount(sampleTable=phdata,directory=datadir,design=~ condition)

# dds <- estimateSizeFactors(dds)
# dds <- estimateDispersions(dds)

ddsDE<-DESeq(dds) #37
myres<-results(ddsDE)
write.csv(as.data.frame(myres), file="~/GenomeAnalysis_project/analyses/10_deseq2_comparison/raw_res.csv")

# Plot
png("~/GenomeAnalysis_project/analyses/10_deseq2_comparison/vulcanoplot.png")
plot(myres$log2FoldChange,-log10(myres$pvalue),pch=19,cex=0.3,xlab="Log2 FC",ylab="-log10(P-value)",col=ifelse(myres$padj<0.05&abs(myres$log2FoldChange)>1,"red","black"))
dev.off()

# Filtering and sorting
resp05fc1 <- subset(myres,pvalue<0.05&abs(log2FoldChange)>1) # 49 To get the list of genes with unadjusted P-values < 0.05 and absolute log2 FC of more than 2
write.csv(as.data.frame(resp05fc1), file="~/GenomeAnalysis_project/analyses/10_deseq2_comparison/resp05fc1.csv")
sort_resp05fc1 <- myres[order(myres[["log2FoldChange"]]),]
write.csv(as.data.frame(sort_resp05fc1), file="~/GenomeAnalysis_project/analyses/10_deseq2_comparison/sort_resp05fc1.csv")


#http://people.duke.edu/~ccc14/duke-hts-2017/Statistics/08032017/DESeq2-Notebook-introduction.html