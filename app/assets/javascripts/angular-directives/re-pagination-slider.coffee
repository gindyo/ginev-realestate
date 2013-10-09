# angular.module('GinevDirectives')
#   .directive 'rePaginationSlider',['reSliderDirective', (reSliderDirective)-> 
#     reSlider = null
#     angular.module('GinevDirectives')._invokeQueue.forEach (dir)->
#       reSlider = dir[2][1] if dir[2][0] == 'reSlider'
#     s = new reSlider()
#     s.scope.max = '='
#     s.link =->
#       @rangeWidth = 0
#       scope.$watch 'max', =>
#         slider_options = {min: 1, max: scope.max, animate: 'slow'}
#         element.slider(slider_options)
          
#       currentMinValue = -> 
#         if element.slider('values')[0] == 0
#           return scope.min
#         else
#           Math.ceil((scope.max * element.slider('values')[0]) / 100)
#       currentMaxValue = -> Math.ceil((scope.max * element.slider('values')[1]) / 100)
      
      
#       element.slider
#         stop: ->
#           scope.sliderChange({values: {lo:element.slider('value')}})
#         slide: (event, ui)->
#           $(ui.handle).text(ui.value) if attrs.showValues
#     return s
#   ]