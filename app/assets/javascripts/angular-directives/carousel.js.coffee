angular.module('GinevDirectives',[]).directive 'ginevCarousel', ($timeout)->
  styles = document.createElement 'style'
  styles.innerHTML = '
    
    #test{
      transition: margin-left 1s;
      -webkit-transition: margin-left 1s;
      overflow: hidden;

    }

    #test img{
      float: left;
      width: 1170px;
      max-width: 1170px;
    }
    #active{
      transition: opacity 0.5s;
      -webkit-transition: opacity 0.5s;
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

    constructor: (items)->
      @itemsContainer = items
      @items = []
      for el, i in items.children
        @items[i] = el
      
      @itemsContainer.innerHTML = ''
      for el, i in @items
        @itemsContainer.appendChild el

      

    next: (scope)->
      @items.push(@items.shift())
      for el, i in @items
        console.log el
        $('#test').append el
      margin = $('#test').css('margin-left').slice(0,-2)
      margin = parseInt(margin) - 1170
      $('#test').attr('style', 'margin-left:'+ margin+'px')
      

      console.log @itemsContainer
    previous: ->
      margin = $('#test').css('margin-left').slice(0,-2)
      console.log margin
      margin = parseInt(margin) + 1170
      $('#test').attr('style', 'margin-left:'+ margin+'px')
    
  return  {
    restrict: 'CE'
    scope: {caption: '='}
    transclude: true
    replace: false
    template: '
      <div id="carosel-container" style="position: relative; overflow: hidden; height: 400px; width: 10000px">
        <div ng-transclude id="test" style="margin-left:-{{1170-maskWidth}}px">
      </div>
      <div  style="opacity: 0.5; width: {{maskWidth}}px; position: absolute; left: 0px; height: 100%; background: white; top:0px">
        <img style="margin-top: 150px; "ng-click="prevSlide()" src="assets/arrow-left.png" width="100px" height="100px">
      </div>
      <div id="active" style="opacity: {{activeOpacity}};  width: 1170px; position: absolute; left: {{maskWidth}}px; height: 100%; background: white; top:0px">
      </div>
      <div style="opacity: 0.5;  width: {{maskWidth}}px; position: absolute; left: {{1170+maskWidth}}px; height: 100%; background: white; top:0px">
        <img style="margin-top: 150px; float:right"ng-click="nextSlide()" src="assets/arrow-right.png" width="100px" height="100px">
        </div>
      <div style="position: absolute; bottom: 0px; width:100%; height:45px; background: black; opacity: .8;">
        <h3><div style="margin-left: {{maskWidth}}px; width: 1170px; margin-right: 20px; color: white"> 12 Main Str.<div class="pull-right">$5555555 </div></div> </h3>
      </div>
      </div>
           
    '
    link: (scope, element)->
      scope.maskWidth = (document.width-1170)/2
      scope.itemsLoop = new Loopobject(element.children()[0].children[0])
      scope.activeOpacity = 0
      
      $(window).resize ->
        scope.maskWidth = (document.width-1170)/2
        scope.$apply()          
      scope.nextSlide = ->
        scope.activeOpacity = 0.5
        button = event.target
        $(button).hide()
        $timeout ->
          scope.activeOpacity = 0
          $(button).show()
        , 1000
        scope.itemsLoop.next(scope)

      scope.prevSlide = ->
        button = event.target
        $(button).hide()
        scope.activeOpacity = 0.5
        $timeout ->
          scope.activeOpacity = 0
          $(button).show()
        , 1000
        scope.itemsLoop.previous()
        

      
  }

