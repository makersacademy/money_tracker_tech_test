'use strict';

describe('BankAccount', function () {
  var bankAccount;

  beforeEach(function () {
    bankAccount = new BankAccount();
  });

  it('starts with a balance of 0', function () {
    expect(bankAccount.getBalance()).toEqual(0);
  });

  describe('deposit', function () {
    it('adds money to the balance', function () {
      bankAccount.deposit(1000);
      expect(bankAccount.getBalance()).toEqual(1000);
    });
  });

  describe('withdraw', function () {
    it('deducts money from the balance', function () {
      bankAccount.deposit(1000);
      bankAccount.withdraw(500);
      expect(bankAccount.getBalance()).toEqual(500);
    });
  });
});
