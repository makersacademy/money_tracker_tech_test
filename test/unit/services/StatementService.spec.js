describe('StatementService', function() {

  var statementService, transactionFactory;
  var mockedDate = new Date(2016, 6, 28)

  beforeEach(module('bankApp'));

  beforeEach(inject(function(StatementService, TransactionFactory) {
    jasmine.clock().install();
    jasmine.clock().mockDate(mockedDate);
    statementService = StatementService;
    transactionFactory = TransactionFactory;
  }));

  afterEach(function() {
    jasmine.clock().uninstall();
  });

  it('is initialized with an empty statement', function() {
    expect(statementService.statement).toEqual([]);
  });

  describe('#addTransaction', function() {
    it('adds a transaction', function() {
      statementService.addTransaction(20, 10);
      expect(statementService.statement).toEqual([new transactionFactory(20, 10)]);
    });
  });

});
