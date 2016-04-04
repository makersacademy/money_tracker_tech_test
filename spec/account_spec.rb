require 'account.rb'

  describe  Account do
    before :each do
      @account = Account.new
  end

  describe '#initialize' do
    it 'instantiates a zero balance for the account' do
      expect(@account.balance).to eql(0)
    end
    it 'instantiates a transactions array names' do
      expect(@account.transactions).to eql([["Date", "Credit", "Debit", "Balance"]])
    end
  end

  describe '#deposit' do
    it 'allows a customer to place money in an account' do
      @account.deposit(5, "04/04/2016")
      expect(@account.balance).to eql(5)
    end
    it 'applies depo amount to @transactions' do
      @account.deposit(4, "04/04/2016")
      expect(@account.transactions).to eql([["Date", "Credit", "Debit", "Balance"],["#{@account.date}", "4.00", " ", "#{sprintf "%.2f", @account.balance}"]])
    end
  end

  describe '#withdraw' do
    it 'allows a customer to withdraw moneys from account'do
      @account.withdraw(3, @date)
      expect(@account.balance).to eql(-3)
    end
    it 'applies correct amount to @transactions' do
      @account.withdraw(3, "04/04/2016")
      expect(@account.transactions).to eql([["Date", "Credit", "Debit", "Balance"],["#{@account.date}", " ", "3.00", "#{sprintf "%.2f", @account.balance}"]])
    end
  end

  describe '#date' do
    it 'creates a date' do
      expect(@account.date).to eql("04/04/2016")
    end
  end


end
