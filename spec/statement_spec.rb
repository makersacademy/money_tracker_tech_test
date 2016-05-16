require 'statement'

describe Statement do 

	subject(:statement) { described_class.new }
	#let(:transaction) { double :transaction }

	describe '#initialize' do

		it 'has a balance of zero' do
			expect(statement.balance).to eq(0)
		end

		it 'has a transactions array that is empty' do
			expect(statement.transactions).to be_empty
		end

	end
	
end