//= require angular
//= require angular-route

@dotaItems = angular.module('dotaItems', ['ngRoute', 'dotacontrollers'])


@dotaItems.config(['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
  $routeProvider.
    when('/:root*/item/:id', {
      templateUrl: '/templates/items/show.html',
      controller: 'ItemShowCtrl',
      resolve: {
        item: ($route, itemService) ->
          return itemService.get($route.current.params.id)
      }
    }).
    when('/:root*/showSmall/:id', {
      templateUrl: '/templates/items/showsmall.html',
      controller: 'ItemShowSmallCtrl'
    }).
    otherwise({
      templateUrl: '/templates/items/home.html',
      controller: 'HomeCtrl',
      resolve: {
        items: (itemService) ->
          return itemService.list()
      }
    })
  $locationProvider.html5Mode(true)
])

