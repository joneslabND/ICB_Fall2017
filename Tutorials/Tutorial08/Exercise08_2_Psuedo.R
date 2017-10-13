#Exercise 8, R, Question 2
#10/13/17, MMD

#Open files to read and write
#read ID list as data frame

#Initialize empty lists

#assign regex to a variable name

#A while loop will allow us to skip operating on fastq lines we don't care about
#set a line counter variable
while (){ #when should your loop stop?
  if (){ #is the current line a header line?
    #add one to the line counter to move to the sequence line
    if (){ #is your regex in the sequence
      #store your regex matches
      if (){ #is your DNA barcode in the ID data frame?
        #append the start position of the AATTC to your vector, I couldn't find a clean way to get the start pos of the AATTC group
        #I took the position of the full match in the original string, plus the postion of AATTC in the full match -1
        #write the fasta header to your file by getting the correct ID from the data frame
        #write the sequence remaining to the right of the AATTC cut site to your file
      }else{
        #Optional: append location of AATTC to "bad" vector (pattern found but no barcode match) as above
      }
    }
    #add 3 to your line counter to skip over + and quality scores lines, to get to the next header     
  }else{
    #it's a good idea to break loop and print error message if you end up here
    #this means your line counter is off or the input file isn't in the right format (it is!)
  }
}

#Graph histograms of good and bad start positions

