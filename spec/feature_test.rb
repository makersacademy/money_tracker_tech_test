require_relative '../lib/account'
require_relative '../lib/transaction'
require_relative '../lib/statement'

acct = BankAccount.new

p "Starting balance: #{acct.current_balance}"
puts ''

first_trans = Transaction.new(credit: 1000, date: Date.new(2012,01,10))
acct.deposit(first_trans)
p "Credit account: #{first_trans.credit}"
p "Current balance: #{acct.current_balance}"
puts ''

second_trans = Transaction.new(credit: 2000, date: Date.new(2012,01,13))
acct.deposit(second_trans)
p "Credit account: #{second_trans.credit}"
p "Current balance: #{acct.current_balance}"
puts ''

third_trans = Transaction.new(debit: 500, date: Date.new(2012,01,14))
acct.withdraw(third_trans)
p "Debit account: #{third_trans.debit}"
p "Current balance: #{acct.current_balance}"

puts ''
p 'All transactions'
p acct.transactions

p 'create a new statement for acct'
statement = Statement.new(acct)
puts ''
puts 'Print statement:'
statement.print_statement
