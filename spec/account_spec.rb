describe Account do

  let(:transaction_class){ double :transaction_class, new: transaction }
  let(:transaction){ double :transaction }
  subject(:account){ described_class.new(transaction_class) }


  context 'initialization' do

    it 'initializes with a balance of 0' do
      expect(account.balance).to eq 0
    end

    it 'has an array of transactions' do
      expect(account.transactions).to be_a Array
    end

  end

  context 'deposits' do
    it 'creates a transaction when depositing' do
      expect(account.transaction_class).to receive(:new)
      account.deposit(1000)
    end

    it 'adds a transaction to list of transactions' do
      expect{ account.deposit(1000) }.to change{ account.transactions.length }.by 1
    end
  end

  context 'withdrawals' do

  end

  context 'printing statements' do

    it 'prints a statement' do
      expect(account).to respond_to :print_statement
    end

  end

end
