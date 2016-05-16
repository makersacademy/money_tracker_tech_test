require './lib/account.rb'
require './lib/transaction.rb'

account = Account.new
account.deposit(1000)
account.withdraw(500)

puts account.print_statement
