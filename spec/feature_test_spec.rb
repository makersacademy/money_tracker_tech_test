describe 'Bank test' do

  let(:bank) { Bank.new }

  context 'debit an account ' do

      it 'allows a user to withdraw money' do
        # bank.debit(date, amount)
        expect(bank).to receive(:debit).and_return true
      end

  end

  context 'credit an account' do
  end

end
