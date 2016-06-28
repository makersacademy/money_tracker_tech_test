
require "account"

describe Account do

  subject(:account){ described_class.new }

  describe 'account balance' do
    context 'it increases the accound balance when money is deposited' do
      it 'increases the account balance by 1000 when 1000 is added' do
        account.deposit(1000)
        expect(account.balance).to eq (1000)
      end
    end
  end

end