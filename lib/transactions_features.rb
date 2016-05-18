require_relative "transaction"

transaction = Transaction.new(100,nil)
transaction2 = Transaction.new(nil,100)

p transaction.change_balance
p transaction2.change_balance
