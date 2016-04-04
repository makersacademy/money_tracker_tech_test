require 'spec_helper'

describe Account do
  subject(:account) {described_class.new}

  describe '#withdraw' do
    it 'allows user to withdraw funds' do
      expect{account.withdraw_funds(20)}.to change{account.balance}.by(-20)
    end
  end

  describe '#deposit' do
    it 'allows a user to deposit funds' do
      expect{account.deposit_funds(20)}.to change{account.balance}.by(20)
    end
  end

  describe '#calculate_statement' do
    it 'returns the correct account statement' do
      dummy_statement = {
      :date => "04/04/2016",
      :transaction => 20,
      :balance => 0,
    }
      expect(account.calculate_statement(20)).to include(dummy_statement)
    end
  end
end
