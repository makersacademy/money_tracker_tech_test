require 'account.rb'

describe Account do
	subject(:account) {described_class.new}
	
	it "starts with a balance of 0" do
		expect(account.balance).to eq 0
	end
end