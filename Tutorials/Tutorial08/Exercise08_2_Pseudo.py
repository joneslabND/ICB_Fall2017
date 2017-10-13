#Exercise 8, Python, Question 2
#10/13/17, MMD

#Open files to read and write

#Initialize empty dictionary and lists

#Make dictionary of IDs
for : #look at old code to see how you looped over a file
    #strip end of line
    #split line on whitespace
    if : #is the item in the DNA barcode column a key in the dictionary?
        #break and print error message if so, this should not happen...
    else: #this means DNA barcode is not yet a key
        #assign sample ID as value and DNA barcode as key
#Close ID file

#assign regex to variable name, or compile to variable name

#A while loop will allow us to skip operating on fastq lines we don't care about
#it also allows us to read huge files line by line, without storing them in memory
#read and strip the first line in the file
while line != "": #this asks if the current line is not empty, stopping at the end of the file, without having to know how long the file is
    if : #is the current line a header line?
        #read and strip the next line, now the sequence line
        if : #is your regex in the sequence
            #store your regex matches
            if : #is your DNA barcode in the ID data frame?
                ##append the start position of the AATTC to your vector
                #write the fasta header to your file by getting the correct ID from the data frame
                #write the sequence remaining to the right of the AATTC cut site to your file
            else:
                #Optional: append location of AATTC to "bad" vector (pattern found but no barcode match) as above
        #read and strip the next 3 lines, skips over + and quality scores lines, to get to the next header
    else:
        #it's a good idea to break loop and print error message if you end up here
        #this means you've read the wrong number of lines or the input file isn't in the right format (it is!)

#Close files

#Graph histograms of good and bad start positions




