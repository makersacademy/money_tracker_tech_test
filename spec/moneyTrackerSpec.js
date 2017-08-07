describe("Moneytracker", function() {

  var moneytracker;

  beforeEach(function() {
    moneytracker = new Moneytracker(0, 0, 0, 0);
  });

  describe("#balance", function() {
    it("sets the balance to 0 on initialisation", function() {
      expect(moneytracker.balance).toEqual(0);
    });
  });

  describe("#deposit", function() {
    it("allows the user to deposit money", function() {
      moneytracker.deposit(100);
      expect(moneytracker.balance).toEqual(100);
    });
  });

  describe("#withdraw", function() {
    it("allows the user to withdraw money", function() {
      moneytracker.balance = 100;
      moneytracker.withdraw(50);
      expect(moneytracker.balance).toEqual(50);
    });
  });

  describe("#statement", function() {
    it("prints a statement", function() {
      moneytracker.deposit(1000);
      moneytracker.withdraw(250);
      expect(moneytracker.balance).toEqual(750);
      expect(moneytracker.statement).not.toBeNull();
    });
  });
});
