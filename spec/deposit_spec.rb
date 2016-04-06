require 'deposit'

describe Deposit do

  subject(:deposit) { described_class.new }

  it 'can responds to #create' do
    expect(deposit).to respond_to(:create)
  end

end
