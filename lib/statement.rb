# Class that creates statements for Account
class Statement
  attr_reader :account

  def initialize(account)
    @account = account
  end

  def print_statement(order='ascending')
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
    if order == 'descending'
      return print_array.reverse
    else
      return print_array
    end
  end

  def print_deposits
    i = 0
    print_array = []
    while i < deposits_collation.length
      print_array.push("Date: #{deposits_collation[i][0].created_date} " \
      " Transaction Type: #{deposits_collation[i][0].class} " \
      " Amount: #{deposits_collation[i][0].value} " \
      "Balance: #{deposits_collation[i][1]}")
      i += 1
    end
    print_array
  end

  def print_withdrawls
    i = 0
    print_array = []
    while i < withdrawls_collation.length
      print_array.push("Date: #{withdrawls_collation[i][0].created_date} " \
      " Transaction Type: #{withdrawls_collation[i][0].class} " \
      " Amount: #{withdrawls_collation[i][0].value} " \
      "Balance: #{withdrawls_collation[i][1]}")
      i += 1
    end
    print_array
  end

  private

  def deposits_collation
    i = 0
    deposits_array = []
    while i < account.transaction_record.length
      if account.transaction_record[i][0].class == Deposit
        deposits_array.push(account.transaction_record[i])
      end
      i += 1
    end
    deposits_array
  end

  def withdrawls_collation
    i = 0
    withdrawls_array = []
    while i < account.transaction_record.length
      if account.transaction_record[i][0].class == Withdrawl
        withdrawls_array.push(account.transaction_record[i])
      end
      i += 1
    end
    withdrawls_array
  end
end
