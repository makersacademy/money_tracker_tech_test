class Statement

  def show(transaction)
    string = "date || credit || debit || balance"
    transaction.reverse.each do |details|
      if details[:amount] > 0
        string << "\n#{details[:date]} || #{sprintf "%.2f", details[:amount]} || || #{sprintf "%.2f", details[:balance]}"
      else
        string << "\n#{details[:date]} || || #{sprintf "%.2f", details[:amount].abs} || #{sprintf "%.2f", details[:balance]}"
      end
    end
    puts string
  end

end
