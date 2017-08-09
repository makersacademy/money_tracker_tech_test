describe("Moneytracker", function() {

  var moneytracker;

  beforeEach(function() {
    moneytracker = new Moneytracker();
  });

  describe("#recordEarning", function() {
    it("records (an) earning(s) which can be collated and printed as a running balance", function(){
      moneytracker.recordEarning(100, "11/08/17");
      expect(moneytracker.printBalance()).toEqual(console.log("Balance: 100"));
    });
  });

  describe("#recordExpenditure", function() {
    it("records (an) expenditure(s) which can be collated and printed as a running balance", function() {
      moneytracker.recordExpenditure(-25, "12/08/17");
      expect(moneytracker.printBalance()).toEqual(console.log("Balance: -25"));
    });
  });

  describe("#printBalance", function() {
    it("prints the current balance", function() {
      moneytracker.recordEarning(1200, "15/07/17");
      moneytracker.recordExpenditure(-250, "29/07/17");
      expect(moneytracker.printBalance()).toEqual(console.log(950));
    });
  });

  describe("#printStatement", function() {
    it("prints a statement of all transactions", function() {
      moneytracker.recordEarning(500, "22/07/17");
      moneytracker.recordExpenditure(-20, "22/07/17");
      moneytracker.recordExpenditure(-50, "23/07/17");
      moneytracker.recordEarning(1600, "30/07/17");
      expect(moneytracker.printStatement()).toEqual(console.log("date || credit || debit || balance\n" +
                                                                "22/07/17 || 500 || 0 || 500\n" +
                                                                "22/07/17 || 0 || -20 || 480\n" +
                                                                "23/07/17 || 0 || -50 || 430\n" +
                                                                "30/07/17 || 1600 || 0 || 2030"));
    });
  });
});
