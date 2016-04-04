

describe Account do

  let(:account){ described_class.new }

  context 'on initialization' do


    it 'initializes with a balance of zero' do
      expect(account.balance).to eq 0
    end


  end


end
