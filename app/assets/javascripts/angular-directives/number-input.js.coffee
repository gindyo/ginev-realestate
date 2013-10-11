angular.module('GinevDirectives').directive 'numberInput',->
  restrict: 'AC'
  scope: {
    inputValue: '='
    displayValue: '@'

    
  }
  replace: true
  template: '
    <input ng-model="displayValue" style=" border: 1px solid #eee; display: block-span" placeholder="0">
  '
  controller: ['$scope', ($scope)->
    $scope.$watch 'inputValue', ->
      if $scope.displayValue != convertInput($scope.inputValue)
        $scope.displayValue = convertInput($scope.inputValue) #convert the input value and set the display value

    $scope.$watch 'displayValue', ->
      if $scope.inputValue != convertDisplay($scope.displayValue) #if the converted value is different from the inputValue
        $scope.inputValue = convertDisplay($scope.displayValue) #convert the display value and set input value

    convertDisplay = (digit)->
      return digit.toString().replace(/[^0-9]/g,'') if digit
      0
    convertInput = (digit)->
      if digit > 0
        digit = digit.toString().split('') 
        chunks = []
        while digit.length > 3
            chunks.unshift digit.splice(-3,3)
          chunks.unshift digit
          stringChunks = []
          for chunk in chunks
            stringChunks.push chunk.join().replace(/[^0-9]/g,'')
        $scope.displayValue = stringChunks.join() 
      else 
        ''
  ]
  link: 
    pre: (scope)->
      
