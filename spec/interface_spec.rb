require './lib/interface'

describe Interface do
  subject(:interface) { described_class.new }
  let(:account) {double(:account) }

  describe '#print' do
    before do
      transactions = [{amount:1000, date:'10/01/2012', balance:1000},
        {amount:-250, date:'13/01/2012', balance: 750}]
      allow(account).to receive(:transactions).and_return(transactions)
    end

    it 'prints the statement in tabular format' do
    expect(interface.print(account)).to eq (
      "date || credit || debit || balance\n"\
      "13/01/2012 || || 250 || 750\n"\
      "10/01/2012 || 1000 || || 1000"\
      )
    end
  end
end
