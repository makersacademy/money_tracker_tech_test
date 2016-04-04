require_relative "../../lib/Account.rb"

describe Account do

	subject(:account) { described_class.new }
	let(:date) { '04/04/2016' }

	describe '#balance' do 
		it 'returns the current balance' do 
			expect(account.balance).to eq 0.00
		end
	end

	context 'modifying balance' do

		before { account.deposit(500.00, date) }

		describe '#deposit' do 

			let(:deposit_history) { {
															date: date,
															credit: 500.00,
															debit: nil,
															balance: 500.00	
															} }

			it 'increases balance' do
				expect(account.balance).to eq 500.00
			end
			it 'adds transaction' do 
				expect(account.transaction_history).to include deposit_history
			end
		end

		describe '#withdraw' do 

			let(:withdrawal_history) { {
															date: date,
															credit: nil,
															debit: 200.00,
															balance: 300.00	
															} }

			before { account.withdraw(200.00, date) }

			it 'reduces balance' do 
				expect(account.balance).to eq 300.00
			end
			it 'does not allow transactions that would take balance below 0' do 
				expect{account.withdraw(1000.00, date)}.to raise_error 'Balance too low'
			end
			it 'adds transaction' do 
				expect(account.transaction_history).to include withdrawal_history
			end
		end

	end

	describe '#print_statement' do

		let(:statement) { 
											'date || credit || debit || balance' + "\n" +
											'14/01/2012 || || 500.00 || 2500.00' + "\n" +
											'13/01/2012 || 2000.00 || || 3000.00' + "\n" +
											'10/01/2012 || 1000.00 || || 1000.00' 
										}

		before do
			account.deposit(1000.00, '10/01/2012')
			account.deposit(2000.00, '13/01/2012')
			account.withdraw(500.00, '14/01/2012')
		end

		it 'should print out transactions in human-readable form' do

			expect(STDOUT).to receive(:puts).with(statement)
			account.print_statement
		end

	end

end