require 'statement.rb'

  describe  Account do
    before :each do
      @statement = Statement.new
      @account = Account.new
      @account.deposit(5, "04/04/2016")
      @account.deposit(10, "04/04/2016")
      @account.withdraw(6, "04/04/2016")
  end

  describe '#print_statement' do
    it 'prints out the account statement' do
      @statement.print_statement(@account.transactions)
    end
  end

end
