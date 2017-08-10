function Statement(transactions) {
  this.createStatement = this._createStatement(transactions);
};

Statement.prototype._createStatementBody = function (transactions) {
  var statement = "";
    for(var i = 0; i < transactions.length; i++) {
      statement += (transactions[i].date) + " || " +
                   (transactions[i].credit) + " || " +
                   (transactions[i].debit) + " || " +
                   (transactions[i].balance) + "\n";
    };
  return statement;
};

Statement.prototype._createStatementHeader = function () {
  return "date || credit || debit || balance\n";
};

Statement.prototype._createStatement = function (transactions) {
  return this._createStatementHeader() + this._createStatementBody(transactions);
};
