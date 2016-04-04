require_relative 'account'

class Bank

  attr_reader :accounts

  def initialize
    @accounts = []
  end

  def create_account
    @account = Account.new
    @accounts.push(@account)
  end
end
