#Exercise 8, Python question 1
#10/13/17, MMD

#load modules
import re

#Open files to read and write
vcffile = open("Cflorida.vcf","r")
outfile = open("CfloridaCounts.txt","w")

#Compile regular expressions
#CF.A.,CF.A2.,CF07.A.,cf.a.
A = r"[Cc][Ff](07)?\.[Aa]2?"

#CF.G2.,CF.GAI.,cf.gai.
G = r"[Cc][Ff]\.(G2|GAI|gai)"

counts = r"[01.]/[01.]:([0-9,.]+):[0-9.]+:[0-9.]+:[0-9,.]+"
missing = r"\."

#loop over file
for line in vcffile:
    line = line.strip()
    #if ^## skip
    if line[0:1] == "##":
        outfile.write(line + "\n")
    #if ^# replace names with fixed names
    elif line[0] == "#":
        #apply all substitutions
        names = re.sub(A,"Cf.Sfa",line)
        names = re.sub(G,"Cf.Gai",names)
        #write line
        outfile.write(names + "\n")
    else:
        #grab allele counts
        sub = re.sub(counts,r"\1",line)
        #if allele counts . replace with NA
        sub = re.sub(missing,"NA",sub)
        #write line to new file
        outfile.write(sub + "\n")
        

#Close files
vcffile.close()
outfile.close()

