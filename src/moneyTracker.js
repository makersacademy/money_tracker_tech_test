function Moneytracker() {
  this.balance = 0;
};

Moneytracker.prototype.deposit = function (money) {
  this.balance += money;
  this._printDate + console.log(this.balance);
};

Moneytracker.prototype.withdrawal = function (money) {
  this.balance -= money;
  console.log(this.balance);
};
