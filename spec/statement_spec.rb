require 'statement'

describe Statement do
  let(:transactions) { double :transactions }

  let(:balance) { double :balance }

  let(:account) { double :account,
                  balance: balance,
                  transactions: transactions }

  subject(:statement) { described_class.new(account) }

  xdescribe '#print_statement' do
    it 'shows all transactions' do

    end
  end

end
