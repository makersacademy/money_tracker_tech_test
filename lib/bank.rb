class Bank

	attr_reader :statement, :transaction

	def initialize(transaction=Transaction)
		@statement = Statement.new
		@transaction = transaction
	end

	def make_deposit(amount)
		@transaction.new.type_credit(amount)
	end

end