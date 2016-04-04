class History

  def initialize
    @history_array = []
  end

  def receive_entry(item)
    @history_array << item
  end

  def unfiltered_history
    @history_array.clone
  end

  def standard_statement
    statement = @history_array.map {|item| "#{item[:date]} || #{item[:deposit]} || #{item[:withdrawal]} || #{item[:balance]}"}
    statement.unshift("Date || Credit || Debit || Balance")
  end


end
