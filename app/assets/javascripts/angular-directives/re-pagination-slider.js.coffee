angular.module('GinevDirectives')
  .directive 'rePaginationSlider',-> 
    restrict: 'AC'
    scope: {
      max:'@'
      currentPage: '='
    }
    template: '<br><div re-slider></div>'
    controller: ['$scope', ($scope)->
      $scope.animate = true
      $scope.min = 1
      $scope.value = 1
      $scope.range = false
      $scope.onSlide = (event, ui)->
        $scope.currentPage = ui.value
        $scope.$apply()

      $scope.$watch 'value', ->
        $scope.currentPage = $scope.value if $scope.value != $scope.currentPage 
      $scope.$watch 'currentPage', ->
        $scope.value = $scope.currentPage if $scope.value != $scope.currentPage 


    ]


      