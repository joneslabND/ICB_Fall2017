#Exercise 8, Python, Question 2
#10/13/17, MMD

#load modules
import re
import pandas
import numpy
from plotnine import *

#Open files to read and write
idfile = open("indivIDs.txt","r")
fastqfile = open("seqFastq.fq")
outfile = open("IDseq.fasta","w")

#Initialize empty dictionary and lists
ids = {}
startpos = []
badpos = []

#Make dictionary of IDs
for line in idfile:
    line = line.strip()
    cols = line.split()
    if cols[0] in ids:
        print("Duplicate: " + cols[1])
        break
    else:
        ids[cols[0]] = cols[1]
#Close ID file
idfile.close()

#Loop over fastq file, searching for cut site
pattern = r"([ATGC]{8})(AATTC)([ATGC]+)"

line = fastqfile.readline().strip()
while line != "":
    if line[0] == '@':
        line = fastqfile.readline().strip()
        if re.search(pattern,line):
            match = re.search(pattern,line)
            if match.group(1) in ids:
                startpos.append(match.start(1))
                outfile.write("> " + ids[match.group(1)] + "\n")
                outfile.write(match.group(3) + "\n")
            else:
                badpos.append(match.start(1))
        line = fastqfile.readline().strip()
        line = fastqfile.readline().strip()
        line = fastqfile.readline().strip()
    else:
        print("Malformed file?" + str(line))
        break

fastqfile.close()
outfile.close()

#Graph histograms of good and bad start positions
good = pandas.DataFrame(numpy.array(startpos), columns = ["pos"])
GoodPlot=ggplot(good,aes(x="pos"))
GoodPlot+geom_histogram(binwidth=5)

bad = pandas.DataFrame(numpy.array(badpos), columns = ["pos"])
BadPlot=ggplot(bad,aes(x="pos"))
BadPlot+geom_histogram(binwidth=3)




