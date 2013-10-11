@angular.module('GinevDirectives')
  .directive 'reSlider', ->
    restrict: 'AC'
    link: (scope, element, attrs)->
      label = document.createElement('label')
      label.setAttribute('style', 'margin-top: -22px')
      element.slider()
      if scope.range == true
        $(element).slider('widget').children().first().addClass('min') 
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
          if scope.range
            if ui.value > currentMinValue()
              scope.values = [currentMinValue(), ui.value] 
            else
              scope.values = [ui.value, currentMaxValue()]
          else
            scope.value = ui.value
        scope.onStop(event,ui) if typeof scope.onStop != 'undefined'

      scope.start = (event, ui) ->
        $(ui.handle).append label
        $(label).text(ui.value) 
        scope.onStart(event, ui) if typeof scope.onStart != 'undefined'
        
      scope.slide =  (event, ui)->
        $(label).text(ui.value) 

      scope.change = (event, ui)->
        scope.onChange(event, ui) if typeof scope.onChange!= 'undefined'
      
      


