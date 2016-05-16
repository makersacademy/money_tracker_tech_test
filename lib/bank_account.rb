class BankAccount

  AVAILABLE_BALANCE_ERROR = 'Not enough balance to withdraw'

  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit date, amount
    @balance += amount
    @transactions.unshift({date: date, credit: amount, debit: 0, balance: @balance })
  end

  def withdraw date, amount
    raise AVAILABLE_BALANCE_ERROR if @balance - amount <= 0
    @balance -= amount
    @transactions.unshift({date: date, credit: 0, debit: amount, balance: @balance })
  end

  def print_statement
    p 'date || credit || debit || balance'
    transactions.each{|transaction| print_transaction(transaction)}
  end

  private

  def print_transaction transaction
    p transaction.values.map {|x| x.to_i.zero? ? "" : x }.join(" || ")
  end
end
