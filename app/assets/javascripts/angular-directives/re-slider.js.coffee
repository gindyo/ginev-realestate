@angular.module('GinevDirectives')
  .directive 'reSlider', ->
    restrict: 'AC'
    
    scope: {
      min: '@'
      max: '@'
      range: '='
      sliderChange: '&'
    }
    compile: (element, attrs, link)->
      low = document.createElement('span')
      low.innerHTML = '{{slidingMin}}'
      low.setAttribute('style', 'position: absolute; left: -20px; bottom: -20px')
      element.prepend(low)
      high = document.createElement('span')
      high.innerHTML = '{{slidingMax}}'
      high.setAttribute('style', 'position: absolute; right: -20px; bottom: -20px')
      element.prepend(high)
      
      link = (scope, element, attrs)->      
        @rangeWidth = 0
        scope.$watch 'min + max + range', =>
          slider_options = {min: 1, max: scope.max, animate: 'slow'}
          slider_options = {range: scope.range, values: [0,100]} if scope.range == true 
          @rangeWidth = scope.max - scope.min
          element.slider(slider_options)
            
        currentMinValue = -> 
          if element.slider('values')[0] == 0
            return scope.min
          else
            Math.ceil((scope.max * element.slider('values')[0]) / 100)
        currentMaxValue = -> Math.ceil((scope.max * element.slider('values')[1]) / 100)
        
        
        element.slider
          stop: ->
            if scope.range
              scope.sliderChange({values: {lo:currentMinValue(),hi:currentMaxValue()}})
            else
              scope.sliderChange({values: {lo:element.slider('value')}})
          slide: (event, ui)->
            $(ui.handle).text(ui.value) if attrs.showValues
     
