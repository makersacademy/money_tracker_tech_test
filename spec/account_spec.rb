describe Account do

  let(:deposit_class){ double :deposit_class, new: deposit }
  let(:withdrawal_class){ double :withdrawal_class, new: withdrawal }
  let(:deposit){ double(:deposit, date: "16/05/2016", amount: 1000) }
  let(:withdrawal){ double :withdrawal, amount: -500 }
  subject(:account){ described_class.new(deposit_class, withdrawal_class) }


  context 'initialization' do

    it 'initializes with a balance of 0' do
      expect(account.balance_at_transaction).to eq 0
    end

    it 'has an array of transactions' do
      expect(account.transactions).to be_a Array
    end

    it 'can keep track of the current balance' do
      account.deposit(1000)
      account.withdraw(500)
      allow(account).to receive(:transactions){ [deposit, withdrawal] }
      expect(account.balance_at_transaction(1)).to eq 500
    end

  end

  context 'deposits' do
    it 'creates a transaction when depositing' do
      expect(account.deposit_class).to receive(:new)
      account.deposit(1000)
    end

    it 'adds a transaction to list of transactions' do
      expect{ account.deposit(1000) }.to change{ account.transactions.length }.by 1
    end


  end

  context 'withdrawals' do
    it 'creates a transaction when withdrawing' do
      expect(account.withdrawal_class).to receive(:new)
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
      allow(account).to receive(:transactions){ [deposit] }
      expect(account.print_statement).to include("16/05/2016 || 1000 || 1000")
    end

  end

end
