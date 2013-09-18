angular.module('GinevDirectives',[]).directive 'ginevCarousel', ->
  styles = document.createElement 'style'
  styles.innerHTML = '
    .carousel-item{
      float: left;
      display: none;
    }
    .ci-active{
      width: 100px;
      height: 50px;
      background: red;
      display: block;
      text-align: center;
    }
    .ci-active-left{
      width: 50px;
      height: 50px;
      background: red;
      opacity: 0.5;
      display: block;
      text-align: center;
    }
    .ci-active-right{
      width: 50px;
      height: 50px;
      background: red;
      opacity: 0.5;
      display: block;
      text-align: center;
    }



  '
  document.head.appendChild styles

  class Loopobject 
    adjasent = (arr, index)->
      if index == 0
        return [arr[arr.length-1], arr[1]]
      if index  arr.length - 1
        return [arr[index-1], arr[0]]
      return [arr[index-1], arr[index+1]]

    constructor: (items)->
      @items = items
      @active = 0

    next: ->
      adj = adjasent(@items, @active)
      console.log "remove: #{$(adj).text()}"
      $(adj[0]).removeClass 'ci-active-left'
      $(adj[1]).removeClass 'ci-active-right'
      $(@items[@active]).removeClass('ci-active')
      @active = @active + 1 
      @active = 0 if @active == @items.length
      $(@items[@active]).addClass('ci-active')
      adj = adjasent(@items, @active)
      $(adj[0]).addClass 'ci-active-left'
      $(adj[1]).addClass 'ci-active-right'
      console.log "add: #{$(adj).text()}"
      @items[@active]
    previous: ->
      adj = adjasent(@items, @active)
      $(adj[0]).removeClass 'ci-active-left'
      $(adj[1]).removeClass 'ci-active-right'
      $(@items[@active]).removeClass('ci-active')
      @active = @active - 1 
      @active = @items.length - 1 if @active < 0
      $(@items[@active]).addClass('ci-active')
      adj = adjasent(@items, @active)
      $(adj[0]).addClass 'ci-active-left'
      $(adj[1]).addClass 'ci-active-right'
      @items[@active]

    item: (index)->
      @items[index]
    
  
  return  {
    restrict: 'CE'
    scope: true
    transclude: true
    replace: false
    template: '
      blabla
      <div ng-transclude></div>
      <div class="btn" ng-click="prevSlide()">Prev</div>
      <div class="btn" ng-click="nextSlide()">Next</div>
      {{sayHi()}}
    '
    link: (scope, element)->
      scope.itemsLoop = new Loopobject(element.children()[0].children)
      $(scope.itemsLoop.items).each (i, el)->
        $(el).addClass 'carousel-item'
      scope.nextSlide = ->
        scope.itemsLoop.next()
      scope.prevSlide = ->
        scope.itemsLoop.previous()
        

      
  }

