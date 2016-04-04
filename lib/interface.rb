class Interface

  def print(account, type='all', direction='desc')
    output = ["date || credit || debit || balance"]
    transactions = filter_sort(account.transactions, type, direction)
    transactions.each do | transaction |
      output.push stringify(transaction)
    end
    output.join("\n")
  end

  private

  def stringify(transaction)
    credit_debit = "#{transaction[:amount]} ||" if transaction[:amount] > 0
    credit_debit = "|| #{-transaction[:amount]}" if transaction[:amount] < 0
    output = [transaction[:date], credit_debit, transaction[:balance]]
    output.join(" || ")
  end

  def filter_sort(transactions, type, direction)
    transactions = transactions.select { |txn| txn[:amount] > 0 } if type == 'deposits'
    transactions = transactions.select { |txn| txn[:amount] < 0 } if type == 'withdrawals'
    transactions.reverse! if direction == 'desc'
    transactions
  end
end
