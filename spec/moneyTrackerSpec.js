describe("Moneytracker", function() {

  var moneytracker;

  beforeEach(function() {
    moneytracker = new Moneytracker();
  });

  describe("#printStatement", function() {
    it("prints a statement when just an earning has been recorded", function() {
      moneytracker.recordEarning(500, "02/04/17");
      expect(moneytracker.printStatement()).toContain(500);
    });

    it("prints a statement when just an expenditure has been recorded", function() {
      moneytracker.recordExpenditure(-300, "03/04/17");
      expect(moneytracker.printStatement()).toContain(-300);
    });

    it("prints a statement when a set of transactions have been made", function() {
      moneytracker.recordEarning(1600, "15/06/17");
      moneytracker.recordExpenditure(500, "17/07/17");
      moneytracker.recordExpenditure(20, "18/07/17");
      expect(moneytracker.printStatement()).toContain(1600, "18/07/17");
    });
  });
});
