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

menu_options = ["add) Add a Movie",
                "update) Rate Movie",
                "display) Display a Movie",
                "delete) Delete a Movie",]


#==============================================
# Comparison
#==============================================
puts 1 > 2			#more than
puts 1 < 2			#less than
puts 5 >= 5			#more than and equal
puts 5 <= 5			#less than and equal
puts 5 <= 4			#less than and equal
puts 5 == 5			#is equal
puts 5 != 5			#not equal
puts 'cat' < 'dog'		#Go alphabetical
puts 'cat' < 'Dog'		#Capitalized goes first
puts true and true		# using and
puts true or false		# using or
puts (not true)			# using not

example = (true or false) and
	  true and
	  true and
	  (not true) and
	  true

#==============================================
# Ternary Operator
#==============================================
puts 1 < 2 ? "One is less than two!" : "One is not less than two."


#==============================================
# If / else
#==============================================
puts "if/else demo #1: What do you plan to do?\n"
menu_options.each { |option| puts " #{option}" }
option = gets.chomp.upcase

if option == "ADD" then puts "if/else: Add is selected"
elsif option == "UPDATE" then puts "else/if: Update is selected"
else puts "else: anything else is selected."
end

if option == "ADD"
        puts "Your input string is: #{option}"
elsif option == "UPDATE"
        puts "Your input string is: #{option}"
else
	puts "else is selected!"
end


#==============================================
# Case / Switch cases
#==============================================
puts "Case demo #1: What do you plan to do?\n"
menu_options.each { |option| puts " #{option}" }
option = gets.chomp.upcase

case option
when "ADD" then puts "case: Added!"
when "UPDATE" then puts "case: Updated!"
when "DISPLAY" then puts "case: Movies!"
when "DELETE" then puts "case: Deleted!"
else puts "Error!"
end

case option
when "ADD"
	puts "case: Added!"
when "UPDATE"
	puts "case: Updated!"
when "DISPLAY"
	puts "case: Movies!"
when "DELETE"
	puts "case: Deleted!"
else
	puts "Error!"
end
