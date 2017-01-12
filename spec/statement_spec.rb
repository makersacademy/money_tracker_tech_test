require 'spec_helper'

describe Statement do
  it 'prints out a statement' do
    subject.deposit(100)
    subject.withdraw(50)
    expect { subject.print_statement }.to output('100').to_stdout
  end
end
