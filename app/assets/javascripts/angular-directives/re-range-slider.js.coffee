@angular.module('GinevDirectives')
  .directive 'reRangeSlider', ->
    restrict: 'AC'
    scope: {
      title:'@'
      edges: '='
      current: '='
    }
    template: '
    <div>
      <br>
      <div re-slider ></div>
      <table>
        <tr>
          <td>
            <span>Min {{title}}</span>
          </td>
          <td>
            <input number-input input-value="values[0]" style="width: 70%; float: right; display: block">
          </td>
        <tr>
          <td>
            <span>Max {{title}}</span>
          </td>
          <td>
            <input number-input style="width: 70%; float: right" input-value="values[1]" >
          </td>
        </tr>
      </table>
      </div>
      '
    controller: ['$scope',($scope)-> 
      $scope.$watch 'values | json', ->
        $scope.current[0] = $scope.values[0] = setMaxMin($scope.values[0]) if $scope.current && $scope.values
        $scope.current[1] = $scope.values[1] = setMaxMin($scope.values[1]) if $scope.current && $scope.values

      setMaxMin = (value)->
        return 0 if value < 0
        return $scope.edges[1] if value > $scope.edges[1]
        value

      $scope.onStop = (event, ui)->
        if ui.values[1] && ui.values[0] == ui.values[1]
          $scope.range = false
        else
          $scope.range = true
        $scope.$apply ->
          $scope.values = ui.values 
      $scope.onChange = (event, ui)->
        if ui.values[0]>ui.values[1]
          $scope.values.reverse() 

      ]
    link: 
      pre: (scope, element, attrs)-> 
        scope.range = true
        scope.min = 0
        scope.max = scope.edges[1]
        scope.$watch 'edges | json', ->
          scope.values = scope.current
          scope.min = scope.edges[0]
          scope.max = scope.edges[1]
        scope.stop = (event, ui)->
          if ui.values[0] == ui.values[1]
              scope.range = false
            else
              scope.range = true
            scope.$apply ->
              scope.values = ui.values