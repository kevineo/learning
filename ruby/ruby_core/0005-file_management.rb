=begin
The MIT License (MIT)

Copyright (c) 2015 Chew, Kean Ho <hollowaykeanho@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the "Software"),
to deal in the Software without restriction, including without limitation
the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR
THE USE OR OTHER DEALINGS IN THE SOFTWARE.
=end

directory_name = "file-mgt"


#==============================================
# Check directory
#==============================================
File.exists?directory_name


#==============================================
# Make directory
#==============================================
Dir.mkdir("demo_directory")
Dir.mkdir(directory_name) unless File.exists?directory_name


#==============================================
# Change directory (e.g: cd )
#==============================================
Dir.chdir(directory_name)


#==============================================
# Drop 1 level directory (e.g: cd ..)
#==============================================
Dir.chdir("..")


#==============================================
# Delete Directory (e.g.: rmdir)
#==============================================
Dir.rmdir("demo_directory") if File.exists?("demo_directory")



#==============================================
# Check file
#==============================================
filename="myfile.txt"
File.exists?filename


#==============================================
# Read file
#==============================================
filename = "0005-file_management.rb"
f = File.open("./#{filename}", "r")
f.each_line do |line|
	print line
end
f.close


#==============================================
# Write file
#==============================================
filename = "simple.txt"
f = File.open("./#{directory_name}/#{filename}", "w")
f.puts "Hello file!"
f.close


#==============================================
# Best Practise Method File Directory Creation
#==============================================
filename = "BKM_create.txt"
Dir.mkdir(directory_name) unless File.exists?directory_name
f = File.open("#{directory_name}/#{filename}", 'w')
f.write('Hello world!')
f.close
