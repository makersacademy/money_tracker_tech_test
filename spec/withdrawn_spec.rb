require 'withdrawn'

describe Withdrawn do
	subject(:withdrawn) {described_class.new}
	it 'initailizes with an empty array' do
		expect(withdrawn.transactions).to be_empty
	end

	it 'stores a withdrawal transaction' do
		withdrawn.store(10)
		expect(withdrawn.transactions.length).to be > 0
	end

	it 'marks each stored transaction with the date' do
		withdrawn.store(10)
		expect(withdrawn.transactions).to include '04/04/2016'
	end
end
