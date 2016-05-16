require_relative 'lib/account'
require_relative 'lib/balance'
require_relative 'lib/statement'
require_relative 'lib/deposit'
require_relative 'lib/withdraw'

statement = Statement.new({balance_class:Balance,deposit_class:Deposit,withdraw_class:Withdraw}) 
my_account = Account.new({statement:statement})


puts "1) should add a balance and print it out"

my_account.deposit(100)
puts my_account.check_balance

puts "2) should show 60"
my_account.withdraw(40)
puts my_account.check_balance

puts "3 should how log of transactions"
my_account.print_statement
