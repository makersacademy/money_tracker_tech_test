require 'app'

describe App do
  it 'prints a menu' do
    expect(STDOUT).to receive(:puts).with("\nWelcome to Your Bank".center(70),
                                          "-------------".center(70),
                                          "1. " + Rainbow("View balance").underline.bright,
                                          "2. " + Rainbow("View transactions").underline.bright,
                                          "3. " + Rainbow("Deposit").underline.bright,
                                          "4. " + Rainbow("Withdraw").underline.bright,
                                          "9. " + Rainbow("Exit").red.underline.bright)
    subject.print_menu
  end
end
