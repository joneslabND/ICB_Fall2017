#Exercise 8, R, Useful Functions
#10/13/17, MMD

#remember you may need to use extra escape characters
#\. must be written as "\\."

#reads text file, stores as vector
var = scan(filename,options)
#creates an empty file
file.create(filename)
#writes a line to a file
write(string,file=filename,append=TRUE)

#initializes empty list of numeric data
vector = numeric()
#converts vector to data frame
as.data.frame(vector)
#returns T if value in list, F if not
value %in% list/column
#joins two strings with designated delimitor
paste(string1,string2,sep=delimitor)


#You won't need all of these!

#returns T if match present, F if not
str_detect(searchString,regexString)
#returns the first full match in the string
str_extract(searchString,regexString)
#returns all full matches in the string
str_extract_all(searchString,regexString)
#returns the start and end positions of the full match
#returned as a list, so must use [[1]] to access position 1
str_locate(searchString,regexString)
#returns vector/matrix of matches and captures, full match is 1
str_match(searchString,regexString)
#replaces first match in string with replacement
str_replace(searchString,regexString,replacement)
#replaces all matches in search string with replacement
str_replace_all(searchString,regexString,replacement)
#splits a string on a pattern
str_split(searchString,regexString)

