describe "DotaItems controllers" ->
  beforeEach module("dotaItems")

  describe "HomeCtrl", ->
    it "should set items to an empty array", inject(($controller) ->
      scope = {}
      ctrl = $controller("HomeCtrl",
        $scope: scope
      )
      expect(scope.dotaItems.length).toBe 0
    )
