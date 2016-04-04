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

  describe 'calculating the balance' do
    it 'should work out the balance based on 2 credit transactions' do
      bank.credit("23032015", 500)
      bank.credit("06022016", 100)
      expect(bank.balance).to eq(600)
    end

    it 'should work out the balance based on debit and credit transactions' do
      bank.credit("23032015", 500)
      bank.debit("06022016", 100)
      expect(bank.balance).to eq(400)
    end
  end

end
