'use strict';

angular.module('bangohanWebApp.services', ['ngResource'])
  .factory('User', function($resource) {
    return $resource('/users/:id.json', { id: '@id' }, {
      update: {
        method: 'PUT'
      }
    });
  })
  .factory('MultiUserLoader', function(User, $q) {
    return function() {
      var delay = $q.defer();
      User.query(function(users) {
        delay.resolve(users);
      }, function() {
        delay.reject('Failed to get users');
      });
      return delay.promise;
    };
  })
  .factory('UserLoader', function(User, $route, $q) {
    return function() {
      var delay = $q.defer();
      var userId = $route.current.params.userId;
      User.get({ id: userId }, function(user) {
        delay.resolve(user);
      }, function() {
        delay.reject('Failed to get user' + userId);
      });
      return delay.promise;
    };
  });
