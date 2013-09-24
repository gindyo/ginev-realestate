angular.module('GinevDirectives',[]).directive 'ginevCarousel', ($timeout)->
  $e = angular.element
  styles = document.createElement 'style'
  styles.innerHTML = '
    .slide{
      background: black;
      color: white;
      position: relative;
      width: 1000px;
      margin-left: 0px;
      text-align: center;
      border: 1px solid;
      float: left;
      transition: opacity  .5s, left 1s;
    }

    .items-parent{
      left: 0px;
      overflow: hidden;
      width: 7000px;
      height: 300px;
      position: absolute;
      margin-left:-500px;
      
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
      @parent = $e(transcluded).parent()
      @itemsContainer = transcluded
      @items = []
      @left_most = 0
      @active_items = 1
      @right_most = 5
      current_position = 0

      $e(transcluded).each (i,el)=> 
        div = document.createElement('div')
        $e(el).css 'width', '600px'
        div.appendChild el
        div.className = 'slide'
        @items.push div
        $e(@parent).append div
      $e(@parent).addClass 'items-parent'
      @active = 1
      @next('left')
      return

    next: ->
      # @active = @active + 1
      # @active = 0 if @active > @items.length-1
      # @current_position = @current_position + 1
      # right = adjasent(@active, @items).right
      # right_right = adjasent(right, @items).right

      # if @right_most == @current_position + 1
      #   $e(@parent).append $e(right_right).clone()
      #   @right_most = @right_most + 1

      # margin = parseInt $e(@parent).css('margin-left').slice(0,-2)
      # width = parseInt $e(@parent).css('width').slice(0,-2)
      # $e(@parent).css {'margin-left': (margin-1000)+'px', 'width': (width+1000)+'px'}

    previous: ->
      clone = $e(this.parent).children().last().clone()
      $e(this.parent).prepend clone
      $e(this.parent).children().first().css 'left', @intValue(@parent, 'left') + 1000 + 'px'
      $e(this.parent).children().last().remove()
      
      
    intValue: (el, key)->
      parseInt($e(el).css(key).slice(0,-2))

    
  return  {
    restrict: 'CE'
    scope: {caption: '='}
    transclude: true
    replace: false
    templateUrl: '/templates/carousel.html'
    link: (scope, element)=>
      scope.maskWidth = (document.width-1170)/2
      window.items = scope.itemsLoop = new Loopobject(element.children()[0].children)
      
      

      
  }

