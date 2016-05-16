require 'account'
describe Account do
  let(:start_balance) {Account::STARTBALANCE}
  let(:account) {described_class.new}
  
  it 'should initialize with the STARTBALANCE' do
    expect(account.check_balance).to eq(start_balance)
  end

  describe '#check_balance' do
    it 'should return the balance' do
      expect(account.check_balance).to be_a(Integer)
    end
  end
  
  describe '#statement' do
    it {is_expected.to respond_to(:statement)}

    it 'should be an array' do
      expect(account.statement).to be_a(Array)
    end
  end

  describe '#desposit' do
    it 'should add money to balance' do
      expect{account.deposit(100)}.to change{account.check_balance}.by(100)
    end
  end

  describe '#withdraw' do
    it 'should add money to balance' do
      expect{account.withdraw(50)}.to change{account.check_balance}.by(-50)
    end
  end
end