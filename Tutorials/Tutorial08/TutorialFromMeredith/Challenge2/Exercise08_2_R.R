#Exercise 8, R, Question 2
#10/13/17, MMD

#Load packages
library('stringr')
library('ggplot2')

#Open files to read and write
ids = read.table("indivIDs.txt",stringsAsFactors=F)
fastqfile = scan("seqFastq.fq",what=character(),sep="\n")
file.create("IDseq.fasta")

#Initialize empty lists
startpos = numeric()
badpos = numeric()

#Loop over fastq file, searching for cut site
pattern = "([ATGC]{8})(AATTC)([ATGC]+)"

line = 1
while (line <= length(fastqfile)){
  if (str_detect(fastqfile[line],"^@")){
    line = line + 1
    if (str_detect(fastqfile[line],pattern)){
      match = str_match(fastqfile[line],pattern)
      if (match[2] %in% ids[,1]){
        startpos = c(startpos,(str_locate(fastqfile[line],pattern)[[1]] + str_locate(match[1],"AATTC")[[1]])-1)
        write(paste(">",ids[ids[,1]==match[2],2],sep=" "),file="IDseq.fasta",append=TRUE)
        write(match[4],file="IDseq.fasta",append=TRUE)
      }else{
        badpos = c(badpos,(str_locate(fastqfile[line],pattern)[[1]] + str_locate(match,"AATTC"))[[1]]-1)
      }
    }
    line = line + 3     
  }else{
    cat("Malformed file?",toString(line))
    print(fastqfile[line])
    break
  }
}

#Graph histograms of good and bad start positions
good = as.data.frame(startpos)
GoodPlot=ggplot(good,aes(x=startpos))
GoodPlot+geom_histogram(binwidth=5)

bad = as.data.frame(badpos)
BadPlot=ggplot(bad,aes(x=badpos))
BadPlot+geom_histogram(binwidth=3)
