angular.module('GinevDirectives').directive 'ginevCarousel', ['$timeout', ($timeout)->
  $e = angular.element
  carouselOptions = {
    itemWidth: 1170
    animDuration: 1000
    animInProgress: false
    textColor: 'white'
    itemBackground: 'white'
    captionTxtColor: 'white'
    captionBackground: 'black'
    animSpeedMultiplier: ->
      if window.clientInformation && window.clientInformation.userAgent.indexOf('MSIE 9') > 0
        return 80
      else
        return 5
      return 5

  }

  $($(document).find('head')[0]).append '
   <style>
    .ginev-carousel-slide{
      color: white;
      background: '+carouselOptions.itemBackground+';
      position: absolute;
      width: '+carouselOptions.itemWidth+'px;
      height: 500px;
      transition: color  1s, margin-left '+carouselOptions.animDuration/1000+'s;
      opacity: 0.5;
      color: '+carouselOptions.captionBackground+';
      text-align: center;
    }
    .active{
      opacity: 1; 
      color: '+carouselOptions.captionTxtColor+'
    }
    .ginev-carousel-slide img{
      width: 100%
    }
    .ginev-carousel-nav{
      background: url(/assets/blank.png);
      display: block;
      position: absolute;
      top: 0px;
      height: 450px;
      opacity: 0.5;
      cursor: pointer;
      width: '+($e(document.body).width()-carouselOptions.itemWidth)/2+'px;
    }
    #ginev-carousel-nav-right{
      right: 0px
    }
    #ginev-carousel-nav-left{
      margin-left: 0px;
    }
    .ginev-carousel-nav:hover{
      opacity: 1
    }
    .ginev-carousel-items-parent{
      position: relative;
      background: '+carouselOptions.itemBackground+';
      overflow: hidden;
      height: 500px;
      border-bottom: 10px solid black;
      margin-left: '+(-3*carouselOptions.itemWidth) + ($e(document.body).width()/2) + (carouselOptions.itemWidth/2)+'px
    }
    .ginev-carousel-arrow{
      margin: 10px;
      width:50px;
      height:80px;
      position: absolute;
      top: 155px;

    }
    .l-arrow{
      left: 30px;
      background: url(/assets/arrow-left.png) no-repeat center
    }
    .r-arrow{
      right:30px;
      background: url(/assets/arrow-right.png) no-repeat center
    }
  
    </style>
 '

  class window.Mover
    interval: null
    direction: 100
    moveBy: 100
    constructor: (el, options)->
      @moveBy = options.moveBy
      @margin = options.margin
      @element = el
      @move = =>
        @margin = @margin + @direction
        @element.style.marginLeft = @margin+'px'
        window.clearInterval(@interval) if (@init_margin - @margin) % @moveBy == 0 
      @moveRight = =>
        @init_margin = @margin
        window.clearInterval(@interval)
        @direction = @moveBy/carouselOptions.animSpeedMultiplier()
        @interval = setInterval(@move, 2)
      @moveLeft = =>
        @init_margin = @margin
        window.clearInterval(@interval)
        @direction = -@moveBy/carouselOptions.animSpeedMultiplier()
        @interval = setInterval(@move, 2)

  class Loopobject
    constructor: (transcluded)->
      @parent = $e(transcluded).parent()
      @itemsContainer = transcluded
      @items = []
      @first = 0 
      @last = 0  
      @active = 2    
      @itemWidth = carouselOptions.itemWidth
      $e(transcluded).each (i,el)=>
        div = document.createElement('div')
        $e(el).css {'width': @itemWidth+'px'}
        div.appendChild el
        div.className = 'ginev-carousel-slide'
        $e(div).css {'margin-left': i*@itemWidth}
        if i == @active
          $e(div).css {opacity: '1', color: carouselOptions.captionTxtColor} 
        else
          $e(div).css {opacity: '0.5', color: carouselOptions.captionBackground}
        div.mover = new window.Mover(div, {margin: i*@itemWidth, moveBy: @itemWidth})
        @items.push {id: i; element: div}
        $e(@parent).append div
      $e(@parent).addClass 'ginev-carousel-items-parent'
      $e(@parent).css 'margin-left', -(3*@itemWidth) + ($e(document.body).width()/2) + (@itemWidth/2)
      @last = @items.length-1
      #@next()
      return
    next: ->
      if !carouselOptions.animInProgress 
        lastActvive = @items[@active].element
        @active = @active + 1
        @active = @active+1-@items.length-1 if @active > @items.length-1
        newFirst = 0
        $e(@items).each (i,el)=>
          if el.id == @first
            @transition(el, lastActvive)
            $e(el.element).css 'margin-left', (@items.length-1)*@itemWidth+'px'
            el.element.mover.margin = (@items.length-1)*@itemWidth
            @last = el.id
            newFirst = el.id + 1
            newFirst = 0 if newFirst == @items.length
          else
            #$e(el.element).css 'margin-left', (@intValue( el.element, 'margin-left') - @itemWidth) + 'px'
            el.element.mover.moveLeft()
        @first = newFirst
      return
    previous: ->
      if !carouselOptions.animInProgress 
        lastActvive = @items[@active].element
        @active = @active - 1
        @active = @items.length-1 if @active < 0
        newLast = 0
        $e(@items).each (i,el)=>
          if el.id == @last
            @transition(el, lastActvive)
            $e(el.element).css 'margin-left', '0px'
            el.element.mover.margin = 0
            @first = el.id
            newLast = el.id-1
            newLast = @items.length-1 if newLast < 0
          else
            #$e(el.element).css 'margin-left', (@intValue( el.element, 'margin-left') + @itemWidth) + 'px'
            el.element.mover.moveRight()
        @last = newLast
      return
    transition: (el, lastActvive) =>
       $e(lastActvive).css {opacity: 0.5, color: carouselOptions.captionBackground}
       @beforeTransition(el)
       $timeout (=>@afterTransition(el)), carouselOptions.animDuration
    beforeTransition: (el)=>
      $e(el.element).hide()
      carouselOptions.animInProgress = true
    afterTransition: (el)=>
      $(@items[@active].element).css {opacity: 1, color: carouselOptions.captionTxtColor}
      carouselOptions.animInProgress = false
      $e(el.element).show()
    intValue: (el, key)->
      parseInt($e(el).css(key).slice(0,-2)) || 0
  return  {
    restrict: 'CA'
    scope: {}
    transclude: true
    replace: false
    template: '<div ng-transclude></div>'
    compile: (element)->
      left = document.createElement('div')
      left.className = 'ginev-carousel-nav'
      left.id = 'ginev-carousel-nav-left'
      right = document.createElement('div')
      right.className = 'ginev-carousel-nav'
      right.id = 'ginev-carousel-nav-right'
      rArrow = document.createElement 'div'
      rArrow.className = 'ginev-carousel-arrow r-arrow'
      right.appendChild rArrow
      lArrow = document.createElement 'div'
      lArrow.className = 'ginev-carousel-arrow l-arrow'
      $(lArrow).tooltip({trigger: 'hover', title:'as it turns out, making a looping carousel that works in IE8 was trickier then I thought. :)'})
      $(rArrow).tooltip({trigger: 'hover', title:'as it turns out, making a looping carousel that works in IE8 was trickier then I thought. :)'})
      left.appendChild lArrow
      $e(element).append left
      $e(element).append right 

      return (scope, element)=>
        window.items = scope.itemsLoop = new Loopobject(element.children()[0].children)
        $e(left).on "click", ->
          scope.itemsLoop.previous()
        $e(right).on "click", -> 
          scope.itemsLoop.next()
        $e(window).resize ->
          $e(items.parent).css 'margin-left', -(3*carouselOptions.itemWidth) + ($e(document.body).width()/2) + (carouselOptions.itemWidth/2)
      
  }
]

angular.module('GinevDirectives').directive 'propertyForCarousel', ()->
  $($(document).find('head')[0]).append '
    <style> 
    .ginev-carousel-prop-caption{
      -webkit-box-sizing: border-box;
      -moz-box-sizing: border-box;   
      box-sizing: border-box;        
      width: 100%;
      height: 45px;
      position: absolute;
      bottom: 0px;
      padding: 0px 50px;
      background: black;
      opacity: 0.8

    }
    </style>'
  return  {
    restrict: 'C'
    scope: {}
    template: '
      <div>
      <img ng-src="{{unit.picture}}">
      <div class="ginev-carousel-prop-caption">
        <div style="float: left"><h3>$ {{unit.price}}</h3></div>
        <div style="float: right"><h3> {{unit.address}}</h3></div>
      </div>
      </div>
    '
    link: {
      pre: (scope, element, attr)->
        scope.unit = JSON.parse attr.unit
    }
  }
