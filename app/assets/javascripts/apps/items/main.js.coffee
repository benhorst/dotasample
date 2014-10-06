//= require angular
//= require angular-route

@dotaItems = angular.module('dotaItems', ['ngRoute'])

@dotaItems.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.
    otherwise({
      templateUrl: '/templates/items/home.html',
      controller: 'HomeCtrl'
    })
])

