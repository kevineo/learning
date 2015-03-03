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
# For Loop
#==============================================
print "For loop exclude highest boundary\n"
for num in 1...3
	puts "For Loop (exclude): #{num}"
end

print "For loop include highest boundary\n"
for num in 1..3
	puts "For Loop (include): #{num}"
end

#==============================================
# X-Times Looping
#==============================================
5.times {puts "X-Time Loop: Printing"}

#==============================================
# While Loop
#==============================================
i = 0
while i <= 3 do
	puts "While Loop: #{i}"
	i += 1
end

#==============================================
# Until Loop
#==============================================
i = 0
until i > 3 do
	puts "Until Loop: #{i}"
	i += 1
end

#==============================================
# Simple Closed Loop
#==============================================
i = 0
loop do
	#Incremental Counter
	i += 1

	#Exit an entry within a loop
	next if i % 2 != 0
	print "Simple Closed Loop: #{i}\n"

	#Break the Loop
	break if i > 5
end

#==============================================
# Array Processing Loop
#==============================================
array = [1,2,3,4,5]
array.each do |x|
	x *= 10
	print "Array Loop: #{x}\n"
end
array.each { |y| puts "Array Loop (2): #{y}"}

array.each_with_index do |value, index|
	case index
	when 1 then puts value
	else
	end
end

#==============================================
# Symbol Loop
#==============================================
my_hash = { one: 1, two: 2, three: 3 }
my_hash.each_key { |key| print "Symbol Each_Key: #{key}\n" }
my_hash.each_value { |value| print "Symbol Each_Value: #{value}\n" }

#==============================================
# Using Upto or Downto
#==============================================
"L".upto("P") { |alphabet| puts "upto: #{alphabet}" }
100.downto(95) { |alphabet| puts "downto: #{alphabet}" }

#==============================================
# Infinity Loop
#==============================================
print "Are you ready for infinity loop (Yes/No): "
input = gets.chomp
input.upcase!
if input == "YES"
	#into infinity and beyond!
	loop { print "Infinity Loop: You're so dead!\n"}
else
	puts "Infinity Loop: Aww, you're just inside your comfort zone."
end
