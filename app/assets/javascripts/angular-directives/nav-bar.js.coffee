angular.module('GinevDirectives').directive 'navigation', ->
  $($(document).find('head')[0]).append '
    <style> 
    .ginev-navigation1{
      height: 50px;
      border: 0px 4px solid;
    }
    .ginev-navigation1 .navigation-item{
      height: 30px;
      margin-top: 10px;
      float: left;
      padding-top: 10px;
      padding-bottom: 5px;
      font-size: large;
      text-align: center
    }
    
    </style>'
  active = null

  restrict: 'CA'
  transclude: true
  replace: false
  template: '
    <div ng-transclude class="ginev-navigation1">
  '
    
  link: (scope, element)->
    elements = element.children()[0].children.length
    for el, i in element.children()[0].children
      if $(el).attr('active')
        active = el
      $(el).on 'click', ()->
        oldActiveContent =  $(active).data 'content'
        $(oldActiveContent).css 'display', 'none'
        for ch, i in element.children()[0].children
          $(ch).css {'background-color': '#dfdfdf'}
        $(this).css {'background-color': '#f0f0f0'}  
        active = @
        $($(this).data 'content').css 'display', 'block'
      if i == 0
        active = el
        $($(el).data 'content').css 'display', 'block'
        $(el).css {'background-color': '#f0f0f0','width': Math.floor((element.width()/elements))+(element.width()-Math.floor((element.width()/elements))*elements)+'px'}
      else
        $(el).css {'width': Math.floor((element.width()/elements))+'px'}  
      $(el).addClass 'navigation-item'
   
