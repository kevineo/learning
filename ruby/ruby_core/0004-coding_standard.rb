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
# Coding Standards
# Readability = 1st priority
# Concise = 2nd
#==============================================
require 'prime'

def first_n_primes(n)
	# Check for correct input!
	"n must be an integer" unless n.is_a? Integer
	"n must be greater than 0" if n <= 0

	# The Ruby 1.9 Prime class makes the array automatically!
	prime = Prime.instance
	prime.first n
end
puts first_n_primes(10)

#==============================================
# Another Example
# Class : Use Camel case  "ThisIsCamelStyle"
# Module & Method : Use snake case "this_is_snake"
# Constant: Use upper case: SECONDARY_BIT
# Variables: use snake case
#==============================================
class BankAccount
	attr_reader :name, :balance
	def initialize(name, balance=100)
		@name = name
		@balance = balance
	end

	public
	def display_balance(pin_number)
		puts pin_number == pin ? "Balance: $#{@balance}" : pin_error
	end

	def withdraw(pin_number, amount)
		if pin_number == pin
			@balance -= amount
			puts "Withdrew: #{amount}"
		else
			puts "pin error."
		end
	end

	private
	def pin
		@pin = 1234
	end

	def pin_error
		puts "Access denied: incorrect pin"
	end
end

checking_account = BankAccount.new("hydra", 1000)
checking_account.display_balance(11)
checking_account.display_balance(1234)
checking_account.withdraw(1234, 5)
checking_account.display_balance(1234)
