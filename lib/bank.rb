class Bank

  attr_reader :statement

  def initialize(statement_class: Statement)
    @statement_class = statement_class
  end

  def print_statement(account)
    history = account.history
    @statement_class.new.format_transaction(history)
  end
end
