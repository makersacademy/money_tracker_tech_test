function Moneytracker(date, credit, debit, balance) {
  this.date = date;
  this.credit = 0;
  this.debit = 0;
  this.balance = 0;
};

Moneytracker.prototype.deposit = function (money) {
  this.credit += money;
  this.balance += money;
  this._printDate + console.log(this.balance);
};

Moneytracker.prototype.withdraw = function (money) {
  this.debit -= money;
  this.balance -= money;
  console.log(this.balance);
};

Moneytracker.prototype.statement = function () {
  console.table([this]);
};
