# generating fasta file for an exercise in ICB2017
import numpy

nseqs=100

bases=numpy.asarray(['A','C','T','G'])

OutFile=open("Lecture11.fasta","w")

for i in range(1,nseqs+1,1):
    
    OutFile.write(">seq"+str(i)+"\n")
    
    bp=numpy.random.choice(numpy.arange(100))
    
    curSeq=numpy.random.choice(a=bases,size=bp,replace=True)
    
    curSeq=curSeq.tostring()
    
    OutFile.write(curSeq+"\n")

OutFile.close()


