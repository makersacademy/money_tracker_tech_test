require "statement"

describe Statement do

  subject(:statement){ described_class.new(account) }

  let(:account) {double :account, :balance => 0}

  describe 'printing account statement history' do
    context 'it initializes with an account that has a balance of 0' do
      it 'initializes with an account balance of 0' do
        expect(statement.account.balance).to eq (0)
      end
    end
  end
end