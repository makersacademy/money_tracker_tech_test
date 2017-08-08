'use strict';

var Account = require('../src/account').Account
var Transaction = require('../src/transaction').Transaction

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
      account.recordTransaction(date, 100, account.currentBalancebalance);
      transaction = account.transactions.pop();
      expect(transaction.date).toBe(date);
      expect(transaction.credit).toBe(100);
      expect(transaction.credit).toBe(100);
    });
  });
})
