require_relative '../lib/account.rb'
require_relative '../lib/transaction.rb'
require 'Date'

p "transaction"
p t = Transaction.new(date: Date.new(2012,1,10), credit: nil, debit: 1000, balance: 1000)
p "transaction.date"
p t.date
p "transaction debit"
p t.debit
p "transaction balance"
p t.balance
p a = Account.new
p "deposit"
p a.deposit(amount: 1000,date: Date.new(2012,1,10))
p "balance"
p a.balance
p "withdraw"
p a.deposit(amount: 2000, date: Date.new(2012,1,13))
p "balance"
p a.balance
p a.withdraw(amount: 500, date: Date.new(2012,1,14))
p "next one is statement"
p a.statement

a.print_statement

