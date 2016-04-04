require 'account'

describe Account do
	subject(:account) {described_class.new}
	no_money = "You do not have enough money in your account."
	context 'The account balance is zero' do
		it 'Has a balance of zero' do
			expect(account.balance).to eq(0)
		end

		it 'should throw an error when the client attempts to withdraw money' do
			expect{account.withdraw(1)}.to raise_error no_money
		end
	end	
end