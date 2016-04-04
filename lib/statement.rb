class Statement

  attr_reader :information

  def initialize
    @information = {}
  end

  def input(date, amount, balance)
    @information[date] = {amount: amount, balance: balance}
  end

  def print_out
    output = "date || credit || debit || balance \n"
    @information.each do |date, transaction|
      if transaction[:amount] > 0
        output = output + date + " || || " + sprintf("%.2f", transaction[:amount]) + " || " + sprintf("%.2f", transaction[:balance])
      else
        output = output + date + " || " + sprintf("%.2f", -transaction[:amount]) + " || || " + sprintf("%.2f", transaction[:balance])
      end
    end
    output
  end

end
