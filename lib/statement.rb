class Statement
  def display(date, type, amount, balance)
    puts construct(date, type, amount, balance)
  end

  private

  def construct(date, type, amount, balance)
    string = []
    string[0] = date.strftime('%d/%m/%Y')
    string[1] = amount if type == :credit
    string[2] = amount if type == :debit
    string[3] = balance
    string.join(" || ")
  end
end
