require 'date'
require './lib/transaction.rb'
require './lib/account.rb'
require './lib/statement.rb'

date_1 = Date.new(2012,1,10)
date_2 = Date.new(2012,1,13)
date_3 = Date.new(2012,1,14)

transaction_1 = Transaction.new(date_1, 1000, 0)
transaction_2 = Transaction.new(date_2, 2000, 0)
transaction_3 = Transaction.new(date_2, 0, 500)

account = Account.new

account.log(transaction_1)
account.log(transaction_2)
account.log(transaction_3)

p account.calculate_balance

statement = Statement.new(account)

puts statement.view_statement
puts statement.view_statement(filter: :withdrawal)
puts statement.view_statement(ascending:true)

"date || credit || debit || balance
2012/01/13 || 0.00 || 500.00 || 2500.00
2012/01/13 || 2000.00 || 0.00 || 3000.00
2012/01/10 || 1000.00 || 0.00 || 1000.00"
