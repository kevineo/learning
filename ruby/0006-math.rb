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
# Math
#==============================================
#power e.g. 5^2
puts 5**2

#divide
puts 10/5

#remainder
puts 11%5

#add
puts 5 + 5

#subtract
puts 5 - 3

#multiply
puts 5 * 2

#random
puts rand(101)		#full random
puts rand(100)
puts rand(1)
puts rand

puts srand 1776		#repeatable random by seeding
puts rand(100)
puts rand(100)
puts rand(100)
puts srand 1776		#repeatable random by seeding
puts rand(100)
puts rand(100)
puts rand(100)

puts Math::PI
puts Math::E
puts Math::cos(45)
puts Math::sin(45)
puts Math::tan(Math::PI/4)
puts Math::log(Math::E**2)
puts ((1 + Math.sqrt(5))/2)

(5..10).inject(0) { |sum, x| sum += x**3 }
