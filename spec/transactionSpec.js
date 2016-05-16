'use strict';

describe('Transaction', function () {
  var transaction;

  beforeEach(function () {
    transaction = new Transaction(1000, 'deposit', 1000, '14-01-2012');
  });

  it('has an amount', function () {
    expect(transaction.amount).toEqual(1000);
  });

  it('has a date', function () {
    expect(transaction.date).toEqual('14-01-2012');
  });

  it('has a type', function () {
    expect(transaction.type).toEqual('deposit');
  });

  it('has a balance', function () {
    expect(transaction.balance).toEqual(1000);
  });
});
