require 'account.rb'

describe Account do
	subject(:account) {described_class.new}

	it "starts with a balance of 0" do
		expect(account.balance).to eq 0
	end

	it "changess balance correctly after a deposit is made" do
		expect(account.deposit(100)).to eq 100
	end
end