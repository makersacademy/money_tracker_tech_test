require './lib/account'

account = Account.new

account.deposit('10/01/2013', 1000)
account.deposit('12/01/2013', 2000)
account.withdraw('14/01/2013', 500)

puts account.statement
