require 'account'
describe Account do
  let(:account) {described_class.new}
  describe '#balance' do
    it 'should know the balance' do
      expect(account.balance).to be_a(Integer)
    end
  end
  describe '#statement' do
    it {is_expected.to respond_to(:statement)}
  end
end