require 'account'
describe Account do
  let(:deposit) {double(:deposit, amount:nil, name:nil, date:nil)}
  let(:deposit_klass) {double(:deposit_class, new: deposit) } 
  let(:args) {{deposit_class:deposit_klass}}
  let(:start_balance) {Account::STARTBALANCE}
  let(:account) {described_class.new(args)}

  before :each do

  end

  describe '#initialize' do  
    it 'should initialize with the STARTBALANCE' do
      expect(account.check_balance).to eq(start_balance)
    end
  end

  describe '#check_balance' do
    it 'should return the balance' do
      expect(account.check_balance).to be_a(Integer)
    end
  end
  
  describe '#statement' do

    it 'should be an array' do
      expect(account.statement).to be_a(Array)
    end

    it 'it should include a deposit object' do
      account.deposit(100)
      expect(account.statement.first).to include(deposit)
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