
@dotaItems.controller 'HomeCtrl', ['$scope', '$location', '$http', ($scope, $location, $http) ->
  $scope.items = []
  $http.get('/item_dbs/latest.json').success((data) ->
    data = JSON.parse(data.data).itemdata
    $scope.items = Object.keys(data).map((k) -> data[k])
  )
]

