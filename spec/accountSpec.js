'use strict';

var Account = require('../src/account').Account
var convertStringToDate = require('../src/transaction').convertStringToDate

describe('Account', function () {
  var account, date, transaction, dateConverted;
  beforeEach(function () {
    date = '10/01/2012'
    dateConverted = convertStringToDate(date)
    account = new Account();
  });

  describe('is initialized', function () {
    it('with an empty array of transactions', function () {
      expect(account.transactions).not.toBe(null);
    });
  });

  describe('#recordTransaction', function () {
    it('records a new transaction in the account', function () {
      account.recordTransaction(100, date);
      transaction = account.transactions.pop();
      expect(transaction.date.getTime()).toBe(dateConverted.getTime());
      expect(transaction.amount).toBe(100);
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
