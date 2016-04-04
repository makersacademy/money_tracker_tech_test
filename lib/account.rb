class Account
	attr_reader :balance
	def initialize
		@balance = 0
	end

	def withdraw(amount)
		raise "You do not have enough money in your account." if @balance <= 0
		@balance -= amount
	end
end