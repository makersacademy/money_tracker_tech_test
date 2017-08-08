var Account = require('./src/account').Account
var Credit = require('./src/credit').Credit
var Debit = require('./src/debit').Debit
var Printer = require('./src/printer').Printer

var account = new Account()
var credit = new Credit(account)
var debit = new Debit(account)

credit.makeTransaction(1000, '10/01/2012')
credit.makeTransaction(2000, '13/01/2012')
debit.makeTransaction(500, '14/01/2012')

var printer = new Printer(account.transactions)
printer.printListOfTransactions()
