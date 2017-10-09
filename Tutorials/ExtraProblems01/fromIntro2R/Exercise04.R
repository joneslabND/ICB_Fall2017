rm(list=ls())
setwd("/Users/stuartjones/Documents/Teaching/AdBiostats/AdBiostats2017/Module01-intro2R/Exercise04")

##### BIOS 60751
##### Exercise #4

# Question 1
# Cleaning up REU data
data=read.table("ThankYouREU.txt",header=TRUE,sep="\t",stringsAsFactor=FALSE)
data[grep("1",data$treatment),1]="T1"
data[grep("2",data$treatment),1]="T2"
data[grep("3|4",data$treatment),1]="T3"


# Question 2
# putative genes
dna=read.table("dna.txt",header=FALSE,sep="\t",stringsAsFactor=FALSE)
dna=dna[1,1]

# not worrying about reading frame
start=gregexpr("ATG",dna)
end=gregexpr("TAG|TAA|TGA",dna)

lengths=as.vector(end[[1]]-start[[1]])	# note this has lengths too short by 3 basepairs because of how gregexpr indexes matches
number=length(lengths)


# worried about reading frame
# the question mark after the asterisk makes it a non-greedy match 
# put initial dna sequence in variable curseq
curseq=dna
#variable to hold open reading frames
out=NULL
#variable for regexpr matches and controls while loop
curmatch=0
# use this conditional in while loop to work through sequence from left to right; uses -1 because this is what is returned when regexpr doesn't find a match
while(curmatch>-1){
	# use non-greedy regex to find first, and shortest gene from left to right
	curmatch=regexpr("ATG((A|T|G|C){3})*?(TAG|TAA|TGA)",curseq)
	# access the length of the match
	curmatch.length=attr(curmatch,"match.length")
	# if regexpr found a match put the information into out and trim the sequence in curseq to start at end of last open reading frame found
	if(curmatch>0){
		out=rbind(out,c(curmatch,curmatch.length))
		curseq=substring(curseq,(curmatch+curmatch.length),)
	}
}
colnames(out)=c('start position','length')

# Question 3
# reformatting county names
pop=read.table("IndianaCountyPopDensity.txt",header=TRUE,sep="\t",stringsAsFactor=FALSE)
water=read.table("IndianaCountyPercentWater.txt",header=TRUE,sep="\t",stringsAsFactor=FALSE)

pop[,1]=gsub(" .*","",pop[,1])
pop[,1]=tolower(pop[,1])

all=merge(pop,water,by="countyName")


# Question 4
# precip summary table
setwd("PrecipData")

files=list.files()

summary=matrix(NA,length(files),4)

for(i in 1:length(files)){
	cur=read.table(files[i],header=FALSE,sep="\t")
	summary[i,1]=gsub("Precip.txt","",files[i])
	summary[i,2]=min(cur)
	summary[i,3]=max(cur)
	summary[i,4]=sum(cur)
}

colnames(summary)=c("City","minimum","maximum","total")