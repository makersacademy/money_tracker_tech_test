require_relative 'transaction'

class Account

  attr_reader :balance, :transactions, :transaction_class, :statement

  def initialize(transaction_class)
    @balance = 0
    @transactions = []
    @transaction_class = transaction_class
    @statement = "date || credit || debit || balance \n "
  end

  def deposit(amount, date)
    deposit = @transaction_class.new(amount, date)
    transactions.push(deposit)
    calculate_balance
    deposit.update_transaction_balance(@balance)
  end

  def withdraw(amount, date)
    withdrawal = @transaction_class.new(-amount, date)
    transactions.push(withdrawal)
    calculate_balance
    withdrawal.update_transaction_balance(@balance)
  end

  def check_statement
    transactions.each { |transaction| print_statement(transaction) }
    puts @statement
    @statement
  end

  def print_statement(transaction)
    transaction.amount < 0 ? debit = transaction.amount : credit = transaction.amount
    @statement += "#{transaction.date} || #{credit} || #{debit} || #{transaction.balance_after_transaction} \n"
  end

  private

  def calculate_balance
    amounts = []
    transactions.map { |transaction| amounts.push(transaction.amount)  }
    @balance = amounts.reduce(:+)
  end

end
