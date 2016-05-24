# require 'account'
# require 'transaction'
#
# let(:credit) { double :transaction, amount: 1000, date: '10-01-2012' }
# let(:credit2) { double :transaction, amount: 2000, date: '13-01-2012' }
# let(:debit) { double :transaction, amount: -500, date: '14-01-2012' }
#
# describe 'transact' do
#
#   before(:each) do
#     subject.transact(credit)
#     subject.transact(credit2)
#   end
#
#   it 'records a deposit in transactions history' do
#     expect(subject.transactions).to include(credit)
#   end
#
#   it 'balance is increased by deposited amount ' do
#     expect(subject.balance).to eq 3000
#   end
#
#   describe 'withdrawal' do
#
#     before(:each) do
#       subject.transact(debit)
#     end
#
#     it 'records a withdrawal in transactions history ' do
#       expect(subject.transactions).to include(debit)
#     end
#
#     it 'balance is reduced by withdrawn amount' do
#       expect(subject.balance).to eq 2500
#     end
#   end
#
#   describe 'statement' do
#     # it 'print out correctly formatted statement' do
#     #
#     #   expect(subject.statement).to eq(
#     #   "date || credit || debit || balance
#     #   14/01/2012 || || 500.00 || 2500.00
#     #   13/01/2012 || 2000.00 || || 3000.00
#     #   10/01/2012 || 1000.00 || || 1000.00")
#     #
#     # end
#   end
#
# end
