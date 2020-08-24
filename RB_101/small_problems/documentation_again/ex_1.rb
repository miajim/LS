# RB101-RB109 Small Problems
# Documentation Again - Problem 1: Class and Instance Methods
# Tues. 8/18/20

# LS Question
# Locate the ruby documentation for methods File::path and File#path. How are they different?

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------

# My Solution
# :: denotes a class method whereas # denotes an instance method. 
# File::path returns the string representation of the path passed in as an argument. It can only be used on an object that is part of the File class. 
# See http://ruby-doc.org/core-2.6.3/File.html#path-method for File::path
# File#path returns the pathname used to create file as a string. It appears to return the filename, whereas File::path appears to return the filepath as a string.
# See https://ruby-doc.org/core-2.6.3/File.html#method-i-path for File#path

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# LS Solution Notes
# Class methods are called ON THE CLASS. Instance methods are called ON OBJECTS. 
puts File.path('bin')

f = File.new('my-file.txt')
puts f.path

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Additional Notes 
# File::path  path(path) --> string
# Returns the string representation of the path 
# File.path("/dev/null") #=> "/dev/null"

# File#path   path --> filename 
# Returns the pathname used to create file as a string 
# File.new("testfile").path #=> "testfile"

