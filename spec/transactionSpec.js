describe("Transaction", function() {
  var transaction;

  beforeEach(function() {
    transaction = new Transaction(500, "11/08/17");
  });

  describe("#date", function() {
    it("sets a date on intialisation", function() {
      expect(transaction.date).toEqual("11/08/17");
    });
  });

  describe("#credit", function() {
    it("sets a value for credit on initialisation", function() {
      expect(transaction.credit).toEqual(500);
    });
  });

  describe("#debit", function() {
    it("sets a value for debit on initialisation", function() {
      expect(transaction.debit).toEqual(0);
    });
  });

  describe("#balance", function() {
    it("sets a balance of 0 on initialisation", function() {
      expect(transaction.balance).toEqual(0);
    });
  });
});
