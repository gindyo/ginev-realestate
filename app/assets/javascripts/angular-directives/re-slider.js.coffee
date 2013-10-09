@angular.module('GinevDirectives')
  .directive 'reSlider', ->
    restrict: 'AC'
    # scope: {
    #   animate: '='
    #   disabled: '='
    #   max: '='
    #   min: '='
    #   orientation: '='
    #   range: '='
    #   step: '='
    #   value: '='
    #   values: '='
    #   change: '='
    #   create: '='
    #   start: '='
      
    # }
    link: (scope, element, attrs)->
      label = document.createElement('label')
      label.setAttribute('style', 'margin-top: -22px')
      
      element.slider()
      
      setWatch = (option)->
        scope.$watch "#{option} | json", ->
          $(element).slider 'option', option, scope[option]
      
      for option, value in [
        'animate',
        'disabled',
        'max',
        'min',
        'orientation',
        'range',
        'step',
        'value',
        'values',
        'change',
        'create',
        'slide',
        'start',
        'stop']
        $(element).slider 'option', option, scope[option]
        setWatch(option)


      currentMinValue = -> 
          if element.slider('values')[0] == 0
            return scope.min
          else
            element.slider('values')[0]
      currentMaxValue = ->
        element.slider('values')[1]
      
      scope.stop = (event, ui)->
        $(label).text('')
        $(ui.handle).children(label).remove()
        scope.$apply ->
          if ui.value > currentMinValue()
            scope.values = [currentMinValue(), ui.value] if scope.range == true
          else
            scope.values = [ui.value, currentMaxValue()] if scope.range == true
          
      scope.start = (event, ui) ->
        $(ui.handle).append label
        $(label).text(ui.value) 
        
      scope.slide =  (event, ui)->
        $(label).text(ui.value) 
       
      
      


