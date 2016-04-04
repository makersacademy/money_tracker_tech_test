require_relative 'statement.rb'

class Account 

	attr_reader :balance

	def initialize
		@balance = 0
	end

	def deposit(amount)
		@balance += amount 
	end

	def withdraw(amount)
		raise "You can only withdraw #{@balance}." if amount > @balance
		@balance -= amount
	end

	def statements
		# grabs statements formatted
	end
end