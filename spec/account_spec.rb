require 'account.rb'

describe Account do
	subject(:account) {described_class.new}

	it "starts with a balance of 0" do
		expect(account.balance).to eq 0
	end

	it "adds to balance correctly after a deposit is made" do
		account.deposit(100)
		expect(account.balance).to eq 100
	end

	it "deducts from balance correctly after a deposit is made" do
		account.deposit(100)
		account.withdraw(20)
		expect(account.balance).to eq 80
	end
end