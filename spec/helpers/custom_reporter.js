var myReporter = {
  level: 0,

  suiteStarted: function (result) {
    this.level++;
    console.log('  '.repeat(this.level) + result.description);
  },

  specStarted: function (result) {
    this.level++;
  },

  specDone: function (result) {
    if (result.status == 'passed') {
      console.log('\x1b[32m%s\x1b[0m', '  '.repeat(this.level) + result.description);
    } else {
      console.log('\x1b[31m%s\x1b[0m', '  '.repeat(this.level) + result.description);
    }
    for (var i = 0; i < result.failedExpectations.length; i++) {
      console.log('Failure: ' + result.failedExpectations[i].message);
      console.log(result.failedExpectations[i].stack);
    }

    this.level--;
  },

  suiteDone: function (result) {
    this.level--;
  },

  jasmineDone: function () {
    console.log('Finished suite');
  }
};

jasmine.getEnv().addReporter(myReporter);
