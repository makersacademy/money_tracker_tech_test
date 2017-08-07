
describe Account do

  let(:statement) { double(:Statement) }
  let(:transactions) { double(:Transactions) }
  subject(:account) { described_class.new(statement, transactions) }

end
