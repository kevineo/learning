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

#==============================================
# Tutorial - Comment
#==============================================
#This is how you comment

=begin
This is how you make
a super long comment
=end


#==============================================
# Basic Printout
#==============================================
print "This is a basic print that needs EOL\n"
puts "This handles everything for you."

# Debug 'inspect' and then 'puts'
p ["this", "that"]

#==============================================
# Variables
#==============================================
int			= 10			#integer
bool			= true			#boolean
str			= "string\n"		#strings
null			= nil			#null
float			= 482.911
standard_array		= [5, 2, 1, 4, 3]
string_array		= ["This is ", "a string ", "array\n"]
multi_d_array		= [[2, "Hello", true], [3, "Data", false]]
hash_array		= {	"Zion1" => "Blue",
				"Zion2" => "Red",
				"Zion3" => "Green",
				"Zion4" => "Yellow"
			 }
dictionary_symbol	= { label1: 5, label2: 3, label3: 22, }

#==============================================
# Variables Manipulations
#==============================================
#Print Variables
puts "Variable: integer=#{int} bool=#{bool} string=#{str}"

#Assign to non-occupied variable
z = nil
z ||= 5
puts "Variable (no value assignment): #{z}"
z ||= 7
puts "Variable (no value assignment) after assigning 7: #{z}"
z = 7
puts "Variable (no value assignment) after set to 7: #{z}"

#rounding
float.round(5)	#round up to 5 digits
float.floor	#round down


#==============================================
# Arrays Manipulation
#==============================================
#sorting
standard_array.sort!					#accending
standard_array.sort! {|a, b| b <=> a}	#decending 2
books = [	"Charlie and the Chocolate Factory",
		"War and Peace", "Utopia",
		"A Brief History of Time", "A Wrinkle in Time"
	]
        # Priorities
puts "Sorting: Comparison: #{books[0] <=> books[1]}"
puts "Sorting: Comparison: #{books[1] <=> books[0]}"
puts "Sorting: Comparison: #{books[0] <=> books[0]}"
        # To sort our books in ascending order, in-place
books.sort! { |firstBook, secondBook| firstBook <=> secondBook }
puts "Sorting: accending:  #{books}"
        # Sort your books in descending order, in-place below
books.sort! { |firstBook, secondBook| secondBook <=> firstBook }
puts "Sorting: decending: #{books}"

#join with join param
puts books.join(', ')
puts books.join(' ==== ')

#length (calculate array length)
puts books.length

#push (add element to end of array)
books.push 'whatever'
puts books.to_s
puts books.length

#map to create an array from existing
ret = books.map { |element| element.length }
puts ret.to_s

#pop (print the last element from the array and then remove it)
puts books.pop
puts books.to_s
puts books.length

#standard Looping
standard_array.each	{ |item| puts "Standard array: #{item}"	}
string_array.each	{ |item| puts "String array: #{item}"	}
multi_d_array.each	{ |item| puts "Multi-D array: #{item}"	}
dictionary_symbol.each	{ |label, value| puts "Dictionary_Symbol: "	\
			  "#{label} = #{value}"
			}

#access multi-dimensional array's data
puts "Multi-D array: #{multi_d_array[1][2]}"

#access hash array data
puts "hash_array: #{hash_array["name"]}"
#creating new hash array
hash2 = Hash.new
hash2["Dog_Name"] = "dog"
puts "hash2: #{hash2["Dog_Name"]}"

#Accessing all hash array item with .each
hash_array.each do |zion, color|
    puts "#{zion}: #{color}"
end

#Symbol conversion
symbols = []
string_array.each do |s|
	symbols.push(s.intern)
	#symbol.push(s.to_sym)		#alternative to intern
end
symbols.each { |symbol| puts "Symbol: #{symbol}" }

#Calling using .each_key and .each_value
dictionary_symbol.each_key { |key| print "Symbol Each_Key: #{key}\n" }
dictionary_symbol.each_value { |value| print "Symbol Each_Value: #{value}\n" }

#Using .all? to run through all elements in an array
puts [1, 2, 3].all? { |x| x.is_a? Fixnum }

#Using .find_all to loop through all elements
value = [1, 2, 2, 3, 4, 5]
puts value.find_all { |x| value.count(x) == 1}
	#Use .find to find an element
puts value.find { |x| value == 3 }

#Sort Mix Array
sam = [ 1, "2", "3", 4, "5"]
puts sam.grep(Fixnum).sort + sam.grep(String).sort	#Number before String
puts sam.grep(String).sort + sam.grep(Fixnum).sort	#String before Number

#Select elements in an array
p [1, 2, 3, 4, 5].select { |value| value.odd? }

#Use .each_slice to slice array into multiple arrays
[1, 2, 3, 4, 5, 6].each_slice(2) { |x| p x }

#==============================================
# Strings Manipulation
#==============================================
#Redaction
puts "Redaction Example:"
sentence = "A Quick Brown Fox Jumps Over The Lazy Dog"
words = sentence.split(" ")	#Split Sentence to words
words.each do |item|
	if item == "Brown" then print "<REDACTED> "
	else print "#{item} "
	end
end
print "\n"

#Replacement
puts sentence.gsub!(/s/, " <REPLACED!> ")

#Arithmetic
puts "A " + "Quick " + "Brown Fox " + "Jumps " + "Over " + "The " + "Lazy Dog."
puts "Repeater " * 4

#Escape characters (escape only ' and \)
puts "I'm escaping \' and \\ but not \d \n"

#Methods
lineWidth=50; var1 = "aAbBcCDdEe"
puts var1.upcase
puts var1.downcase
puts var1.swapcase
puts var1.capitalize
puts var1.reverse

	#alignment
puts var1.center(lineWidth)
puts var1.ljust(lineWidth)
puts var1.rjust(lineWidth)

puts var1.center lineWidth
puts var1.ljust lineWidth
puts var1.rjust lineWidth

puts var1.ljust(lineWidth/2) + var1.rjust(lineWidth/2)

	#return an index of target
puts "Strings".index("i")
	#return the value of a matched target, nil if nothing
puts "Strings".match("ings")
	#return all values of a matched target, empty array if nothing
puts "Strings deltasZ Ranchor".scan(/\w{7}/)

#=============================================
# Regular Expression
#=============================================
puts "Strings".index(/a|e|i|o|u|A|E|I|O|U/)
puts "Please 243-443-2254".match(/\d{3}-\d{2}-\d{4}/)
puts "Please 243-443-2254".match(/\d{3}[[:print:]]\d{2}[[:print:]]\d{4}/)


#=============================================
# Conversion
#=============================================
#to string
puts 0.52323423.to_s
puts String(0.52323423)

#to integer
puts '99.23423'.to_i
puts Integer('99')
"30 seconds".to_i
# This won't work: Integer("30 seconds")

#to float
puts '99.23423'.to_f
puts Float('99.23423')


#==============================================
# Gather Input
#==============================================
print "This is how you request an input from user (Athena, Bevelor, whatever): "
input = gets.chomp	# "gets" input, then "chomp" off the end of line
input.upcase! #Input processing for good practise.
puts "This is your input after processing:  #{input}"
