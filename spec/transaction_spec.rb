describe Transaction do

  let(:transaction){described_class.new(1000, 'deposit', '10-01-2012', 0)}

  context 'on initialization' do

    it 'is initialized with an amount' do
      expect(transaction.amount).to eq 1000
    end

    it 'is initialized with a type' do
      expect(transaction.type).to eq 'deposit'
    end

    it 'is initialized with a date' do
      expect(transaction.date).to eq '10-01-2012'
    end

    it 'is initialized with a starting balance' do
      expect(transaction.start_balance).to eq 0
    end

    context 'a deposit' do

      it 'has an end balance which is the starting balance plus the end balance' do
        expect(transaction.end_balance).to eq 1000
      end

    end

  end

end
