require 'account'

describe Account do

    it 'responds to #deposit accepting one argument' do
      expect(subject).to respond_to(:deposit).with(1).argument
    end

    it 'responds to #balance' do
      expect(subject).to respond_to(:balance)
    end

end
