require 'date'
require './lib/transaction.rb'
require './lib/transaction_log.rb'
require './lib/account.rb'


date_1 = Date.new(2012,1,10)
date_2 = Date.new(2012,1,13)
date_3 = Date.new(2012,1,14)

transaction_1 = Transaction.new(date_1, 1000, 0)
transaction_2 = Transaction.new(date_2, 2000, 0)
transaction_3 = Transaction.new(date_2, 0, 500)

transaction_log = TransactionLog.new

account = Account.new transaction_log

transaction_log.log(transaction_1)
transaction_log.log(transaction_2)
transaction_log.log(transaction_3)

p account.calculate_balance

transaction_log.print_statement

"date || credit || debit || balance
2012/01/13 || 0.00 || 500.00 || 2500.00
2012/01/13 || 2000.00 || 0.00 || 3000.00
2012/01/10 || 1000.00 || 0.00 || 1000.00"
