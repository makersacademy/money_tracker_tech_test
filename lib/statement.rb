# Class that creates statements for Account
class Statement
  attr_reader :account

  def initialize(account)
    @account = account
  end

  def print_statement
    i = 0
    while i < account.deposit_record.length do
      transaction = account.deposit_record[i]
      transaction_object = transaction[i]
      date = transaction_object.created_date
      value = transaction_object.value
      balance = transaction[i+1]
      puts "Date: #{date} Transaction Type: #{transaction_object.class} Amount: #{value} Balance: #{balance}"
      i += 1
    end
  end
end
