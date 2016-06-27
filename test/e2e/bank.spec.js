describe('Bank app', function() {
  beforeEach(function() {
    browser.get('/');
  });

  it('manages the account history', function() {
    expect($('#balance').getText()).toMatch('£0.00');

    $('#link-deposit').click();
    expect(browser.getCurrentUrl()).toMatch('/deposit');
    $('#input-deposit').sendKeys('1000');
    $('#btn-deposit-submit').click();
    expect($('#balance').getText()).toMatch('£1,000.00');

    $('#link-deposit').click();
    expect(browser.getCurrentUrl()).toMatch('/deposit');
    $('#input-deposit').sendKeys('2,000');
    $('#btn-deposit-submit').click();
    expect($('#balance').getText()).toMatch('£3,000.00');

    $('#link-withdrawal').click();
    expect(browser.getCurrentUrl()).toMatch('/withdrawal');
    $('#input-withdrawal').sendKeys('500');
    $('#btn-withdrawal-submit').click();
    expect($('#balance').getText()).toMatch('£2,500.00');

    $('#link-statement').click();
    expect(browser.getCurrentUrl()).toMatch('#/statement');

    var transactions = $$('.transactions .transaction');
    expect(transactions.count()).toEqual(3);

    transactions.get(0, function(row) {
      var columns = row.$$('td');
      expect(columns.get(0).getText()).toEqual('27/06/16');
      expect(columns.get(1).getText()).toEqual('0');
      expect(columns.get(2).getText()).toEqual('500');
      expect(columns.get(3).getText()).toEqual('2500');
    });
    transactions.get(1, function(row) {
      var columns = row.$$('td');
      expect(columns.get(0).getText()).toEqual('27/06/16');
      expect(columns.get(1).getText()).toEqual('2000');
      expect(columns.get(2).getText()).toEqual('0');
      expect(columns.get(3).getText()).toEqual('3000');
    });
    transactions.get(2, function(row) {
      var columns = row.$$('td');
      expect(columns.get(0).getText()).toEqual('27/06/16');
      expect(columns.get(1).getText()).toEqual('1000');
      expect(columns.get(2).getText()).toEqual('0');
      expect(columns.get(3).getText()).toEqual('1000');
    });
  });
});