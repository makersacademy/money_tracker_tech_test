# Class that creates statements for Account
class Statement
  attr_reader :account

  def initialize(account)
    @account = account
  end

  def print_statement(order='ascending')
    order == 'descending' ? full_statement_collation.reverse : full_statement_collation
  end

  def print_deposits(order='ascending')
    order == 'descending' ? deposits_collation.reverse : deposits_collation
  end

  def print_withdrawls(order='ascending')
    order == 'descending' ? withdrawls_collation.reverse : withdrawls_collation
  end

  private

  def full_statement_collation
    i = 0
    print_array = []
    while i < account.transaction_record.length
      transaction = account.transaction_record[i]
      transaction_object = transaction[0]
      print_array.push("Date: #{transaction_object.created_date} " \
      " Transaction Type: #{transaction_object.class} " \
      " Amount: #{transaction_object.value} Balance: #{transaction[1]}")
      i += 1
    end
    print_array
  end

  def deposits_collation
    i = 0
    print_array = []
    while i < account.transaction_record.length
      if account.transaction_record[i][0].class == Deposit
        transaction = account.transaction_record[i]
        transaction_object = transaction[0]
        print_array.push("Date: #{transaction_object.created_date} " \
        " Transaction Type: #{transaction_object.class} " \
        " Amount: #{transaction_object.value} Balance: #{transaction[1]}")
      end
      i += 1
    end
    print_array
  end

  def withdrawls_collation
    i = 0
    print_array = []
    while i < account.transaction_record.length
      if account.transaction_record[i][0].class == Withdrawl
        transaction = account.transaction_record[i]
        transaction_object = transaction[0]
        print_array.push("Date: #{transaction_object.created_date} " \
        " Transaction Type: #{transaction_object.class} " \
        " Amount: #{transaction_object.value} Balance: #{transaction[1]}")
      end
      i += 1
    end
    print_array
  end
end
