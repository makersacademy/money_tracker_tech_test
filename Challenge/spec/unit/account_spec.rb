require 'account'

describe Account do

    it 'can return the funds currently in the account' do
      expect(subject.balance).to eq(0)
    end

    it 'can accept deposits that increase the #balance' do
      subject.deposit(1000)
      expect(subject.balance).to eq(1000)
    end
end
