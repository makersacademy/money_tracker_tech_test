angular.module("bankApp", ['ui.router'])

  .config(function($stateProvider, $urlRouterProvider) {

    $stateProvider
      .state('home', {
        url: '/',
        templateUrl: 'views/home.html'
      })
      .state('deposit', {
        url: '/deposit',
        templateUrl: 'views/deposit.html'
      })
      .state('withdrawal', {
        url: '/withdrawal',
        templateUrl: 'views/withdrawal.html'
      })
      .state('statement', {
        url: '/statement',
        templateUrl: 'views/statement.html'
      });

    $urlRouterProvider.otherwise('/');

  });