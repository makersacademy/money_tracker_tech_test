function Transaction(money, date) {
  this.date = date;
  this.credit = (money > 0 ? money : 0);
  this.debit = (money < 0 ? money : 0);
  this.balance = 0;
};
