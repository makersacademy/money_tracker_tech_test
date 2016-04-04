require 'client'
require 'account'
require 'transaction'
require 'statement'

# **Given** a client makes a deposit of 1000 on 10-01-2012
# **And** a deposit of 2000 on 13-01-2012
# **And** a withdrawal of 500 on 14-01-2012
# **When** she prints her bank statement
# **Then** she would see

describe 'bank features' do
  let(:client) {Client.new}

  context 'making a deposit of 1000' do

    before do
      Timecop.freeze(Time.local(2012, 01, 10, 13, 05))
    end

    after do
      Timecop.return
    end

    it 'allows the client to make a deposit into their bank account' do
      client.deposit(1000)
      expect(client.account.balance).to eq(1000)
    end

    it 'records the date of the deposit' do
      client.deposit(1000)
      expect(client.account.history[0].date).to eq(Time.now)
    end

  end

  context 'making a second deposit of 2000' do

    before do
      Timecop.freeze(Time.local(2012, 01, 10, 13, 05))
    end

    after do
      Timecop.return
    end

    it 'allows the client to make a deposit into their bank account' do
      client.deposit(1000)
      Timecop.return
      Timecop.freeze(Time.local(2012, 01, 13, 13, 05))
      client.deposit(2000)
      expect(client.account.balance).to eq(3000)
    end

    it 'records the date of the deposit' do
      client.deposit(1000)
      Timecop.return
      Timecop.freeze(Time.local(2012, 01, 13, 13, 05))
      client.deposit(2000)
      expect(client.account.history[1].date).to eq(Time.now)
    end

  end

  context 'making a withdrawal' do

    before do
      Timecop.freeze(Time.local(2012, 01, 10, 13, 05))
    end

    after do
      Timecop.return
    end

    it 'allows the client to make a withdrawal from their bank account' do
      client.deposit(1000)
      Timecop.return
      Timecop.freeze(Time.local(2012, 01, 13, 13, 05))
      client.deposit(2000)
      Timecop.return
      Timecop.freeze(Time.local(2012, 01, 14, 13, 05))
      client.withdraw(500)
      expect(client.account.balance).to eq(2500)
    end

  end

  context 'viewing your balance' do

    before do
      Timecop.freeze(Time.local(2012, 01, 10, 13, 05))
    end

    after do
      Timecop.return
    end

    it 'allows the client view their bank statement' do
      client.deposit(1000)
      Timecop.return
      Timecop.freeze(Time.local(2012, 01, 13, 13, 05))
      client.deposit(2000)
      Timecop.return
      Timecop.freeze(Time.local(2012, 01, 14, 13, 05))
      client.withdraw(500)
      client.show_statement
      expect{client.show_statement(:descending)}.to output( "date      credit              debit        balance\n2012-01-101000.00                          1000.00\n2012-01-132000.00                          3000.00\n2012-01-14                   500.00        2500.00\n").to_stdout
    end

  end
end
