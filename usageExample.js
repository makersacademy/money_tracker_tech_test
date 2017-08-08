var Account = require('./src/account').Account
var Printer = require('./src/printer').Printer

var account = new Account()

account.madeDeposit(1000, '10/01/2012')
account.madeDeposit(2000, '13/01/2012')
account.withdrewMoney(500, '14/01/2012')

var printer = new Printer(account.transactions)
printer.printListOfTransactions()
