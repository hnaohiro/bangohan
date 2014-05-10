'use strict';

angular.module('bangohanWebApp.controllers', [])
  .controller('UserListCtrl', function($scope, users) {
    $scope.users = users;
  })
  .controller('UserEditCtrl', function($scope, $location, user) {
    $scope.user = user;

    $scope.hours = [17, 18, 19, 20, 21, 22, 23];
    $scope.mins = [0, 10, 20, 30, 40, 50];
    $scope.need = [{ value: true, name: 'Yes' }, { value: false, name: 'No' }];

    // selectの初期値
    if (!user.defined || !user.hour) {
      $scope.user.hour = $scope.hours[0];
    }
    if (!user.defined || !user.min) {
      $scope.user.min = $scope.mins[0];
    }

    $scope.submit = function() {
      $scope.user.defined = true;
      $scope.user.$update(function() {
        $location.path('/');
      });
    };

    $scope.clear = function() {
      $scope.user.defined = false;
      $scope.user.$update(function() {
        $location.path('/');
      });
    };
  });
