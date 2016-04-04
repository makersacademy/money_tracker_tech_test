require 'account'

describe 'An Account' do

  describe 'has a balance that' do

    it 'can be altered with deposits' do
      account = Account.new
      account.deposit('10/01/2012', 1000)
      expect(account.balance).to eq(1000)
    end

    xit 'can be altered with withdrawals' do

    end
  end

  describe 'has a statement feature that' do

    it 'prints out a table' do
      account = Account.new
      expect(account.print_statement).to eq('date || credit || debit || balance')
    end
  end
end
