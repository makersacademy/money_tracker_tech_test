function Moneytracker(date, credit, debit, balance) {
  this.date = "";
  this.credit = 0;
  this.debit = 0;
  this.balance = 0;
  this.MIN_BALANCE = 0;
  // this.displayMessage = "Welcome to Moneytracker";
};

var transactions = [];

Moneytracker.prototype.deposit = function (money, dateOfTransaction) {
  this.credit += money;
  this.insertDate(dateOfTransaction);
  this.balance += money;
  this._createTransaction();
};

Moneytracker.prototype.withdraw = function (money, dateOfTransaction) {
  // this.checkBalance();
  this.debit -= money;
  this.insertDate(dateOfTransaction);
  this.balance -= money;
  this._createTransaction();
};

Moneytracker.prototype.insertDate = function (dateOfTransaction) {
  this.date = dateOfTransaction;
};

Moneytracker.prototype._createTransaction = function () {
  var transaction = {
      // date: new Date().toLocaleDateString(),
      date: this.date,
      credit: String(this.credit),
      debit: String(this.debit),
      balance: String(this.balance)
    };
    transactions.push(transaction)
    this._resetTransaction();
  };

Moneytracker.prototype.statement = function () {
  console.table(transactions);
};

Moneytracker.prototype._resetTransaction = function () {
  this.date = "";
  this.credit = 0;
  this.debit = 0;
};

// Moneytracker.prototype.checkBalance = function () {
//   if (this.balance === this.MIN_BALANCE ) {
//     throw new Error("Your balance is 0. Withdrawal denied.");
//   };
// };

// Moneytracker.prototype.readDisplayMessage = function () {
//   if (this.balance == this.MIN_BALANCE ) {
//     this.displayMessage = "Your balance is 0. Withdrawal denied.";
//   };
// };
