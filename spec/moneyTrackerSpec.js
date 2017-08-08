describe("Moneytracker", function() {

  var moneytracker;

  beforeEach(function() {
    moneytracker = new Moneytracker(null, 0, 0, 0);

    spyOn(transactions, 'push');
  });

  describe("#balance", function() {
    it("sets the balance to 0 on initialisation", function() {
      expect(moneytracker.balance).toEqual(0);
    });

    it("gives the correct balance after a transaction has been made", function() {
      moneytracker.deposit(100);
      moneytracker.withdraw(25);
      expect(moneytracker.balance).toEqual(75);
    });
  });

  describe("#credit", function() {
    it("sets the credit to 0 on initialisation", function() {
      expect(moneytracker.credit).toEqual(0);
    });
  });

  describe("#debit", function() {
    it("sets the debit to 0 on initialisation", function() {
      expect(moneytracker.debit).toEqual(0);
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

    it("will throw an error when withdrawing money at a balance of 0", function() {
      moneytracker.deposit(100);
      moneytracker.withdraw(100);
      expect( function() { moneytracker.checkBalance() } ).toThrow(new Error("Your balance is 0. Withdrawal denied."));
    });
  });

  // describe("#readDisplayMessage", function() {
  //   it("shows a message to the user when they cannot withdraw on a balance of 0", function() {
  //     moneytracker.withdraw(100);
  //     moneytracker.withdraw(10);
  //     moneytracker.readDisplayMessage();
  //     expect(moneytracker.displayMessage).toEqual("Your balance is 0. Withdrawal denied.");
  //   });
  // });

  // describe("#statement", function() {
  //   it("prints a statement", function() {
  //     moneytracker.deposit(1000);
  //     expect(moneytracker.balance).toEqual(1000);
  //     console.log(moneytracker)
  //     expect(moneytracker.statement).toEqual(["date: null, credit: 0, debit: 0, balance: 1000"]);
  //   });
  // });
});
