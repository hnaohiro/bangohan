'use strict';

angular
  .module('bangohanWebApp', [
    'bangohanWebApp.controllers',
    'bangohanWebApp.services',
    'bangohanWebApp.directives',
    'ngCookies',
    'ngResource',
    'ngSanitize',
    'ngRoute'
  ])
  .config(function ($routeProvider) {
    $routeProvider.when('/', {
      templateUrl: 'views/main.html',
      controller: 'UserListCtrl',
      resolve: {
        users: function(MultiUserLoader) {
          return new MultiUserLoader();
        }
      }
    })
    .when('/edit/:userId', {
      templateUrl: 'views/form.html',
      controller: 'UserEditCtrl',
      resolve: {
        user: function(UserLoader) {
          return new UserLoader();
        }
      }
    })
    .otherwise({
      redirectTo: '/'
    });
  });
