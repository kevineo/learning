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


class AtmCard
	attr_reader :id, :status
	def initialize(id, status)
		@id = id
		@status = status
	end
end

class AtmMachine
	def initialize(id, status)
		@id = id
		@status = status
	end
end


# Demonstrate encapsulation. User is can't edit @machine
# or @card directly. It needs to call the class's methods.
# Also, user is not allowed to call the class's private method
# "get_card_id" as well.
class AtmSystem
	def initialize
		# encapsulated variables
		@machine = []
		@card = []
	end

	# This is a class method, public method.
	def add_machine(machine_name)
		@machine.push(machine_name)
	end

	def read_machine_status(machine_name)
		@machine.each do |name|
			next if name != machine_name
			return machine_name.status
		end
		nil
	end

	def add_card(card_name)

	end

	def read_card_id(card_name)
		get_card_id(card_name)
	end

	private
	# encapsulated method.
	# This is also class method, private method
	def get_card_id(card_name)
		@card.each do |name|
			next if name != card_name
			return card_name.status
		end
		nil
	end
end


class OnlineSystem
	attr_reader :id, :status
	def initialize(id, status)
		@id = id
		@status = status
	end
end

# Demosntrate Composition. In Facilities, it creates
# multiple class objects.
class BankFacilities
	attr_reader :online_system, :atm_system
	def initialize
		@online_system = OnlineSystem.new
		@atm_system = AtmSystem.new
		@id = "corn"
	end

	def bank_name
		"A Bank Name"
	end

	def bank_account
		"3453-3345-345345"
	end
end

# Demonstrate Inheritance. Bank inherits Bank Facilities.
class Bank < BankFacilities

	# Demonstrate the use of super. Super is used to call
	# the parent's "same name method" to be executed inside
	# an overriding method.
	def initialize
		super
		@id = "new_corn"
	end

	# Demonstrate Overriding method. Bank will call this
	# "bank_name" instead of its parent.
	# This is also known as Polymorphism
	def bank_name
		"Please modify this for returning your bank name"
	end

	# Demonstrate Law of Demeter. You should not call the
	# parent's functions. Instead, create class method to
	# do so. Example as follow.
	# In this case, external user will use:
	# Bank.return_online_system to get BankFacilities.@onlinesystem
	# instead of Bank.BankFacilities.@onlinesystem.
	# The Law is simple:
	# 		USE only 1 dot
	def return_online_system
		@online_system
	end
end

module BankAction
	def self.action
	end

	# Demonstrate duck typing. This method takes an object and
	# call the object's class method bank_name
	def self.get_bank_name(bank_class_object)
		bank_class_object.bank_name
	end
end

# Demonstrate the use of module. When includes BankAction module,
# All methods in that modules are being called into that class.
# Thus, it allows method reusability across different classses.
class AffiznaBank < Bank
	include BankAction
	def initialize
		super
	end

# Demonstrate Seperate of Concerns. It's also known as isolation.
# This bank isolates its function into 3 different levels, allowing
# differnt programmers working at differnet level without creating
# a dependency across each level.

	# High Level
	# ==========
	def inquire_name(user)
		check_bank_name(user)
	end

	private
	# Mid Level
	# ==========
	def check_bank_name(user)
		return nil if user.nil?
		get_bank_name
	end

	# Low Level
	# ==========
	def get_bank_name
		bank_name
	end
end
