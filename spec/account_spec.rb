
describe Account do
  let(:transactions_log) { double('transactions log', deposit: 0, withdraw: 0) }
  let(:sum) { 100 }

  subject(:account) { described_class.new(transactions_log) }

  describe 'attributes' do
    context 'balance' do
      it 'will be set to zero' do
        expect(account.balance).to eq(Account::START_BALANCE)
      end
    end
  end

  describe '#deposit' do
    it "will increase the account balance by the arg's value" do
      expect { account.deposit(sum) }.to change { account.balance }.from(Account::START_BALANCE).to(sum)
    end
    it 'records the transaction via the transaction_log class' do
      expect(transactions_log).to receive(:deposit).with(100, 100)
      account.deposit(sum)
    end
  end

  describe '#withdraw' do
    context 'when withdrawl sum is smaller or equal to balance' do
      it "will decrease the account balance by the arg's value" do
        account.deposit(sum)
        expect { account.withdraw(sum) }.to change { account.balance }.from(sum).to(Account::START_BALANCE)
      end
      it 'records the transaction via the transaction_log class' do
        account.deposit(sum)
        expect(transactions_log).to receive(:withdraw).with(0, 100)
        account.withdraw(sum)
      end
    end

    end

  describe '#get_statement' do
    let(:statement_instance) { double('statement', print_it: nil) }

    before do
      allow(Statement).to receive(:new).with(transactions_log).and_return(statement_instance)
    end
    it 'gets a new account history statement' do
      expect(Statement).to receive(:new).with(transactions_log)
      account.get_statement
    end
    it 'prints a new account history statement' do
      expect(statement_instance).to receive(:print_it)
      account.get_statement
    end
  end
end
