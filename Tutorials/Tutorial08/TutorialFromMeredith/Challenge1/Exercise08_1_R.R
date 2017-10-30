#Exercise 8, R, Question 1
#10/13/17, MMD

#Load package
library('stringr')

#Open files to read and write
vcffile = scan("Cflorida.vcf",what=character(),sep="\n")
file.create("CfloridaCounts.txt")

#Compile regular expressions
#CF.A.,CF.A2.,CF07.A.,cf.a.
A = "[Cc][Ff](07)?\\.[Aa]2?"

#CF.G2.,CF.GAI.,cf.gai.
G = "[Cc][Ff]\\.(G2|GAI|gai)"

counts = "[01.]/[01.]:([0-9,.]+):[0-9.]+:[0-9.]+:[0-9,.]+"

#loop over file
for (line in 1:length(vcffile)){
  #if ^## skip
  if (str_detect(vcffile[line],"^##")){
    write(vcffile[line],file="CfloridaCounts.txt",append=TRUE)
  #if ^# replace names with fixed names
  }else if (str_detect(vcffile[line],"^#")){
    #apply all substitutions
    names = str_replace_all(vcffile[line],A,"Cf.Sfa")
    names = str_replace_all(names,G,"Cf.Gai")
    #write line
    write(names,file="CfloridaCounts.txt",append=TRUE)
  }else{
    #grab allele counts
    sub = str_replace_all(vcffile[line],counts,"\\1")
    #if allele counts . replace with NA
    sub = str_replace_all(sub,"\\.","NA")
    #write line to new file
    write(sub,file="CfloridaCounts.txt",append=TRUE)
  }
}

