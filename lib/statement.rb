# Class that creates statements for Account
class Statement
  attr_reader :account

  def initialize(account)
    @account = account
  end

  def print_statement
    i = 0
    while i < account.transaction_record.length
      transaction = account.transaction_record[i]
      transaction_object = transaction[0]
      puts "Date: #{transaction_object.created_date} " \
      "Transaction Type: #{transaction_object.class} " \
      "Amount: #{transaction_object.value} Balance: #{transaction[1]}"
      i += 1
    end
  end
end
