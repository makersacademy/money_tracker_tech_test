class Statement

  attr_reader :information

  def initialize
    @information = {}
  end

  def input(date, amount)
    @information[date] = amount
  end

  def print_out
    output = "date || credit || debit || balance \n"
    @information.each do |date, amount|
      if amount > 0
        output = output + date + " || || " + sprintf("%.2f", amount) + " || " + sprintf("%.2f", amount)
      else
        output = output + date + " || " + sprintf("%.2f", -amount) + " || || " + sprintf("%.2f", amount)
      end
    end
    output
  end

end
