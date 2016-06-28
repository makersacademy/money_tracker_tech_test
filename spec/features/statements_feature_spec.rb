feature 'accounts' do
  context 'Deposit & Withdraw money' do
    scenario 'Deposit' do
      deposit_money
      expect(page).to have_content "You have deposit money"
    end

    scenario 'Deposit Nothing' do
      deposit_money(nil)
      expect(page).to have_content "Your deposit has not gone through, you left something blank."
    end

    scenario 'Withdrawal' do
      withdrawal_money
      expect(page).to have_content "You have withdrawal money"
    end

    scenario 'Withdrawal Nothing' do
      withdrawal_money(nil)
      expect(page).to have_content "Your withdrawal has not gone through, you left something blank."
    end
  end
end
