require 'spec_helper'

describe Account do
  subject(:account) {described_class.new}
  dummy_statement = {
    :type=>:deposit,
    :date=>"04/04/2016",
    :transaction=>20,
    :balance=>0,
  }

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
      expect(account.calculate_statement(20, :deposit)).to include(dummy_statement)
    end
  end

  describe '#print_statement' do
    it 'prints the statement' do
      account.account_statement = dummy_statement
      expect(account.print_statement).to eq(dummy_statement)
    end
  end
end
