describe("Moneytracker", function() {

  var moneytracker;

  beforeEach(function() {
    moneytracker = new Moneytracker();
  });

  describe("#recordEarning", function() {
    // it("records (an) earning(s) which can be collated and printed as a running balance", function(){
    //   moneytracker.recordEarning(100, "11/08/17");
    //   expect(moneytracker.printBalance()).toEqual(console.log("Balance: 100"));
    // });
  });

  describe("#recordExpenditure", function() {
    // it("records (an) expenditure(s) which can be collated and printed as a running balance", function() {
    //   moneytracker.recordExpenditure(-25, "12/08/17");
    //   expect(moneytracker.printBalance()).toEqual(console.log("Balance: -25"));
    // });
  });

  describe("#printStatement", function() {
    // var moneytracker, recordEarning, printedStatement;
    //
    // beforeEach(function() {
    //   moneytracker = {
    //     recordEarning: function(money, date) {
    //       earnings = (money, date);
    //     },
    //     printStatement: function() {
    //       return earnings;
    //     }
    //   };
    //
    //   spyOn(moneytracker, 'printStatement').and.callThrough();
    //   moneytracker.recordEarning(500, "22/07/17");
    //   printedStatement = moneytracker.printStatement();
    // });
    //
    //   it("tracks that the spy was called", function() {
    //     expect(moneytracker.printStatement).toHaveBeenCalled();
    //   })
    //   it("prints a statement of all transactions", function() {
    //     expect(printedStatement).toEqual(500, "22/07/17");
    //   });

    
    // it("prints a statement of all transactions", function() {
    //   moneytracker.recordEarning(500, "22/07/17");
    //   moneytracker.recordExpenditure(-20, "22/07/17");
    //   moneytracker.recordExpenditure(-50, "23/07/17");
    //   moneytracker.recordEarning(1600, "30/07/17");
    //   expect(moneytracker.printStatement()).toEqual(jasmine.arrayContaining([500, "22/07/17"]));
    // });
  });
});
