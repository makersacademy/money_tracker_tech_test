require_relative '../lib/account'
require_relative '../lib/transaction'
require_relative '../lib/statement'

acct = BankAccount.new

p "Starting balance: #{acct.current_balance}"
puts ''

first_trans = Transaction.new(1000, Date.new(10/01/2012))
acct.deposit(first_trans)
p "Deposit into account: #{first_trans.amount}"
p "Current balance: #{acct.current_balance}"
puts ''

second_trans = Transaction.new(3000, Date.new(13/01/2012))
acct.deposit(second_trans)
p "Deposit into account: #{second_trans.amount}"
p "Current balance: #{acct.current_balance}"
puts ''

third_trans = Transaction.new(500, Date.new(14/01/2012))
acct.withdraw(third_trans)
p "Deposit into account: #{third_trans.amount}"
p "Current balance: #{acct.current_balance}"

statement = Statement.new(acct)
