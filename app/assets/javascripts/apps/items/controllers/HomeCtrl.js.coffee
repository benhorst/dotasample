
@dotaItems.controller 'HomeCtrl', ['$scope', '$location', '$http', ($scope, $location, $http) ->
  $scope.items = []
  $http.get('/item_dbs/latest.json').success((data) ->
    $scope.items = data
  )

  $scope.viewItem = (id) ->
    $location.url "item/#{id}"
]

@dotaItems.controller('ItemShowCtrl', ['$scope', '$http', '$routeParams', '$location', ($scope, $http, $routeParams, $location) ->
  $http.get("/item_dbs/latest_item/#{$routeParams.id}.json").success((data) ->
    $scope.item = data.data
  )

  $scope.viewItem = (id) ->
    $location.url "item/#{id}"
  
  $scope.getItemByName = (name) ->
    $http.get("/item_dbs/latest_item/#{name}.json").success((data) ->
      return data.data
    )
]).directive 'showsmall', ['$http', '$q', '$compile', '$location', ($http, $q, $compile, $location) ->
  return {
    restrict: 'E',
    scope: { id: "=key" },
    templateUrl: '/templates/items/showsmall.html'
    link: ($scope, $element, $attr) ->
      $q.all([
        $http.get("/item_dbs/latest_item/#{$scope.id}.json")
        $http.get("/templates/items/showsmall.html")
      ]).then((results) ->
        $scope.viewItem = (id) ->
          $location.url "item/#{id}"
        $scope.displayItem = results[0].data.data
        $element.html(results[1].data)
        $compile($element.contents())($scope)
      )
  }
]

@dotaItems.controller 'ItemShowSmallCtrl', ['$scope', '$http', '$routeParams', '$location', ($scope, $http, $routeParams, $location) ->
  
  $http.get("/item_dbs/latest_item/#{$routeParams.id}.json").success((data) ->
    $scope.item = data.data
  )
  
  $scope.viewItem = (id) ->
    $location.url "item/#{id}"
]



@dotaItems.filter 'displayKeys', ->
  (object) ->
    displayNames = ["cost", "lore", "notes"];
    return Object.keys(object)
      .filter((k) -> return displayNames.indexOf(k) >= 0)
      .reduce((acc, curr) ->
        acc[curr] = object[curr]
        return acc
      , {})

    
