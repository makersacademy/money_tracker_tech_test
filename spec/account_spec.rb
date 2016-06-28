
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

  describe 'account statement' do
    context 'it stores the account history of a deposit' do
      it 'records the account history of the deposit as date, amount, balance' do
        action_time = Time.local(2012,1,10)
        allow(Time).to receive(:now).and_return(action_time)
        account.deposit(1000)
        expect(account.statement_history).to eq [{date: Time.now, amount: 1000, balance: 1000}]
      end
    end

    context 'it stores the account history of a withdrawal' do
      it 'records the account history of the withdrawal as date, amount, balance' do
        action_time = Time.local(2012,1,14)
        allow(Time).to receive(:now).and_return(action_time)
        account.deposit(1000)
        account.statement_history.pop
        account.withdraw(500)
        expect(account.statement_history).to eq [{date: Time.now, amount: 500, balance: 500}]
      end
    end
  end

end