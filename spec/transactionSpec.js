'use strict';

describe('Transaction', function () {
  var deposit, withdrawal, date;

  beforeEach(function () {
    date = new Date('May 16 2016');
    deposit = new Transaction(1000, 'deposit', 1000, date);
    withdrawal = new Transaction(500, 'withdrawal', 2500, date);
  });

  it('has a date', function () {
    expect(deposit.getDate()).toEqual(date);
  });

  it('has an amount', function () {
    expect(deposit.getAmount()).toEqual(1000);
  });

  it('has a balance', function () {
    expect(deposit.getBalance()).toEqual(1000);
  });

  describe('is deposit', function () {
    it('returns true for a deposit', function () {
      expect(deposit.isDeposit()).toEqual(true);
    });

    it('returns false for a withdrawal', function () {
      expect(withdrawal.isDeposit()).toEqual(false);
    });
  });
});
