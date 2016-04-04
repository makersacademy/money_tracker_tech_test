class Account

  attr_reader :balance

  def initialize(printer)
    @balance = 0
    @statement = []
    @printer = printer
  end

  def deposit(value, date)
    @balance += value
    add_to_statement({date: date, balance: @balance, credit: value})
  end

  def withdraw(value, date)
    @balance -= value
    add_to_statement({date: date, balance: @balance, debit: value})
  end

  def print_statement
    @printer.print_statement(statement)
  end

  def show_statement
    statement.dup
  end

  private

  def statement
    @statement
  end

  def add_to_statement(args)
    transaction = {date: args[:date], balance: args[:balance], credit: args[:credit], debit: args[:debit]}
    statement.push(transaction)
  end

end
