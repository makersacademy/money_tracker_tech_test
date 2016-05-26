'use strict';

describe('statement', function () {
  var statement, deposit, withdrawal;

  beforeEach(function () {
    var account = jasmine.createSpyObj('account', ['getTransactionHistory']);
    deposit = jasmine.createSpyObj('deposit', ['getDate', 'getAmount', 'getBalance', 'isDeposit']);
    withdrawal = jasmine.createSpyObj('withdrawal', ['getDate', 'getAmount', 'getBalance', 'isDeposit']);
    account.getTransactionHistory.and.returnValue([deposit, withdrawal]);
    statement = new Statement(account);
  });

  describe('print', function () {
    var header, depositRow, withdrawalRow;

    beforeEach(function () {
      deposit.getDate.and.returnValue(new Date('May 15 2016'));
      deposit.isDeposit.and.returnValue(true);
      deposit.getAmount.and.returnValue(1000);
      deposit.getBalance.and.returnValue(1000);

      withdrawal.getDate.and.returnValue(new Date('May 16 2016'));
      withdrawal.isDeposit.and.returnValue(false);
      withdrawal.getAmount.and.returnValue(500);
      withdrawal.getBalance.and.returnValue(500);

      header = 'date || credit || debit || balance';
      depositRow = '15/05/2016 || 1000.00 || || 1000.00';
      withdrawalRow = '16/05/2016 || || 500.00 || 500.00';
    });

    it('prints a statement with descending dates', function () {
      expect(statement.print('descending')).toEqual(header + '\n' + withdrawalRow + '\n' + depositRow);
    });

    it('prints a statement with ascending dates', function () {
      expect(statement.print('ascending')).toEqual(header + '\n' + depositRow + '\n' + withdrawalRow);
    });

    it('prints out deposits only', function () {
      expect(statement.print('deposits')).toEqual(header + '\n' + depositRow);
    });

    it('prints out withdrawal only', function () {
      expect(statement.print('withdrawals')).toEqual(header + '\n' + withdrawalRow);
    });
  });
});
