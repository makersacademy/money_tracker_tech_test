require_relative 'transaction'
require_relative 'statement'

class Bank

	attr_reader :statement, :transaction

	def initialize(transaction=Transaction)
		@statement = Statement.new
		@transaction = transaction
	end

	def make_deposit(amount)
		new_transaction = @transaction.new
		new_transaction.type_credit(amount)
		@statement.store(new_transaction)
	end

end