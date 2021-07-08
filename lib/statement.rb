class Statement

  attr_reader :history, :account, :title

  def initialize(account)
    @account = account
    @title = "date || credit || debit || balance\n"
  end

  def print_out
    @history.each do |entry|
      entry[:date].to_s + entry[:amount].to_s + entry[:balance].to_s + "\n"
    end
    print @title
    print @history
  end

  def add_history(account)
    @history = account.statement_history
  end

end