# Class that creates statements for Account
class Statement
  attr_reader :account

  def initialize(account)
    @account = account
  end

  def print_statement(order = 'ascending')
    order == 'descending' ? statement_collation.reverse : statement_collation
  end

  def print_deposits(order = 'ascending')
    order == 'descending' ? deposits_collation.reverse : deposits_collation
  end

  def print_withdrawls(order = 'ascending')
    order == 'descending' ? withdrawls_collation.reverse : withdrawls_collation
  end

  private

  def statement_collation
    print_array = []
    account.transaction_record.each do |tran|
      print_array.push(
        "Date: #{tran[0].created_date} " \
        "Transaction Type: #{tran[0].class} " \
        "Amount: #{tran[0].value} Balance: #{tran[1]}"
      )
    end
    print_array
  end

  def deposits_collation
    print_array = []
    account.transaction_record.each do |tran|
      if tran[0].class == Deposit
        print_array.push(
          "Date: #{tran[0].created_date} " \
          "Transaction Type: #{tran[0].class} " \
          "Amount: #{tran[0].value} Balance: #{tran[1]}"
        )
      end
    end
    print_array
  end

  def withdrawls_collation
    print_array = []
    account.transaction_record.each do |tran|
      if tran[0].class == Withdrawl
        print_array.push(
          "Date: #{tran[0].created_date} " \
          "Transaction Type: #{tran[0].class} " \
          "Amount: #{tran[0].value} Balance: #{tran[1]}"
        )
      end
    end
    print_array
  end
end
