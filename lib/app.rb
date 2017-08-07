require_relative './account'
require 'rainbow'

class App

  def initialize(account = Account.new)
    @account = account
  end
  def print_menu
    puts("\nWelcome to Your Bank".center(70),
                "-------------".center(70),
                "1. " + Rainbow("View balance").underline.bright,
                "2. " + Rainbow("View transactions").underline.bright,
                "3. " + Rainbow("Deposit").underline.bright,
                "4. " + Rainbow("Withdraw").underline.bright,
                "9. " + Rainbow("Exit").red.underline.bright)
  end

  def termination
    puts Rainbow("The program is now terminated! Good bye!").yellow.bright
    exit
  end

  def deposit
    puts "How much would you like to deposit: "
    input = gets.chomp.to_i
    @account.deposit(input)
    puts "Thanks! £#{input} were added to your balance. current balance: £#{@account.balance}"
  end

def withdraw
  puts "How much would you like to withdraw: "
  input = gets.chomp.to_i
  @account.withdraw(input)
  puts "Thanks! £#{input} were deducted from your balance. current balance: £#{@account.balance}"
end

def interactive_menu
  @account = Account.new
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_transactions
  puts "date || credit || debit || balance"
  @account.transactions.each do |trans|
    puts "#{trans.date} || #{trans.amount} || #{trans.debit} || #{trans.balance}"
  end
end

def view_balance
  puts "Your account balance is £#{@account.balance}"
end


def process(selection)
  case selection
  when "1"
    view_balance
  when "2"
    print_transactions
  when "3"
    deposit
  when "4"
    withdraw
  when "9"
    termination
  end
end

end


app = App.new
app.interactive_menu
