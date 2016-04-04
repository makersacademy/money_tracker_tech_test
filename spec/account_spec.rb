require 'account'

describe Account do

  describe '#new' do

    it 'initialises with a balance of zero' do
      expect(subject.balance).to eq 0
    end

  end

  context 'updating the balance' do

    it 'makes a deposit' do
      subject.deposit(10)
      expect(subject.balance).to eq 10
    end

    it 'makes a withdrawal' do
      subject.deposit(30)
      subject.withdraw(10)
      expect(subject.balance).to eq 20
    end
  end

  context 'recording entries' do

    it 'records the balance as an account entry' do
      subject.deposit(10)
      expect(subject.history).to include(include(10))
    end

    it 'records the date as an account entry' do
      subject.deposit(10)
      expect(subject.history).to include(include(Time.now.strftime("%d/%m/%Y")))
    end

    it 'records the balance as an account entry' do
      subject.deposit(30)
      subject.withdraw(20)
      subject.deposit(100)
      expect(subject.history).to include(include(110))
    end

  end

  context 'printing the statement' do

    it 'prints a statement' do
      subject.deposit(30)
      expect { subject.print_statement }.to output("date || credit || debit || balance\n#{Time.now.strftime("%d/%m/%Y")} || 30.00 || || 30.00\n").to_stdout
    end

  end
end
