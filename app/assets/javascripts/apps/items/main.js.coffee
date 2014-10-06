//= require angular
//= require angular-route

@dotaItems = angular.module('dotaItems', ['ngRoute'])

@dotaItems.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.
    when('/:root*/item/:id', {
      templateUrl: '/templates/items/show.html',
      controller: 'ItemShowCtrl'
    }).
    when('/:root*/showSmall/:id', {
      templateUrl: '/templates/items/showsmall.html',
      controller: 'ItemShowSmallCtrl'
    }).
    otherwise({
      templateUrl: '/templates/items/home.html',
      controller: 'HomeCtrl'
    })
])

