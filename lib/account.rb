require "pry"

require 'date'
require './lib/statement_printer'

class Account
  attr_reader :balance

  def initialize(printer = StatementPrinter.new)
    @balance = 0
    @transaction_log = []
    @statement_printer = printer
  end

  def deposit(amount)
    raise 'Invalid amount' if !amount.is_a?(Numeric) || amount < 0
    self.balance += amount
    log_transaction(:credit, amount, self.balance)
  end

  def withdraw(amount)
    raise 'Invalid amount' if !amount.is_a?(Numeric) || amount < 0
    raise 'Insufficient funds' if amount > self.balance
    self.balance -= amount
    log_transaction(:debit, amount, self.balance)
  end

  def statement
    transaction_log.clone.freeze
  end

  def print_statement
    statement_printer.print_out(transaction_log)
  end

  private

  attr_writer :balance
  attr_reader :transaction_log, :statement_printer

  def log_transaction(type, amount, balance, date = Date.today)
    transaction = {
      type: type,
      amount: amount,
      balance: balance,
      date: date
    }
    transaction_log.push(transaction)
  end
end
