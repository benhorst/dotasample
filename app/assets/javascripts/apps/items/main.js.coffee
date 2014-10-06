//= require angular
//= require angular-route

@dotaItems = angular.module('dotaItems', ['ngRoute'])

@dotaItems.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.
    when('/item/:id', {
      templateUrl: '/templates/items/show.html',
      controller: 'ItemShowCtrl'
    }).
    when('/showSmall/:id', {
      templateUrl: '/templates/items/showsmall.html',
      controller: 'ItemShowSmallCtrl'
    }).
    otherwise({
      templateUrl: '/templates/items/home.html',
      controller: 'HomeCtrl'
    })
])

