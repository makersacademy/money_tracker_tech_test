class Interface

  def print(account, type='all')
    output = ["date || credit || debit || balance"]
    transactions = filter(account.transactions, type)
    transactions.reverse_each do | transaction |
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

  def filter(transactions, type)
    return transactions.select { |txn| txn[:amount] > 0 } if type == 'deposits'
    return transactions.select { |txn| txn[:amount] < 0 } if type == 'withdrawals'
    transactions
  end
end
