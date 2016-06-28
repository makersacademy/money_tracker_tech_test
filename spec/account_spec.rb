
require "account"

describe Account do

  subject(:account){ described_class.new }

  describe 'account balance' do
    context 'it increases the account balance when money is deposited' do
      it 'increases the account balance by 1000 when 1000 is added' do
        account.deposit(1000)
        expect(account.balance).to eq (1000)
      end
    end

    context 'it decreases the account balance when money is withdrawn' do
      it 'decreases the account balance by 500 when 500 is added' do
        account.deposit(1000)
        account.deposit(2000)
        account.withdraw(500)
        expect(account.balance).to eq (2500)
      end
    end

    context 'it raises an error if balance will go below 0' do
      it "gives a message action couldn't be completed if balance would go below 0" do
        account.deposit(1000)
        expect{ account.withdraw(1500) }.to raise_error "action couldn't be completed, not enough funds available"
      end
    end
  end

end