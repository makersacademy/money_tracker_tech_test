'use strict';

function Transaction(amount, type, balance, date) {
  this.amount = amount;
  this.type = type;
  this.balance = balance;
  this.date = date || Date.now();
};
