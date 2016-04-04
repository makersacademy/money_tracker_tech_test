class Statement

  def print_statement(transactions)
    # print ("#{transactions[0].join('||')}\n" "#{transactions[1].join('||')}\n" "#{transactions[2].join('||')}\n" "#{transactions[3].join('||')}\n")
    transactions.each do |x|
      return "#{x.join('||')}\n"
    end
  end

end
