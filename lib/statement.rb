class Statement

  SCREEN_WIDTH = 40

  attr_reader :history

  def initialize(history)
    @history = history
  end

  def monetize(amount)
    amount.to_f.round
  end

  def print_format
    history.each do |transaction|
      require 'pry'; binding.pry
      "#{transaction.date}".ljust(SCREEN_WIDTH) +
      "#{transaction.credit? ? monetize(transaction.amount) : ' '}".ljust(SCREEN_WIDTH/2) +
      "#{transaction.credit? ? ' ' : transaction.amount }".rjust(SCREEN_WIDTH/2) +
      "#{transaction.credit? ? ' ' : transaction.amount }".rjust(SCREEN_WIDTH/2)
    end
  end

  def print_header
    "date ||".ljust(SCREEN_WIDTH) +
    "credit ||".ljust(SCREEN_WIDTH/2) +
    "debit ||".rjust(SCREEN_WIDTH/2) +
    "balance ||".rjust(SCREEN_WIDTH)
  end



end
