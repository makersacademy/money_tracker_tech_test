describe('Bank app', function() {
  beforeEach(function() {
    browser.get('/');
  });

  it('manages the account history', function() {

    $('#link-deposit').click();
    $('#input-deposit').sendKeys('1000');
    $('#btn-deposit-submit').click();

    $('#link-deposit').click();
    $('#input-deposit').sendKeys('2,000');
    $('#btn-deposit-submit').click();

    $('#link-withdrawal').click();
    $('#input-withdrawal').sendKeys('500');
    $('#btn-withdrawal-submit').click();

    $('#link-statement').click();

    var transactions = $$('.transactions .transaction');
    expect(transactions.count()).toEqual(3);

    transactions.get(0, function(row) {
      var columns = row.$$('td');
      expect(columns.get(1).getText()).toEqual('1000');
      expect(columns.get(2).getText()).toEqual('0');
      expect(columns.get(3).getText()).toEqual('1000');
    });
    transactions.get(1, function(row) {
      var columns = row.$$('td');
      expect(columns.get(1).getText()).toEqual('2000');
      expect(columns.get(2).getText()).toEqual('0');
      expect(columns.get(3).getText()).toEqual('3000');
    });
    transactions.get(2, function(row) {
      var columns = row.$$('td');
      expect(columns.get(1).getText()).toEqual('0');
      expect(columns.get(2).getText()).toEqual('500');
      expect(columns.get(3).getText()).toEqual('2500');
    });
  });
});