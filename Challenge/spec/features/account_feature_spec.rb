require 'account'

describe 'An Account' do

  describe 'has a balance that' do

    xit 'can be printed out' do

    end

    it 'can be altered with deposits' do
      account.deposit(1000)
      expect(account.balance).to eq(1000)
    end

    xit 'can be altered with withdrawals' do

    end
  end

end
