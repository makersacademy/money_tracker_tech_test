class Interface

  def print(account)
    output = ["date || credit || debit || balance"]
    account.transactions.reverse_each do | transaction |
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
end
