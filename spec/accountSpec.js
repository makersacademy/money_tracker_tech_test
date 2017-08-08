'use strict';

var Account = require('../src/account').Account

describe('Account', function () {
  var account, date, transaction;
  beforeEach(function () {
    date = new Date(2017, 7, 8)
    account = new Account();
  });

  describe('is initialized', function () {
    it('with an empty array of transactions', function () {
      expect(account.transactions).not.toBe(null);
    });

    it('with a current balance of 0', function () {
      expect(account.currentBalance).toBe(0);
    });
  });

  describe('#recordTransaction', function () {
    it('records a new transaction in the account', function () {
      account.recordTransaction(100, date);
      transaction = account.transactions.pop();
      console.log(account)
      expect(transaction.date).toBe(date);
      expect(transaction.credit).toBe(100);
      expect(transaction.balance).toBe(100);
    });
  });

  describe('#madeDeposit', function () {
    it('can add a credit transaction', function () {
      spyOn(account, 'recordTransaction')
      account.madeDeposit(100, date);
      expect(account.recordTransaction).toHaveBeenCalled();
    });
  });

  describe('#withdrewMoney', function () {
    it('can add a debit transaction', function () {
      spyOn(account, 'recordTransaction')
      account.withdrewMoney(100, date);
      expect(account.recordTransaction).toHaveBeenCalled();
    });
  });
})
