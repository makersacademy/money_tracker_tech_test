

describe Account do

  let(:account){ described_class.new }

  context 'on initialization' do

    it 'initializes with a balance of zero' do
      expect(account.balance).to eq 0
    end

    it 'initializes with an empty account history' do
      expect(account.history).to be_empty
    end


  end


end
