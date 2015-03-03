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
# Method
#==============================================
# Basic
def greeting
	puts "Basic Method: Hello. Nice to Meet You!"
end
greeting


# With input
def math(input)
	input = input ** 3
	return input
end
print "Input Method: #{math(8)}\n"


# With Variable Argument Input Method / Splat Method
def math(input, *others)
	input **= 3
	others.each { |item| puts "Splat Method: others = #{item}!" }
end
math(1, 2, 3, 4, 5)

# This is a non-destructive method
value = "String"
puts value.gsub("S", "X")
puts "old value: " + value
# This is a destructive method
puts value.gsub!("S", "X")
puts "old value: " + value


#==============================================
# Functions
#==============================================
# Standard Function
def add (a, b)
    return a + b
end
output = add(4,4)
puts "Function: Added 4 + 4 = #{output}"

# Nameless Method
1.times do
  puts "I'm a code block!"
end

1.times { puts "As am I!" }

#Yield
def yield_name(name)
  puts "In the method! Let's yield."
  yield("Kim")
  puts "In between the yields!"
  yield(name)
  puts "Block complete! Back in the method."
end
yield_name("Eric") { |n| puts "My name is #{n}." }

# Now call the method with your name!
yield_name("Me") { |n| puts "My name is #{n}" }

#==============================================
# Proc (Similar to C Pointers
#==============================================
# Basic
floats = [1.2, 3.45, 0.91, 7.727, 11.42, 482.911]
round_down = Proc.new { |x| x.floor unless x == 0 }
ints = floats.collect(&round_down)

# Proc Yield Integration
def greeter
    yield
end
phrase = Proc.new { puts "Hello there!" }
greeter(&phrase)

# Direct Call
hi = Proc.new { puts "Hello!" }
hi.call

#==============================================
# Lambda
#==============================================
# Basic
strings = ["leonardo", "donatello", "raphael", "michaelangelo"]
symbolize = lambda { |x| x.to_sym }
symbols = strings.collect(&symbolize)

# Proc vs. Lambda
def batman_ironman_proc
	victor = Proc.new { return "Batman will win!" }
	victor.call
	"Iron Man will win!"
end
puts batman_ironman_proc

def batman_ironman_lambda
	victor = lambda { return "Batman will win!" }
	victor.call
	"Iron Man will win!"
end
puts batman_ironman_lambda

# Example of using Lambda
crew = {
  captain: "Picard",
  first_officer: "Riker",
  lt_cdr: "Data",
  lt: "Worf",
  ensign: "Ro",
  counselor: "Troi",
  chief_engineer: "LaForge",
  doctor: "Crusher"
}
first_half = lambda {|key, value| value if value < "M"}
a_to_m = crew.select(&first_half)


#==============================================
# Classes
#==============================================
# Basic
class Language
  def initialize(name, creator)
    @name = name
    @creator = creator
  end

  def description
    puts "I'm #{@name} and I was created by #{@creator}!"
  end
end

ruby = Language.new("Ruby", "Yukihiro Matsumoto")
python = Language.new("Python", "Guido van Rossum")
javascript = Language.new("JavaScript", "Brendan Eich")
ruby.description
python.description
javascript.description

# Variables in Class
class Person
  @@people_count = 0

  def initialize(name)
    @name = name
    @@people_count += 1
  end

  def self.number_of_instances
    return @@people_count
  end
end

matz = Person.new("Yukihiro")
dhh = Person.new("David")

puts "Number of Person instances: #{Person.number_of_instances}"


#==============================================
# Modules
#==============================================
# Import via 'require
require 'date'
puts Date.today

# Use Variable from existing Module
puts Math::PI

# Using local module
module Action
  def jump
    @distance = rand(4) + 2
    puts "I jumped forward #{@distance} feet!"
  end
end

class Rabbit
  include Action
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

class Cricket
  include Action
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

peter = Rabbit.new("Peter")
jiminy = Cricket.new("Jiminy")

peter.jump
jiminy.jump

# ThePresent has a .now method that we'll extend to TheHereAnd
module ThePresent
  def now
    puts "It's #{Time.new.hour > 12 ? Time.new.hour - 12 : Time.new.hour}:#{Time.new.min} #{Time.new.hour > 12 ? 'PM' : 'AM'} (GMT)."
  end
end

class TheHereAnd
  extend ThePresent
end

TheHereAnd.now

