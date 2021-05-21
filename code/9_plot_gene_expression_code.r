my_data <- read.delim("bh_htseq_res.txt")
s_data <- read.delim("serum_htseq_res.txt")
#my data is a dataframe

#Plot first column on x axis and sexon on y 
genID <- c(1:3125)

#my_data[,1]
bh1 <- my_data[1:3125,2]
bh2 <- my_data[1:3125,3]
bh3 <- my_data[1:3125,4]

s1 <- s_data[1:3125,2]
s2 <- s_data[1:3125,3]
s3 <- s_data[1:3125,4]

plot(genID,bh1, xlab="GeneID number", ylab="Counts",
     main="Distribution of gene expression for Serum an BH", col="blue")
points(genID, bh2, col="blue")
points(genID, bh3, col="blue")
points(genID, s1, col="red")
points(genID, s2, col="red")
points(genID, s3, col="red")

legend("topleft", legend=c("Serum", "BH"),
       col=c("red", "blue"), lty=1:2, cex=0.8)

#s71_data <- read.delim("htseq_serum_result_seq71.txt")

# plot(genID,s1, xlab="GeneID number", ylab="Counts",
#      main="Distribution of counts per gene for serum", col="green")
