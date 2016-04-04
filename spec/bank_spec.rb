require 'bank'

describe 'Bank' do
  let(:bank) { Bank.new }

  context 'debit an account ' do
      it { is_expected.to respond_to(:debit).with(2).arguments }

      it 'should debit the account' do
        bank.debit("12012015", -100)
        expect(bank.add_transaction). to eq(-100)
      end
  end

  context 'credit an account' do
    it { is_expected.to respond_to(:credit).with(2).arguments }

    it 'should credit the account' do
      bank.credit("12032014", 200)
      expect(bank.credit).to eq(200)
    end
  end

  describe 'add_transaction' do
    it 'should start with a balance of 0'
    expect(bank.add_transaction).to eq(0)
  end

end
