require 'withdrawn'

describe Withdrawn do
	subject(:withdrawn) {described_class.new}
	it 'initailizes with an empty array' do
		expect(withdrawn.transactions).to be_empty
	end
end
