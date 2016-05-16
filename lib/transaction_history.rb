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
    p transaction.values.map {|x| x.to_i.zero? ? "" : x }.join(" || ")
  end

end
