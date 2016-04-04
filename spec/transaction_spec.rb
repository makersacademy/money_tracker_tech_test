describe Transaction do

  let(:transaction_deposit){described_class.new(1000, 'deposit', '10-01-2012', 0)}
  let(:transaction_withdrawl){described_class.new(500, 'withdrawl', '14-01-2012', 1000)}

  context 'on initialization' do

    it 'is initialized with an amount' do
      expect(transaction_deposit.amount).to eq 1000
    end


    it 'is initialized with a date' do
      expect(transaction_deposit.date).to eq '10-01-2012'
    end

    it 'is initialized with a starting balance' do
      expect(transaction_deposit.start_balance).to eq 0
    end

    context 'a deposit' do

      it 'is initialized with a type deposit' do
        expect(transaction_deposit.type).to eq 'deposit'
      end

      it 'has an end balance which is the starting balance plus the amount' do
        expect(transaction_deposit.end_balance).to eq 1000
      end

    end

    context 'a withdrawl' do

      it 'is initialized with a type' do
        expect(transaction_withdrawl.type).to eq 'withdrawl'
      end

      it 'has an end balance which is the starting balance minus the amount' do
        expect(transaction_withdrawl.end_balance).to eq 500
      end

    end

  end

end
