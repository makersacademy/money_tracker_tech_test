require 'bank'

describe Bank do 

	subject(:bank) { described_class.new }
	let(:statement) { double :statement }
	let(:transaction) { double :transaction }

	describe 'initialize' do

		it 'with an instance of a statement' do
			allow(Statement).to receive(:new).and_return(statement)
			expect(bank.statement).to eq statement
		end

		it 'with the Transaction class' do
			expect(bank.transaction).to eq Transaction
		end

	end	

	describe '#make_deposit' do

		it 'creates an instance of Transaction and calls the type_credit method ' do			
			allow(Transaction).to receive(:new).and_return(transaction)
			expect(bank.transaction.new).to receive(:type_credit)
      bank.make_deposit(1000)
		end

	end

	
end