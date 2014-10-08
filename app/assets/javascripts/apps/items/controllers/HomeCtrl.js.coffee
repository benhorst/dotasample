@dotacontrollers = angular.module('dotacontrollers', [])

@dotacontrollers.factory('itemService', ['$http', '$q', ($http, $q) ->
  getbyid = (id) ->
    deferred = $q.defer()
    $http.get("/item_dbs/latest_item/#{id}.json").success((response) ->
      deferred.resolve(response.data)
    )
    return deferred.promise

  listall = (id) ->
    deferred = $q.defer()
    $http.get("/item_dbs/latest.json").success((response) ->
      deferred.resolve(response)
    )
    return deferred.promise
  return {
    get: getbyid,
    list : listall
  }
])

@dotacontrollers.filter('recurseFilter', ['$filter', ($filter)->
  (list, query, prop, childProp) ->
    checker = (el, index, arr) ->
      return false if !angular.isDefined(el)
      !angular.isDefined(query) or
      $filter('lowercase')(el[prop]).indexOf(query) > -1 or 
      (el[childProp]? and el[childProp].map((ch) ->
        checker(ch, query, prop, childProp)).reduce(((a, c) -> a or c), false))
     list.filter(checker)
])

@dotacontrollers.controller('HomeCtrl',['$scope', '$route', '$location', 'items', ($scope, $route, $location, items) ->
  $scope.items = items

  itemMap = items.reduce((acc, curr) ->
    acc[curr.name] = curr
    acc[curr.id] = curr
    acc
  , {})

  items.map((i) ->
    return null if !i.components
    i.components = i.components.map((cId) ->
      return itemMap[cId];
    )
  )

  $scope.componentSearch = (actual, expected) ->
    return false if !actual.dname
    (actual.dname.indexOf(expected) > -1) or actual.components && actual.components.map((comp) ->
        $scope.componentSearch(comp, expected)
      ).reduce(((acc, curr) -> acc or curr), false)
  

  $scope.viewItem = (id) ->
    $location.url("/app/items/item/#{id}")

])


@dotacontrollers.controller('ItemShowCtrl', ['$scope', '$route', '$http', '$location', 'itemService', 'item', ($scope, $route, $http, $location, itemService, item) ->
  $scope.item = item
  
  $scope.viewItem = (id) ->
    $location.url("/app/items/item/#{id}")
  
  $scope.$on('$viewContentLoaded', ->
    console.log('content-loaded')
  )
  $scope.$on('$routeChangeSuccess', ->
    console.log('route change success')
  )
  $scope.$on('routeChangeError', ->
    console.log('route change fail')
  )

])

@dotacontrollers.directive('showsmall', ['$http', '$q', '$compile', '$location', 'itemService', ($http, $q, $compile, $location, itemService) ->
  return {
    restrict: 'E',
    scope: { id: "=key" },
    link: ($scope, $element, $attr) ->
      $q.all([
        itemService.get($scope.id)
        $http.get("/templates/items/showsmall.html")
      ]).then((results) ->
        $scope.viewItem = (id) ->
          $location.url "/app/items/item/#{id}"
        $scope.displayItem = results[0]
        $element.html(results[1].data)
        $compile($element.contents())($scope)
      )
  }
])

@dotacontrollers.controller('ItemShowSmallCtrl', ['$scope', '$http', '$routeParams', '$location', ($scope, $http, $routeParams, $location) ->
  
  itemService.get($routeParams.id).then((data) ->
    $scope.item = data
  )
  
  $scope.viewItem = (id) ->
    $location.url "app/items/item/#{id}"
])

@dotacontrollers.filter 'displayKeys', ->
  (object) ->
    displayNames = ["cost", "lore", "notes"];
    object = object || {}
    return Object.keys(object)
      .filter((k) -> return displayNames.indexOf(k) >= 0)
      .reduce((acc, curr) ->
        acc[curr] = object[curr]
        return acc
      , {})

