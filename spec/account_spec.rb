describe Account do

  let(:transaction_class){ double :transaction_class, new: transaction }
  let(:transaction){ double(:transaction, date: "16/05/2016", amount: 1000) }
  let(:transaction2){ double :transaction, amount: -500 }
  subject(:account){ described_class.new(transaction_class) }


  context 'initialization' do

    it 'initializes with a balance of 0' do
      expect(account.balance).to eq 0
    end

    it 'has an array of transactions' do
      expect(account.transactions).to be_a Array
    end

    it 'can keep track of the current balance' do
      account.deposit(1000)
      account.withdraw(500)
      allow(account).to receive(:transactions){ [transaction, transaction2] }
      expect(account.balance).to eq 500
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
    it 'creates a transaction when withdrawing' do
      expect(account.transaction_class).to receive(:new)
      account.withdraw(500)
    end

    it 'adds a transaction to list of transactions' do
      expect{ account.withdraw(500) }.to change{ account.transactions.length }.by 1
    end
  end

  context 'printing statements' do

    it 'prints column headers of a statement' do
      expect(account.print_statement).to include("date || credit || debit || balance")
    end

    it 'prints a row of a statement' do
      allow(account).to receive(:transactions){ [transaction] }
      expect(account.print_statement).to include("16/05/2016 || 1000 || 1000")
    end

  end

end
