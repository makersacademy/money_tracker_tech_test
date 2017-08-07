require 'app'

describe App do
  it 'prints a menu' do
    expect(STDOUT).to receive(:puts).with("\nWelcome to Your Bank".center(70),
                                          "-------------".center(70),
                                          "1. " + Rainbow("View balance").underline.bright,
                                          "2. " + Rainbow("View transactions").underline.bright,
                                          "3. " + Rainbow("Deposit").underline.bright,
                                          "4. " + Rainbow("Withdraw").underline.bright,
                                          "9. " + Rainbow("Exit").red.underline.bright)
    subject.print_menu
  end

   it 'terminates the app' do
    expect(STDOUT).to receive(:puts).with("\e[33m\e[1mThe program is now terminated! Good bye!\e[0m")
    subject.termination
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
    puts "#{trans.date} || #{trans.amount} || #{trans.current_debit} || #{trans.current_balance}"
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
