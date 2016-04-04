class Statement
  # is responsible for initiating / recording transactions


  private

  def record_transaction(transaction)
    @transactions << transaction
  end

  def date_formatted(date)
    year = date.year > 9 ? "#{date.year}" : "0#{date.year}"
    month = date.month > 9 ? "#{date.month}" : "0#{date.month}"
    day = date.day > 9 ? "#{date.day}" : "0#{date.day}"
    "#{day}/#{month}/#{year}"
  end

end
