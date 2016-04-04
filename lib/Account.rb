class Account

	attr_reader :balance

	def initialize
		@balance = 0.00
		@transaction_history = []
	end

	def deposit amount, date
		@balance += amount
		add_transaction(:deposit, amount, date)
	end

	def withdraw amount, date
		fail 'Balance too low' if @balance - amount < 0.00
		@balance -= amount
		add_transaction(:withdrawal, amount, date)
	end

	def add_transaction type, amount, date
		(credit = amount) && (debit = nil) if type == :deposit
		(debit = amount) && (credit = nil) if type == :withdrawal
		new_transaction = {
												date: date,
												credit: credit,
												debit: debit,
												balance: balance
											}
		@transaction_history.unshift(new_transaction)

	end

	def transaction_history
		@transaction_history.clone
	end
	# eventually make private?

	def print_statement
		statement = 'date || credit || debit || balance'
		transaction_history.each do |transaction|
			statement << "\n" + transaction[:date] + " ||"
			transaction[:credit].nil? ? statement << " ||" : statement << " #{sprintf('%.2f',transaction[:credit])}" 
			transaction[:debit].nil? ? statement << " ||" : statement << " #{sprintf('%.2f',transaction[:debit])}" 
			statement << " ||" + " #{sprintf('%.2f',transaction[:balance])}"
		end
		puts statement
	end

end