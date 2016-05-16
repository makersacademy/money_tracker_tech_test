
class Transaction

	attr_reader :date, :credit, :debit

	def initialize
		@date = Time.now.strftime("%d/%m/%Y")
		@credit = 0
		@debit = 0
	end

	def type_credit(amount)
		@credit = amount
	end

	def type_debit(amount)
		@debit = amount
	end
	
end