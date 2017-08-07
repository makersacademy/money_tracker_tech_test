describe("Moneytracker", function() {

  var moneytracker;

  beforeEach(function() {
    moneytracker = new Moneytracker();
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

  describe("#withdrawal", function() {
    it("allows the user to withdraw money", function() {
      moneytracker.balance = 100;
      moneytracker.withdrawal(50);
      expect(moneytracker.balance).toEqual(50);
    });
  });
});
