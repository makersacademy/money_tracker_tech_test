require 'transaction_history'

describe TransactionHistory do
  subject(:history) { described_class.new }
  let(:transaction) { double(:transaction) }
end
