require 'transaction'

class Account

  attr_reader :balance, :transactions, :transaction_class

  def initialize(transaction_class)
    @balance = 0
    @transactions = []
    @transaction_class = Transaction
  end

  def print_statement
    "#{statement_columns}\n#{transaction_list}"
  end

  def deposit(amount)
    @transactions << @transaction_class.new(amount)
  end

private

  def statement_columns
    "date || credit || debit || balance"
  end

  def transaction_list
    list = ""
    @transactions.each { |t|
      list << "#{t}\n"
    }
    list
  end

end
