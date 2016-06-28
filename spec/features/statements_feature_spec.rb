feature 'Statements' do
  context 'Deposit money' do
    scenario 'Deposit' do
      deposit_money
      expect(page).to have_content "You have deposit money"
    end

    scenario 'Deposit Nothing' do
      deposit_money(nil)
      expect(page).to have_content "Your deposit has not gone through, you left something blank."
    end
  end

  context 'Withdraw money' do
    scenario 'Withdrawal' do
      withdrawal_money
      expect(page).to have_content "You have withdrawal money"
    end

    scenario 'Withdrawal Nothing' do
      withdrawal_money(nil)
      expect(page).to have_content "Your withdrawal has not gone through, you left something blank."
    end
  end

  context 'Statements' do
    scenario 'See your Statement after deposit and withdrawal' do
      deposit_money(3000)
      withdrawal_money(500)
      click_link("Bank Statement")
      expect(page).to have_content "2500"
      expect(page).to have_content "500"
    end

    scenario 'See your Statement with no deposit and withdrawal' do
      visit("/")
      click_link("Bank Statement")
      expect(page).to have_content "No Bank Statements yet"
    end
  end
end
