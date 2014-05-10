'use strict';

angular.module('bangohanWebApp.directives', [])
  .directive('status', function() {
    return {
      link: function(scope, element) {
        if (scope.user.defined) {
          if (scope.user.need) {
            element.addClass('eat-bangohan');
          } else {
            element.addClass('no-bangohan');
          }
        }
      }
    };
  })
  .directive('scheduleicon', function() {
    return {
      link: function(scope, element) {
        if (scope.user.defined) {
          if (scope.user.need) {
            element.addClass('glyphicon glyphicon-cutlery colored-icon eat-bangohan');
          } else {
            element.addClass('glyphicon glyphicon-remove colored-icon no-bangohan');
          }
        }
      }
    };
  })
  .directive('scheduletime', function() {
    return {
      link: function(scope, element) {
        if (scope.user.defined) {
          if (scope.user.need) {
            var hour = ('0' + scope.user.hour).slice(-2);
            var min = ('0' + scope.user.min).slice(-2);
            element.text(hour + ':' + min);
          }
        } else {
          element.text('?');
        }
      }
    };
  });
