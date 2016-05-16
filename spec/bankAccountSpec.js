'use strict';

describe('BankAccount', function () {
  var bankAccount;
  var Transaction;

  beforeEach(function () {
    Transaction = jasmine.createSpy('Transaction');
    bankAccount = new BankAccount(Transaction);
  });

  it('starts with a balance of 0', function () {
    expect(bankAccount.getBalance()).toEqual(0);
  });

  it('starts with an empty transaction record', function () {
    expect(bankAccount.getTransactionHistory()).toEqual([]);
  });

  describe('deposit', function () {
    beforeEach(function () {
      bankAccount.deposit(1000);
    });

    it('adds money to the balance', function () {
      expect(bankAccount.getBalance()).toEqual(1000);
    });

    it('records the deposit transaction', function () {
      expect(bankAccount.getTransactionHistory().length).toEqual(1);
    });
  });

  describe('withdraw', function () {
    beforeEach(function () {
      bankAccount.deposit(1000);
      bankAccount.withdraw(500);
    });

    it('deducts money from the balance', function () {
      expect(bankAccount.getBalance()).toEqual(500);
    });

    it('records the withdrawal transaction', function () {
      expect(bankAccount.getTransactionHistory().length).toEqual(2);
    });
  });
});
