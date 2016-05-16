require_relative '../lib/account.rb'
require 'Date'

p a = Account.new
p "deposit"
p a.deposit(1000,Date.new(2012,1,10))
p "balance"
p a.balance
p "withdraw"
p a.deposit(2000,Date.new(2012,1,13))
p "balance"
p a.balance
p a.withdraw(500,Date.new(2012,1,14))
p "next one is statement"
p a.statement

