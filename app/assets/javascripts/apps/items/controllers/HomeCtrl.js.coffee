
@dotaItems.controller 'HomeCtrl', ['$scope', '$location', '$http', 'itemService', ($scope, $location, $http, itemService) ->
  $scope.items = []
  itemService.list().then((data) ->
    $scope.items = data
  )

  $scope.viewItem = (id) ->
    $location.url "item/#{id}"
]

@dotaItems.factory 'itemService', ['$http', '$q', ($http, $q) ->
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
]


@dotaItems.controller('ItemShowCtrl', ['$scope', '$http', '$routeParams', '$location', 'itemService', ($scope, $http, $routeParams, $location, itemService) ->
  itemService.get($routeParams.id).then((data) ->
    $scope.item = data
  )

  $scope.viewItem = (id) ->
    $location.url "item/#{id}"
  
]).directive 'showsmall', ['$http', '$q', '$compile', '$location', 'itemService', ($http, $q, $compile, $location, itemService) ->
  return {
    restrict: 'E',
    scope: { id: "=key" },
    link: ($scope, $element, $attr) ->
      $q.all([
        itemService.get($scope.id)
        $http.get("/templates/items/showsmall.html")
      ]).then((results) ->
        $scope.viewItem = (id) ->
          $location.url "item/#{id}"
        $scope.displayItem = results[0]
        $element.html(results[1].data)
        $compile($element.contents())($scope)
      )
  }
]

@dotaItems.controller 'ItemShowSmallCtrl', ['$scope', '$http', '$routeParams', '$location', ($scope, $http, $routeParams, $location) ->
  
  itemService.get($routeParams.id).then((data) ->
    $scope.item = data
  )
  
  $scope.viewItem = (id) ->
    $location.url "item/#{id}"
]



@dotaItems.filter 'displayKeys', ->
  (object) ->
    displayNames = ["cost", "lore", "notes"];
    object = object || {}
    return Object.keys(object)
      .filter((k) -> return displayNames.indexOf(k) >= 0)
      .reduce((acc, curr) ->
        acc[curr] = object[curr]
        return acc
      , {})

    
