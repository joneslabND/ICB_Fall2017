#Exercise 8, Python, Useful Functions
#10/13/17, MMD


#Reading from files
var = open(filename,"r") #r appears to be optional, can at least read line by line with no r
line = line.strip() #strips \n
line = var.readline().strip() #advances to the next line, stripping \n
var.close() #closes file

#Writing to files
var = open(filename,"w")
var.write(string + "\n") #appends line to file, need to add the "\n"
var.close() #closes file

#initializes empty dictionary
var = {}
#accesses value associated with key in dictionary
var[key]
#returns T if testkey in dictionary (var), F if not
testkey in var
#initializes empty list
var = []
#appends to existing list
var.append(newvar)
#splits string on whitespace
var.split()
#for raw string input
r"string"
#joins two strings together
string1 + string2

#to convert list of numbers into data frame for plotnine
var = pandas.DataFrame(numpy.array(yourlist), columns = ["name"])

#You won't need all of these!

#can make a regex search faster, can then call other re functions on var by var.function
var = re.compile(regexString)
#excapes metacharacters, makes string literal
re.escape(regexString)
#searches for all matches, not just the first
re.findall(regexString,searchString)
#searches for pattern only at beginning of a string
re.match(regexString,searchString)
#searches for a pattern anywhere in string, returns a match object with several attributes
re.search(regexString,searchString)
#returns match group for match object var, 0 is full match
var.group(index)
#returns starting position of each match in match object var, 0 is full match
var.start(index)
#splits a string on a pattern
re.split(regexString,searchString)
#replaces first regex match in search string with replacement
re.sub(regexString,replacement,searchString)
#same as above but also returns number of replacements made
re.subn(regexString,replacement,searchString)



