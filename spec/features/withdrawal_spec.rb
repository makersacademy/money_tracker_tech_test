require 'account'

xdescribe 'User can withdraw money' do
  before(:example) { @account = Account.new }

  context 'if the user has sufficient balance' do
    before { @account.deposit(1000) }

    it 'subtracts the amount from account balance' do
      @account.withdraw(700)
      expect(account.balance).to eq 300
    end
  end
end
