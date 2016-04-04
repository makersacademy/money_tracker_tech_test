class Statement

  SCREEN_WIDTH = 5

  attr_reader :latest_history, :headers

  def initialize(latest_history)
    @latest_history = latest_history
    @headers = ["date", "credit", "debit", "balance"]
  end


  def full_print_statement
    formatter(headers) + "\n" + extract_info.join("\n")
  end

  def extract_info
    info_array = []
    latest_history.each do |transaction|
      info_array << [transaction.date.strftime("%F"),
                       transaction_type_sorter(transaction),
                       monetize(transaction.client_balance)]
    end
    info_array.map! {|transaction_data| formatter(transaction_data.flatten!)}
  end

  def formatter(array)
    formatted_string = ''
    array.each_with_index do |element, index|
      if index <= 1
        formatted_string << element.ljust(SCREEN_WIDTH * (index + 1 * 2))
      else
        formatted_string << element.rjust(SCREEN_WIDTH * (index + 1 / 2))
      end
    end
    formatted_string
  end

  def transaction_type_sorter(transaction)
    credit?(transaction.type) ? [monetize(transaction.amount), ' '] : [' ', monetize(transaction.amount)]
  end

  def credit?(transaction_type)
    transaction_type == :credit
  end

  def monetize(amount)
    sprintf('%.2f', amount)
  end

end
