require 'bank'

describe 'Bank' do
  subject(:bank) { Bank.new("Sarah") }


  describe 'initialisation' do
    it 'should have a name' do
      expect(bank.name).to eq("Sarah")
    end

    it 'has an empty transactions history' do
      expect(bank.transactions).to eq([{:date=>"Beginning Balance", :amount=>0}])
    end
  end

  describe 'debit an account ' do
      it { is_expected.to respond_to(:debit).with(2).arguments }

      it 'should debit the account' do
        bank.debit("12012015", 100)
        expect(bank.transactions).to eq([{:date=>"Beginning Balance", :amount=>0},{date: "12012015", amount: -100}])
      end
  end

  describe 'credit an account' do
    it { is_expected.to respond_to(:credit).with(2).arguments }

    it 'should credit the account' do
      bank.credit("1203014", 200)
      expect(bank.transactions).to eq([{:date=>"Beginning Balance", :amount=>0},{date: "1203014", amount: 200}])
    end
  end

  # xdescribe 'add_transaction' do
  #   it 'should start with a balance of 0' do
  #   expect(bank.add_transaction).to eq(0)
  # end



end
