class Account

	attr_reader :balance

	def initialize
		@balance = 0
		@transaction_history = []
	end

	def deposit amount, date
		@balance += amount
		add_transaction(:deposit, amount, date)
	end

	def withdraw amount, date
		fail 'Balance too low' if @balance - amount < 0
		@balance -= amount
		add_transaction(:withdrawal, amount, date)
	end

	def add_transaction type, amount, date
		(credit = amount) && (debit = '||') if type == :deposit
		(credit = '||') && (debit = amount) if type == :withdrawal
		new_transaction = {
												date: date,
												credit: credit,
												debit: debit,
												balance: balance
											}
		@transaction_history << new_transaction

	end

	def transaction_history
		@transaction_history.clone
	end
	# eventually make private?

	def print_statement
	end

end