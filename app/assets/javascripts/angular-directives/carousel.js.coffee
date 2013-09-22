angular.module('GinevDirectives',[]).directive 'ginevCarousel', ($timeout)->
  $e = angular.element
  styles = document.createElement 'style'
  styles.innerHTML = '
    .slide{
      background: black;
      position: absolute;
      width: 1000px;
      overflow: hidden;
      margin-left: 5000px;
      transition: margin-left  1s;
      text-align: center;
      border: 1px solid;
      z-index: 100
    }

    .items-parent{
      width: 3000px;
      height: 300px;
      position: relative;
      margin-left: -500px;
    }
    .moving{
     
      opacity: .5
    }
  '
  document.head.appendChild styles

  class Loopobject 
    adjasent = (index, arr)->
      if index <= 0
        return {left: arr.length-1, right: 1}
      if index >= arr.length-1 
        return {left: arr.length-2, right: 0}
      return {left: index-1, right: index+1}

    constructor: (transcluded)->
      parent = $e(transcluded).parent()
      #debugger
      @itemsContainer = transcluded
      @items = []
      $e(transcluded).each (i,el)=> 
        div = document.createElement('div')
        div.appendChild el
        div.className = 'slide'
        @items.push div
      $e(parent).addClass 'items-parent'
      @active = 0
      @next()
      return

    next: (scope)->
      for el in @items
        $(el).addClass 'moving'
      $timeout =>
        for el in @items
          $(el).removeClass 'moving'
      , 1000

      @active = @active + 1 
      if @active == @items.length
        @active = 0
      
      left = adjasent(@active, @items).left
      right = adjasent(@active, @items).right
      left_left = adjasent(left, @items).left
      right_right = adjasent(right, @items).right

      console.log [left_left, left, @active, right, right_right]

      $e(@items[left_left]).css 'display', 'none'
      $e(@items[left_left]).css 'z-index', '-100'
      $e(@items[left_left]).css 'margin-left', '5000px'
      $e(@items[left_left]).css 'margin-left', '-500px'
      $e(@items[left]).css 'margin-left', '0px'
      $e(@items[@active]).css('margin-left', '1000px')
      $e(@items[right]).css('margin-left', '2000px')
      $e(@items[right_right]).css 'display', 'block'
      $e(@items[right_right]).css 'margin-left', '3000px'
      return


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
    link: (scope, element)=>
      scope.maskWidth = (document.width-1170)/2
      window.items = scope.itemsLoop = new Loopobject(element.children()[0].children)
      console.log scope.itemsLoop.items
      for item in scope.itemsLoop.items
        element[0].children[0].appendChild item 
      

      
  }

