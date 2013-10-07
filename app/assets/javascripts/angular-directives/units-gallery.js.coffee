@angular.module('GinevDirectives')
  .directive 'reUnitsGallery',($timeout)->
    restrict: 'AC'

    scope: {
      units: '='
      openUnit: '&'
      progressBar: '='
      

    }
    template: '
    <div>
      <div ng-repeat="unit in page_units" class="units_gallery_inner" style="margin: 5px; float: left" >
        <div re-unit unit="unit" on-unit-clicked = "open_unit" unit-width ="unit.width"></div>
      </div>
    </div>
    '
    compile: (element, attrs)->
      
      return (scope, element, attrs)->
        scope.$watch 'units',  ->
          if scope.units.length > 0
            scope.page_units = scope.units
        scope.$watch 'page_units.length',  ->
          $(element).hide()
          $(element).show(
            duration: 300
            effect: 'fade'
            complete:->
              $('body').animate(
                'scrollTop':'80'
                duration: 1500
              )
            )

        
      

  
         
       