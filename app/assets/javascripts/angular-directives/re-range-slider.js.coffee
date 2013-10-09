@angular.module('GinevDirectives')
  .directive 'reRangeSlider', ->
    restrict: 'AC'
    scope: {
      title:'@'
      edges: '='
      current: '='
    }
    template: '
    <div style="padding: 20px, 0px">
      <div re-slider></div>
      <table>
        <tr>
          <td>
            <span>Min {{title}}</span>
          </td>
          <td>
            <input ng-model="values[0]" type="text"style="width: 50%; float: right; display: block" >
          </td>
        <tr>
          <td>
            <span>Max {{title}}</span>
          </td>
          <td>
            <input type="text" style="width: 50%; display: block; float: right" ng-model="values[1]">
          </td>
        </tr>
      </table>
      </div>
      '
    controller: ['$scope',($scope)-> 
      $scope.$watch 'values | json', ->
        $scope.current = $scope.values
        #$scope.values[0] = $scope.values[0] if $scope.values
      
        #$scope.$watch 'minDisplay', ->
        if $scope.values  
          if $scope.values[0] &&  $scope.values[0].length > 3 
            digit = $scope.values[0].replace(/[^0-9]/g,'')
            $scope.values[0] = parseInt(digit) 
            digit = digit.split('')
            chunks = []
            while digit.length > 3
              chunks.unshift digit.splice(-3,3)
            chunks.unshift digit
            stringChunks = []
            for chunk in chunks
              stringChunks.push chunk.join().replace(/[^0-9]/g,'')
            $scope.values[0] = stringChunks.join()
          else 
            $scope.values[0] = parseInt($scope.values[0]) || 0

      ]
    link: 
      pre: (scope, element, attrs)-> 
        scope.range = true
        scope.min = scope.edges[0]
        scope.max = scope.edges[1]
        scope.$watch 'edges | json', ->
          scope.values = scope.current
          scope.min = scope.edges[0]
          scope.max = scope.edges[1]
