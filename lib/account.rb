class Account
  attr_reader :balance
  attr_accessor :account_statement

  def initialize
    @balance = 0
    @account_statement = []
  end

  def withdraw_funds(amount)
    @balance -= amount
    calculate_statement(amount, :withdraw)
  end

  def deposit_funds(amount)
    @balance += amount
    calculate_statement(amount, :deposit)
  end

  def calculate_statement(amount, type)
    statement = {}
    statement[:type] = type
    statement[:date] = time
    statement[:transaction] = amount
    statement[:balance] = @balance
    account_statement.push(statement)
  end

  def time
    Time.now.strftime("%m/%d/%Y")
  end

  def print_statement
    puts "type || date || debit || balance\n"

    account_statement.each do | e |
      e.each_with_index do | value, index |
        if index == (e.length) -1
          puts value[1].to_s
        else
          print value[1].to_s + " || "
        end
      end
    end
  end
end
