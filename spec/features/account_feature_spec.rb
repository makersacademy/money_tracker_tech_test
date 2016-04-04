require 'client'
require 'transaction'
# require 'account'
# require 'statement'

# **Given** a client makes a deposit of 1000 on 10-01-2012
# **And** a deposit of 2000 on 13-01-2012
# **And** a withdrawal of 500 on 14-01-2012
# **When** she prints her bank statement
# **Then** she would see

describe 'bank features' do
  let(:client) {Client.new(0)}

  context 'making a deposit' do

    it 'allows the client to make a deposit into their bank account' do
      expect{client.deposit(1000)}.to change{client.balance}.from(0).to(1000)
    end

    # it 'records the date of the deposit' do
    #   client.deposit(1000)
    #   expect(client.show_statement).to change{client.balance}.from(0).to(1000)
    # end

  end
end
