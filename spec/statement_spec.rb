require 'statement.rb'

describe Statement do
	subject(:statement) {described_class.new}

	it "formats numbers correctly" do
		expect(statement.format(20)).to eq "20.00"
	end
end