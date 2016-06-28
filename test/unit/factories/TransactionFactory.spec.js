describe('TransactionFactory', function() {

  var transaction;
  var mockedDate = new Date(2016, 6, 28)

  beforeEach(module('bankApp'));

  beforeEach(inject(function(TransactionFactory) {
    jasmine.clock().install();
    jasmine.clock().mockDate(mockedDate);
    transaction = new TransactionFactory(10, 20);
  }));

  afterEach(function() {
    jasmine.clock().uninstall();
  });

  it('has a credit property', function() {
    expect(transaction.credit).toEqual(10);
  });

  it('has a debit property', function() {
    expect(transaction.debit).toEqual(20);
  });

  it('has the transaction date', function() {
    expect(transaction.date).toEqual(mockedDate);
  });

});