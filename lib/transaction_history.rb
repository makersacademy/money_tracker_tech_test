class TransactionHistory

  def initialize(transaction_class: )
    @transaction_class = transaction_class
    @transactions = []
  end

  def transactions
    @transactions.dup
  end

  def deposit(date, amount, balance)
    transaction = @transaction_class.new(date, amount, balance)
    @transactions.unshift(transaction)
  end

  def withdraw(date, amount, balance)
    transaction = @transaction_class.new(date, -amount, balance)
    @transactions.unshift(transaction)
  end

  def print_statement
    p 'date || credit || debit || balance'
    transactions.each{|transaction| print_transaction(transaction)}
  end

  private

  def print_transaction(transaction)
    p "#{transaction.date} || #{transaction.credit} || #{transaction.debit} || #{transaction.balance}"
  end

end
