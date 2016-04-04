require 'account'

describe Account do
  let(:printer){ double 'printer'}
  subject(:account){ described_class.new(printer)}

  describe 'initialised' do
    it 'an account is created with 0 in balance' do
      expect(account.balance).to eq(0)
    end
  end

  describe '#deposit' do
    it 'making a deposit adds to the balance' do
      account.deposit(500, '10-01-2012')
      expect(account.balance).to eq(500)
    end
  end

  describe '#withdraw' do
    it 'making a withdraw removes money from the balance' do
      account.deposit(500, '10-01-2012')
      account.withdraw(200, '11-01-2012')
      expect(account.balance).to eq(300)
    end
  end

  describe '#add_to_statement' do
    it 'an account is opened with an empty statment' do
      expect(account.show_statement.length).to eq(0)
    end

    it 'making a deposit adds to the stament' do
      statement_example = {date: '10-01-2012',debit: nil, credit: 500.00, balance: 500}
      account.deposit(500, '10-01-2012')
      expect(account.show_statement).to include(statement_example)
    end

    it 'making a withdraw adds to the statment' do
      statement_example = {date: '11-01-2012', credit: nil, debit: 500.00, balance: 0}
      account.deposit(500, '10-01-2012')
      account.withdraw(500, '11-01-2012')
      expect(account.show_statement).to include(statement_example)
    end
  end

  describe '#print_statement' do
    it 'sends the statements to the printer' do
      account.deposit(500, '10-01-2012')
      allow(printer).to receive(:print_statement)
      expect(printer).to receive(:print_statement)
      account.print_statement(:ascending)
    end
  end
end
