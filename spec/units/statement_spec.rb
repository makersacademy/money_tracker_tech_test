require 'spec_helper'



describe Statement do
  subject(:statement) { described_class.new }

  dummy_statement = {
    :type=>:deposit,
    :date=>time,
    :transaction=>20,
    :balance=>0,
  }

  describe '#calculate_statement' do
    it 'returns the correct account statement' do
      expect(statement.instance_eval{calculate_statement(20, :deposit, 0)}).to include(dummy_statement)
    end
  end

  describe '#print_statement' do
    it 'prints the statement' do
      allow(statement).to receive(:account_statement).and_return(dummy_statement)
      expect(statement.print_statement).to eq(dummy_statement)
    end
  end
end
