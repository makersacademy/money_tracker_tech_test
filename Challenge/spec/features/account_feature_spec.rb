require 'account'

describe 'An Account' do

  describe 'has a balance that' do

    it 'can be printed out in a statement' do
      account = Account.new
      account.deposit('10/01/2012', 1000)
      expect(account.print_statement).to eq('date || credit || debit || balance
                                             10/01/2012 || 1000.00 || || 1000.00')
    end

    it 'can be altered with deposits' do
      account = Account.new
      account.deposit(1000)
      expect(account.balance).to eq(1000)
    end

    xit 'can be altered with withdrawals' do

    end
  end

end
