angular.module('GinevDirectives',[]).directive 'ginevCarousel', ($timeout)->
  styles = document.createElement 'style'
  styles.innerHTML = '
    .slide{
      position: absolute;
      width: 1000px;
      height: 300px;
      overflow: hidden;
    }
    
   
  '
  document.head.appendChild styles

  class Loopobject 
    adjasent = (arr, index)->
      if index == 0
        return [arr[arr.length-1], arr[1]]
      if index > arr.length - 1
        return [arr[index-1], arr[0]]
      return [arr[index-1], arr[index+1]]

    constructor: (transcluded)->
      @itemsContainer = transcluded
      @items = []
      $(transcluded).each (i, el)=>
        div = document.createElement('div')
        div.appendChild el
        div.className = 'slide'
        @items.push div
      
     
   

    next: (scope)->
      margin = $('#test').css('margin-left').slice(0,-2)
      console.log margin

      if margin > -((@itemsContainer.children.length - 1) * 1170) + 585
        margin = parseInt(margin) - 1170
        $('#test').attr('style', 'margin-left:'+ margin+'px')
      

    previous: ->
      margin = $('#test').css('margin-left').slice(0,-2)
      if margin < -1170 + 585
        margin = parseInt(margin) + 1170
        $('#test').attr('style', 'margin-left:'+ margin+'px')
    
  return  {
    restrict: 'CE'
    scope: {caption: '='}
    transclude: true
    replace: false
    templateUrl: '/templates/carousel.html'
    link: (scope, element)->
      scope.maskWidth = (document.width-1170)/2
      scope.itemsLoop = new Loopobject(element.children()[0].children)
      for item in scope.itemsLoop.items
        element[0].appendChild item 
      

      
  }

