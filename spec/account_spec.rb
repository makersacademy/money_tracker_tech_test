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
end
