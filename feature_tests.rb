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
