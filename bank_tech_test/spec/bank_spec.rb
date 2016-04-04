require 'account'

describe Account do
  subject(:account) {described_class.new}

  describe 'balance' do
    it 'balance starts at 0' do
      expect(account.account_balance).to eq 0
    end
  end

  describe 'deposit' do
    it 'can be made' do
      account.make_deposit(100)
      expect(account.account_balance).to eq(100)
    end
  end

  describe 'withdrawal' do
    it 'can be made' do
      account.make_deposit(200)
      account.make_withdrawal(100)
      expect(account.account_balance).to eq(100)
    end
  end

  describe 'account balance' do
    it 'can be viewed' do
      account.make_deposit(400)
      account.make_deposit(100)
      account.make_withdrawal(35)
      expect(account.account_balance).to eq(465)
    end

    it 'can be printed' do
      account.make_deposit(400)
      account.make_deposit(100)
      account.make_withdrawal(35)
      expect(account.print_statement).to eq [{:date=>"04/04/2016", :credit=>400, :balance=>400}, {:date=>"04/04/2016", :credit=>100, :balance=>500}, {:date=>"04/04/2016", :debit=>35, :balance=>465}]
    end
  end

  describe 'date' do
    it 'is attached to statement' do
      account.make_deposit(400)
      expect(account.account_statement).to eq [{:date=>"04/04/2016", :credit=>400, :balance=>400}]
    end
  end

  describe 'filter' do
    it 'can show only deposits' do
      account.make_deposit(400)
      account.make_deposit(100)
      account.make_withdrawal(35)
      expect(account.show_only_deposits).to include(400, 100)
    end

    it 'can show only withdrawals' do
      account.make_withdrawal(400)
      account.make_deposit(100)
      account.make_withdrawal(35)
      expect(account.show_only_withdrawals).to include(400, 35)
    end
  end
end
